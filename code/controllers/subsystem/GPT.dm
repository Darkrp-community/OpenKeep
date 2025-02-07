#define GPT_ACTION_TIMEOUT 60
#define GPT_ROLE_TIMEOUT 600
#define GPT_TALK_CHECK_TIMEOUT 150  // _NEW: Added constant for talk-check interval_
#define GPT_STATUS_TIMEOUT 1200

///////////////////////////////////////////////////////////////
// Utility: Join a list of strings with a given delimiter
///////////////////////////////////////////////////////////////
proc/text_join(var/list/L, var/delimiter = "\n")
	var/result = ""
	var/idx = 1
	var/count = L.len
	for(var/entry in L)
		result += "[entry]"
		if(idx < count)
			result += "[delimiter]"
		idx++
	return result

///////////////////////////////////////////////////////////////
// Utility: Strip specific characters from a string
///////////////////////////////////////////////////////////////
proc/strip_chars(var/string, var/remove = "() ")
	var/newstr = ""
	var/len = length(string)
	for(var/i = 1 to len)
		var/c = copytext(string, i, i+1)
		// If c is NOT in remove-list, keep it
		if(!findtext_char(remove, c))
			newstr += c
	return newstr

/mob/living/carbon/human
	////////////////////////////////////////////////////////////
	//  A) Vars for GPT
	////////////////////////////////////////////////////////////
	var
		gpt_enabled = TRUE  // set TRUE if you want GPT AI
		// Times (in ticks) for GPT calls
		gpt_action_interval = GPT_ACTION_TIMEOUT  // ~5 seconds
		gpt_role_interval   = GPT_ROLE_TIMEOUT   // ~30 seconds
		gpt_status_interval = GPT_STATUS_TIMEOUT  // ~120 seconds
		next_gpt_action_call = 0
		next_gpt_role_call = 0
		next_gpt_status_call = 0

		// _NEW: Variables for GPT talking_
		_gpt_talk_enabled = TRUE   // _NEW: Enable GPT talking_
		_gpt_talk_check_interval = GPT_TALK_CHECK_TIMEOUT   // _NEW: Interval for talk-check calls_
		_next_gpt_talk_check_call = 0   // _NEW: Next tick to check for talk_

		// The short persona text we get from the "role" prompt
		gpt_personality = ""

		// We'll store recent lines of chat
		list/gpt_say_logs = list()
		list/say_logs_around = list()

		// Occupant map for environment
		list/gpt_occupant_map = list()

		// Where we store GPT's next command
		gpt_pending_cmd = ""
		gpt_pending_args = ""

		// Endpoint URLs (change IP/port as needed)
		gpt_api_url_action = "http://127.0.0.1:5000/npc_gpt"
		gpt_api_url_role   = "http://127.0.0.1:5000/npc_role"
		// _NEW: Endpoints for GPT talking_
		_gpt_api_url_talk_check = "http://127.0.0.1:5000/npc_talk_check"   // _NEW_
		_gpt_api_url_talk = "http://127.0.0.1:5000/npc_talk"   // _NEW_

	////////////////////////////////////////////////////////////
	// Overriding process_ai to do synchronous calls
	////////////////////////////////////////////////////////////
	proc/process_ai_gpt()
		// If time to refresh role
		if(world.time >= next_gpt_role_call)
			next_gpt_role_call = world.time + gpt_role_interval
			call_gpt_role_sync()

		// If time for an action prompt
		if(world.time >= next_gpt_action_call)
			next_gpt_action_call = world.time + gpt_action_interval
			call_gpt_action_sync()

		// _NEW: Check if it’s time to evaluate whether to talk_
		if(_gpt_talk_enabled && world.time >= _next_gpt_talk_check_call)
			_next_gpt_talk_check_call = world.time + _gpt_talk_check_interval
			call_gpt_talk_check_sync()

		// If we have a pending command from GPT, run it
		if(gpt_pending_cmd != "")
			world.log << "[src]: EXECUTING COMMAND: [gpt_pending_cmd] [gpt_pending_args]"
			handle_gpt_command(gpt_pending_cmd, gpt_pending_args)
			gpt_pending_cmd = ""
			gpt_pending_args = ""

	////////////////////////////////////////////////////////////
	//  C) Build the Action Prompt
	////////////////////////////////////////////////////////////
	proc/build_action_prompt()
		var/env_snapshot = gather_gpt_environment_snapshot(5, TRUE)
		var/commandlog_text = text_join(gpt_say_logs, "\n")
		var/saylog_text = text_join(say_logs_around, "\n")

		// Combine our existing 'personality' + environment + instructions
		var/prompt = ""
		prompt += "YOU ARE: [src.real_name]\n"
		prompt += "YOUR PERSONALITY:[gpt_personality]\n\n"
		prompt += "\nRECENT SPEECH: \n[saylog_text]\n\n"
		prompt += "ENVIRONMENT (11x11 around me):\n"
		prompt += "[env_snapshot]\n"
		// Use stringified keys (e.g., "1" for LOG_ATTACK)
		var/attack_key = num2text(LOG_ATTACK)

		prompt += "RECENT ATTACKS:\n"
		if(islist(logging[attack_key]))
			var/list/attacks = logging[attack_key]
			if(attacks.len > 20)
				attacks.Cut(1, attacks.len - 19)
			for(var/entry in attacks[attack_key])
				world.log << "[entry]: entry"
				world.log << "[attacks[attack_key][entry]]: entry1"
				prompt += "[entry]: [attacks[attack_key][entry]]\n"
		else
			prompt += "None.\n"

		prompt += "\nENEMIES: \n[text_join(enemies, "\n")]\n\n"
		prompt += "YOUR RECENT ACTIONS:\n[commandlog_text]\n\n"
		prompt += "You can ONLY RESPOND in JSON:\n"
		prompt += "{\"command\":\"COMMAND\",\"args\":\"ARG\"}\n"
		prompt += "Valid commands: goto, pickup, interact, draw, retaliate, follow, deaggro, drop, lock.\n"
		prompt += " - goto => '(dx,dy)'\n"
		prompt += " - pickup => '(dx,dy), (object name)'\n"
		prompt += " - interact => '(dx,dy), (object name)'\n"
		prompt += " - draw => '(object name)'\n"
		prompt += " - retaliate => '#ID'\n"
		prompt += " - follow => '#ID'\n"
		prompt += " - deaggro => stop fighting\n"
		prompt += " - drop => drop held item\n"
		prompt += " - lock => lock/unclock door/closet/pillory\n\n"
		prompt += "What do you do?\n"

		return prompt

	////////////////////////////////////////////////////////////
	// _NEW: Build the Talk Check Prompt_
	////////////////////////////////////////////////////////////
	proc/build_talk_check_prompt()   // _NEW_
		var/env_snapshot = gather_gpt_environment_snapshot(3)   // _NEW_
		var/saylog_text = text_join(say_logs_around, "\n")   // _NEW_
		var/prompt = ""   // _NEW_
		prompt += "YOU ARE: [src.real_name]\n"
		prompt += "YOUR PERSONALITY: [gpt_personality]\n\n"   // _NEW_
		prompt += "RECENT SPEECH: \n[saylog_text]\n\n"   // _NEW_
		prompt += "ENVIRONMENT (11x11 around me):\n[env_snapshot]\n\n"   // _NEW_
		prompt += "Based on the current context, do you need to say something to interact with someone? "   // _NEW_
		prompt += "Answer ONLY with YES or NO.\n"   // _NEW_
		return prompt   // _NEW_

	////////////////////////////////////////////////////////////
	// _NEW: Build the Talk Prompt_
	////////////////////////////////////////////////////////////
	proc/build_talk_prompt()   // _NEW_
		var/env_snapshot = gather_gpt_environment_snapshot(5)   // _NEW_
		var/saylog_text = text_join(say_logs_around, "\n")   // _NEW_
		var/prompt = ""   // _NEW_
		prompt += "YOU ARE: [src.real_name]\n"
		prompt += "YOUR PERSONALITY: [gpt_personality]\n\n"   // _NEW_
		prompt += "RECENT SPEECH: \n[saylog_text]\n\n"   // _NEW_
		prompt += "ENVIRONMENT (11x11 around me):\n[env_snapshot]\n\n"   // _NEW_
		prompt += "Generate a natural dialogue line for the NPC based on the above context. "   // _NEW_
		prompt += "Return ONLY the text, with no JSON formatting.\n"   // _NEW_
		return prompt   // _NEW_

	////////////////////////////////////////////////////////////
	//  D) Build the Role Prompt
	////////////////////////////////////////////////////////////
	proc/build_role_prompt()
		/*
		  If your codebase doesn’t have assigned_role, real_name,
		  species, contents, health, define them or adapt as needed.
		*/
		var/role_info = ""
		role_info += "YOU ARE: [src.real_name]\n"
		role_info += "Personality: [gpt_personality]\n"
		role_info += "Assigned Role: [mind?.assigned_role]\n"
		role_info += "Real Name: [real_name]\n"
		role_info += "Species: [dna.species]\n"
		role_info += "Health: [health]\n"
		role_info += "Inventory: [contents]\n"
		role_info += "Look and clothing: [text_join(src.examine(src), "\n")]\n"

		var/commandlog_text = text_join(gpt_say_logs, "\n")
		role_info += "YOUR RECENT ACTIONS:\n[commandlog_text]\n\n"
		var/saylog_text = text_join(say_logs_around, "\n")

		var/attack_key = num2text(LOG_ATTACK)

		role_info += "RECENT ATTACKS:\n"
		if(islist(logging[attack_key]))
			var/list/attacks = logging[attack_key]
			if(attacks.len > 20)
				attacks.Cut(1, attacks.len - 19)
			for(var/entry in attacks[attack_key])
				world.log << "[entry]: entry"
				world.log << "[attacks[attack_key][entry]]: entry1"
				role_info += "[entry]: [attacks[attack_key][entry]]\n"
		else
			role_info += "None.\n"

		role_info += "\nRECENT SPEECH: \n[saylog_text]\n\n"

		var/prompt = ""
		prompt += "Create a short description of an NPC in a medieval fantasy environment. Base on the Personality if there is any. Add short summary of their last interactions.\n"
		prompt += "[role_info]\n\n"
		prompt += "Return ONLY the text. No extra JSON.\n"

		return prompt

	////////////////////////////////////////////////////////////
	//  E) Synchronous call to action endpoint
	////////////////////////////////////////////////////////////
	proc/call_gpt_action_sync()
		var/prompt_text = build_action_prompt()
		var/url = "[gpt_api_url_action]?prompt=[url_encode(prompt_text)]"
		var/list/http_result = world.Export(url, "GET")
		if(!http_result)
			world.log << "[src]: GPT action request failed! No result."
			return
		var/status = http_result["STATUS"]
		if(!status || copytext(status, 1, 4) != "200")
			world.log << "[src]: GPT action request returned status [status]."
			return
		var/content_file = http_result["CONTENT"]
		if(!content_file)
			world.log << "[src]: GPT action request had no CONTENT!"
			return
		var/raw_response = file2text(content_file)
		var/raw_response_fixed = replacetext_char(raw_response, "\\\"", "\"")
		raw_response = raw_response_fixed
		// optional trim() if you have it, or define your own
		// raw_response = trim(raw_response)
		world.log << "[src]: Received GPT action response: [raw_response]"
		var/json_start = findtext_char(raw_response, "{", 1)
		if(!json_start)
			world.log << "[src]: No '{' found in GPT response!"
			return
		var/json_end = get_last_brace_index(raw_response)
		if(!json_end || json_end < json_start)
			world.log << "[src]: No '}' found in GPT response, or it's before '{'!"
			return
		var/json_text = copytext_char(raw_response, json_start, json_end+1)
		var/command = ""
		var/argument = ""
		var/cpos = findtext_char(json_text, "\"command\":", 1)
		if(cpos)
			var/startc = findtext(json_text, "\"", cpos+10)
			var/endc   = findtext(json_text, "\"", startc+1)
			if(startc && endc)
				command = copytext(json_text, startc+1, endc)
		var/apos = findtext(json_text, "\"args\":", 1)
		if(apos)
			var/starta = findtext(json_text, "\"", apos+6)
			var/enda   = findtext_char(json_text, "\"", starta+1)
			if(starta && enda)
				argument = copytext_char(json_text, starta+1, enda)
		if(!command)
			command = "say"
		if(!argument)
			argument = "..."
		gpt_pending_cmd = command
		gpt_pending_args = argument
		world.log << "[src]: Command=[command], args=[argument] stored."

	proc/get_last_brace_index(var/text)
		var/L = length(text)
		while(L > 0)
			if(copytext(text, L, L+1) == "}")
				return L
			L--
		return 0  // not found

	////////////////////////////////////////////////////////////
	//  F) Synchronous call to role endpoint
	////////////////////////////////////////////////////////////
	proc/call_gpt_role_sync()
		var/prompt_text = build_role_prompt()
		var/url = "[gpt_api_url_role]?prompt=[url_encode(prompt_text)]"
		var/list/http_result = world.Export(url, "GET")
		if(!http_result)
			world.log << "[src]: GPT role request failed! No result."
			return
		var/status = http_result["STATUS"]
		if(!status || copytext(status, 1, 4) != "200")
			world.log << "[src]: GPT role request returned status [status]."
			return
		var/content_file = http_result["CONTENT"]
		if(!content_file)
			world.log << "[src]: GPT role request had no CONTENT!"
			return
		var/raw_response = file2text(content_file)
		world.log << "[src]: Received GPT role response:\n[raw_response]"
		gpt_personality = raw_response

///////STATUS GPT
	proc/call_gpt_status_sync()
		var/url = "[_gpt_api_url_talk_check]?prompt=[url_encode("check status")]"
		var/list/http_result = world.Export(url, "GET")
		if(!http_result)
			world.log << "[src]: GPT status request failed! No result."
			return
		var/status = http_result["STATUS"]
		if(!status || copytext(status, 1, 4) != "200")
			world.log << "[src]: GPT status request returned status [status]."
			gpt_enabled = FALSE
		else
			gpt_enabled = TRUE

	////////////////////////////////////////////////////////////
	// _NEW: Synchronous call to talk check endpoint_
	////////////////////////////////////////////////////////////
	proc/call_gpt_talk_check_sync()   // _NEW_
		var/prompt_text = build_talk_check_prompt()   // _NEW_
		var/url = "[_gpt_api_url_talk_check]?prompt=[url_encode(prompt_text)]"   // _NEW_
		var/list/http_result = world.Export(url, "GET")   // _NEW_
		if(!http_result)
			world.log << "[src]: GPT talk check request failed! No result."
			return
		var/status = http_result["STATUS"]
		if(!status || copytext(status, 1, 4) != "200")
			world.log << "[src]: GPT talk check request returned status [status]."
			return
		var/content_file = http_result["CONTENT"]
		if(!content_file)
			world.log << "[src]: GPT talk check request had no CONTENT!"
			return
		var/raw_response = file2text(content_file)
		raw_response = replacetext_char(raw_response, "\\\"", "\"")
		world.log << "[src]: Received GPT talk check response: [raw_response]"
		if(uppertext(raw_response) == "YES")
			call_gpt_talk_sync()

	////////////////////////////////////////////////////////////
	// _NEW: Synchronous call to talk endpoint_
	////////////////////////////////////////////////////////////
	proc/call_gpt_talk_sync()   // _NEW_
		var/prompt_text = build_talk_prompt()
		var/url = "[_gpt_api_url_talk]?prompt=[url_encode(prompt_text)]"
		var/list/http_result = world.Export(url, "GET")
		if(!http_result)
			world.log << "[src]: GPT talk request failed! No result."
			return
		var/status = http_result["STATUS"]
		if(!status || copytext(status, 1, 4) != "200")
			world.log << "[src]: GPT talk request returned status [status]."
			return
		var/content_file = http_result["CONTENT"]
		if(!content_file)
			world.log << "[src]: GPT talk request had no CONTENT!"
			return
		var/raw_response = file2text(content_file)
		raw_response = replacetext_char(raw_response, "\\\"", "\"")
		world.log << "[src]: Received GPT talk response: [raw_response]"
		say(raw_response)

	////////////////////////////////////////////////////////////
	//  G) handle_gpt_command
	////////////////////////////////////////////////////////////
	proc/handle_gpt_command(var/cmd, var/cmd_args)
		world.log << "in the command queue: [cmd] [cmd_args]"
		var/result = ""
		if(gpt_say_logs.len > 20)
			gpt_say_logs.Cut(1,2)
		if(cmd == "goto")
			var/list/coords = parse_relative_coords(cmd_args)
			if(coords.len == 2)
				result = step_gpt(coords[1], coords[2])
		else if(cmd == "pickup")
			var/comma_pos = findtext_char(cmd_args, " ", 1)
			var/object_name = copytext_char(cmd_args, comma_pos+1)
			var/coords_string = copytext(cmd_args, 1, comma_pos-1)
			var/list/coords = parse_relative_coords(coords_string)
			if(coords.len == 2)
				result = pickup_gpt(coords[1], coords[2], object_name)
		else if(cmd == "interact")
			var/comma_pos = findtext_char(cmd_args, " ", 1)
			var/object_name = copytext_char(cmd_args, comma_pos+1)
			var/coords_string = copytext(cmd_args, 1, comma_pos-1)
			var/list/coords = parse_relative_coords(coords_string)
			if(coords.len == 2)
				result = interact_gpt(coords[1], coords[2], object_name)
		else if(cmd == "draw")
			for(var/obj/item/I in contents)
				if(I.name == cmd_args)
					result = put_in_active_hand(I)
		else if(cmd == "lock")
			var/list/coords = parse_relative_coords(cmd_args)
			if(coords.len == 2)
				result = lock_gpt(coords[1], coords[2])
		else if(cmd == "say")
			result = say("[cmd_args]")
		else if(cmd == "retaliate")
			var/mob/living/target_mob = gpt_occupant_map[cmd_args]
			if(target_mob)
				result = retaliate(target_mob)
			else
				visible_message("[src] growls at the air, no target found.")
		else if(cmd == "follow")
			var/mob/living/target_mob = gpt_occupant_map[cmd_args]
			if(target_mob)
				walk_to(src,target_mob,0,update_movespeed())
				result = 1
				addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, return_action)), 10 SECONDS)
			else
				visible_message("[src] growls at the air, no target found.")
		else if(cmd == "deaggro")
			back_to_idle()
			target = null
			enemies = list()
		else if(cmd == "drop")
			src.dropItemToGround(src.get_active_held_item())
		else
			visible_message("[src] looks confused (unknown command).")
		gpt_say_logs += "[src]: Command:[cmd] Args:[cmd_args] Result:[result]"

	proc/return_action()
		walk(src, 0)

	////////////////////////////////////////////////////////////
	//  H) step_gpt to move the mob
	////////////////////////////////////////////////////////////
	proc/step_gpt(var/dx, var/dy)
		var/turf/dest = locate(x + dx, y + dy, z)
		if(dest)
			return walk2derpless(dest)
		else
			emote("bumps into unseen rubble.")
			return 0

	proc/pickup_gpt(var/dx, var/dy, var/object_name)
		var/turf/dest = locate(x + dx, y + dy, z)
		if(dest)
			if(walk2derpless(dest))
				for(var/obj/item/I in dest)
					if(I.name == object_name)
						addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, pickup_action), I), 3 SECONDS)
						return 1
					else
						emote("can't pick up [I.name].")
						return 0
			else
				return "unreachable"
		else
			emote("bumps into unseen rubble.")
			return 0

	proc/interact_gpt(var/dx, var/dy, var/object_name)
		var/turf/dest = locate(x + dx, y + dy, z)
		if(dest)
			if(walk2derpless(dest))
				for(var/obj/structure/I in dest)
					if(I.name == object_name)
						addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, interact_action), I), 3 SECONDS)
						return 1
					else
						emote("can't interact with [I.name].")
						return 0
			else
				return "unreachable"
		else
			emote("bumps into unseen rubble.")
			return 0

	proc/lock_gpt(var/dx, var/dy)
		var/turf/dest = locate(x + dx, y + dy, z)
		if(dest)
			var/obj/structure/mineral_door/MD = locate() in dest
			var/obj/structure/pillory/PL = locate() in dest
			var/obj/structure/closet/CL = locate() in dest
			walk2derpless(dest)
			var/list/lock_ids = list()
			for(var/obj/item/roguekey/K in contents)
				lock_ids += K.lockid
			if(MD && (MD.lockid in lock_ids))
				addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, open_action), MD), 2 SECONDS)
				return 1
			if(PL && (("garrison" in lock_ids) || ("dungeoneer" in lock_ids)))
				addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, open_action), PL), 2 SECONDS)
				return 1
			if(CL && (CL.lockid in lock_ids))
				addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, open_action), CL), 2 SECONDS)
				return 1
		else
			emote("bumps into unseen rubble.")
			return 0

	proc/open_action(var/obj/structure/to_open)
		if(to_open.Adjacent(src))
			if(istype(to_open, /obj/structure/pillory))
				var/obj/structure/pillory/PL = to_open
				PL.togglelock(src)
				gpt_say_logs += "You used keys on the pillory. It is now [PL.locked]"
			if(istype(to_open, /obj/structure/closet))
				var/obj/structure/closet/C = to_open
				if(C.locked)
					C.open()
				else
					C.close()
				C.locked = !C.locked
				gpt_say_logs += "You used keys on the closet. It is now [C.locked]"
			if(istype(to_open, /obj/structure/mineral_door))
				var/obj/structure/mineral_door/D = to_open
				D.force_open()
				D.locked = FALSE
				gpt_say_logs += "You used keys on the door. It is now [D.locked]"

	proc/pickup_action(var/obj/item/to_pick)
		if(to_pick.Adjacent(src))
			to_pick.attack_hand(src)
			gpt_say_logs += "You picked up the [to_pick]."
			to_pick.equip_to_best_slot(src)

	proc/interact_action(var/obj/to_interact)
		if(to_interact.Adjacent(src))
			var/obj/item/I = src.get_active_held_item()
			if(I)
				to_interact.attackby( I, src)
			else
				to_interact.attack_hand(src)
			if(istype(to_interact, /obj/structure/mineral_door))
				var/obj/structure/mineral_door/D = to_interact
				if(D.locked)
					open_action(D)

	////////////////////////////////////////////////////////////
	//  I) Gather environment in a 7x7
	////////////////////////////////////////////////////////////
	proc/gather_gpt_environment_snapshot(var/radius = 7,var/occupant_check = FALSE)
		if(occupant_check)
			gpt_occupant_map = list()
		var/id_counter = 1
		var/id_str = "#[id_counter]"
		var/result = ""
		var/result_short = ""
		var/list/occupants = list()
		for(var/y_offset in -radius to radius)
			result += "\n"
			result_short += "\n"
			for(var/x_offset in -radius to radius)
				var/dx = x_offset
				var/dy = y_offset
				var/turf/T = locate(x + dx, y + dy, z)
				if(!T)
					result += "|| ([dx],[dy]): ??"
					result_short += "|| ??"
				else
					result += "|| ([dx],[dy]) "
					result_short += "|| [T.name]"
				var/objects = ""
				for(var/obj/A in T)
					objects += " [A.name]"
				if(objects != "")
					result += " Objects:" + objects + "."
				var/mob/living/occupant = null
				for(var/mob/living/L in T)
					occupant = L
					if(occupant && occupant != src)
						if(occupant_check)
							gpt_occupant_map[id_str] = occupant
						result += " Occupant [id_str] = \"[occupant.name]\" /"
						result_short += " Occupant [id_str] = \"[occupant.name]\" /"
						occupants |= occupant
						id_counter++
						id_str = "#[id_counter]"
					else if(occupant == src)
						result += "/ I am here "
						result_short += "/ I am here "
		result += "\n"
		var/mob/living/mob = null
		for(var/mob/living/L in view(7, src))
			mob = L
			if(mob && mob != src && !(mob in occupants))
				if(occupant_check)
					gpt_occupant_map[id_str] = mob
				occupants |= mob
				id_counter++
				id_str = "#[id_counter]"
		for(var/mob/living/occupant in occupants)
			result += " Occupant [occupant.name] looks [text_join(occupant.examine(src), "\n")] \n"
		result_short += "\n" + result
		return result_short

	////////////////////////////////////////////////////////////
	//  J) parse_relative_coords
	//   e.g. "(1,-2)" => list(1, -2)
	////////////////////////////////////////////////////////////
	proc/parse_relative_coords(var/xy)
		var/clean = strip_chars(xy, "() ")
		var/list/parts = splittext(clean, ",")
		if(parts.len < 2)
			return list()
		var/dx = text2num(parts[1])
		var/dy = text2num(parts[2])
		return list(dx, dy)

	proc/configure_mind()
		if(!mind)
			mind = new /datum/mind(src)
			mind.current = src

	////////////////////////////////////////////////////////////
	//  K) Overriding Hear() to store last 10 lines
	////////////////////////////////////////////////////////////
	Hear(message, atom/movable/speaker, datum/language/message_language, raw_message, radio_freq, list/spans, message_mode)
		say_logs_around += "[speaker.name]: [raw_message]"
		if(say_logs_around.len > 40)
			say_logs_around.Cut(1,2)
		..()

	show_message(msg, type, alt_msg, alt_type) // Message, type (1 or 2), alternative message, alt message type (1 or 2)
		if(!client)
			say_logs_around += "AROUND: [msg]"
			if(say_logs_around.len > 40)
				say_logs_around.Cut(1,2)
		..()



//NPC
/mob/living/carbon/human/species/human/northern/npc
	var/datum/outfit/job/roguetown/outfit = null
	var/job_name = ""

/mob/living/carbon/human/species/human/northern/npc
	aggressive=0
	mode = AI_IDLE
	faction = list("bums", "station")
	ambushable = FALSE
	dodgetime = 3 SECONDS
	flee_in_pain = TRUE
	possible_rmb_intents = list()

	wander = FALSE
	var/outlaw

/mob/living/carbon/human/species/human/northern/npc/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	. = ..()

/mob/living/carbon/human/species/human/northern/npc/Initialize()
	. = ..()
	set_species(/datum/species/human/northern)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/human/northern/npc/after_creation()
	..()
	job = job_name
	QDEL_NULL(sexcon)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	configure_mind()
	equipOutfit(outfit)

/mob/living/carbon/human/species/human/northern/npc/servant
	job_name = "Servant"
	outfit = new /datum/outfit/job/roguetown/servant

/mob/living/carbon/human/species/human/northern/npc/farmer
	job_name = "Soilson"
	outfit = new /datum/outfit/job/roguetown/farmer

/mob/living/carbon/human/species/human/northern/npc/watchman
	job_name = "Watchman"
	outfit = new /datum/outfit/job/roguetown/watchman

/mob/living/carbon/human/species/human/northern/npc/prisoner
	job_name = "Prisoner"
	outfit = new /datum/outfit/job/roguetown/prisoner

/mob/living/carbon/human/species/human/northern/npc/jester
	job_name = "Jester"
	outfit = new /datum/outfit/job/roguetown/jester

/mob/living/carbon/human/species/human/northern/npc/acolyte
	job_name = "Acolyte"
	outfit = new /datum/outfit/job/roguetown/acolyte

/mob/living/carbon/human/species/human/northern/npc/wench
	job_name = "Bath Wench"
	outfit = new /datum/outfit/job/roguetown/nitemaiden
