GLOBAL_LIST_EMPTY(outlawed_players)
GLOBAL_LIST_EMPTY(lord_decrees)
GLOBAL_LIST_INIT(laws_of_the_land, initialize_laws_of_the_land())

/proc/initialize_laws_of_the_land()
	var/list/laws = strings("laws_of_the_land.json", "lawsets")
	var/list/lawsets_weighted = list()
	for(var/lawset_name as anything in laws)
		var/list/lawset = laws[lawset_name]
		lawsets_weighted[lawset_name] = lawset["weight"]
	var/chosen_lawset = pickweight(lawsets_weighted)
	return laws[chosen_lawset]["laws"]

/obj/structure/roguemachine/titan
	name = "THROAT"
	desc = "He who wears the crown holds the key to this strange thing. If all else fails, demand the \"Secrets of the Throat!\""
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = ""
	density = FALSE
	blade_dulling = DULLING_BASH
	integrity_failure = 0.5
	max_integrity = 0
	flags_1 = HEAR_1
	anchored = TRUE
	var/mode = 0


/obj/structure/roguemachine/titan/obj_break(damage_flag)
	..()
	cut_overlays()
//	icon_state = "[icon_state]-br"
	set_light(0)
	return

/obj/structure/roguemachine/titan/Destroy()
	set_light(0)
	..()

/obj/structure/roguemachine/titan/Initialize()
	. = ..()
	icon_state = null
//	var/mutable_appearance/eye_lights = mutable_appearance(icon, "titan-eyes")
//	eye_lights.plane = ABOVE_LIGHTING_PLANE //glowy eyes
//	eye_lights.layer = ABOVE_LIGHTING_LAYER
//	add_overlay(eye_lights)
	set_light(5)

/obj/structure/roguemachine/titan/Hear(message, atom/movable/speaker, message_language, raw_message, radio_freq, list/spans, message_mode)
//	. = ..()
	if(speaker == src)
		return
	if(speaker.loc != loc)
		return
	if(obj_broken)
		return
	if(!ishuman(speaker))
		return
	var/mob/living/carbon/human/H = speaker
	var/nocrown = TRUE
	if(H.head)
		if(istype(H.head, /obj/item/clothing/head/roguetown/crown/serpcrown))
			nocrown = FALSE
	var/notlord
	if(SSticker.rulermob != H)
		notlord = TRUE
	var/message2recognize = sanitize_hear_message(raw_message)

	if(mode)
		if(findtext(message2recognize, "nevermind"))
			mode = 0
			return

	switch(mode)
		if(0)
			if(findtext(message2recognize, "secrets of the throat"))
				say("My commands are: Make Announcement, Make Decree, Make Law, Remove Law, Purge Laws, Declare Outlaw, Set Taxes, Change Position, Summon Crown, Nevermind")
				playsound(src, 'sound/misc/machinelong.ogg', 100, FALSE, -1)
			if(findtext(message2recognize, "make announcement"))
				if(nocrown)
					say("You need the crown.")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(!SScommunications.can_announce(H))
					say("I must gather my strength!")
					return
				say("Speak and they will listen.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 1
				return
			if(findtext(message2recognize, "make decree"))
				if(!SScommunications.can_announce(H))
					say("I must gather my strength!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Speak and they will obey.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 2
				return
			if(findtext(message2recognize, "make law"))
				if(!SScommunications.can_announce(H))
					say("I must gather my strength!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Speak and they will obey.")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				mode = 4
				return
			if(findtext(message2recognize, "remove law"))
				if(!SScommunications.can_announce(H))
					say("I must gather my strength!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				var/message_clean = replacetext(message2recognize, "remove law", "")
				var/law_index = text2num(message_clean) || 0
				if(!law_index || !GLOB.laws_of_the_land[law_index])
					say("That law doesn't exist!")
					return
				say("That law shall be gone!")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				remove_law(law_index)
				return
			if(findtext(message2recognize, "purge laws"))
				if(!SScommunications.can_announce(H))
					say("I must gather my strength!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("All laws shall be purged!")
				playsound(src, 'sound/misc/machineyes.ogg', 100, FALSE, -1)
				purge_laws()
				return
			if(findtext(message2recognize, "declare outlaw"))
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("Who should be outlawed?")
				playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
				mode = 3
				return
			if(findtext(message2recognize, "set taxes"))
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				say("The new tax percent shall be...")
				playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				give_tax_popup(H)
				return
			if(findtext_char(message2recognize, "change position"))
				if(notlord || nocrown)
					say("You are not my master!")
					playsound(src, 'sound/misc/machineno.ogg', 100, FALSE, -1)
					return
				playsound(src, 'sound/misc/machinequestion.ogg', 100, FALSE, -1)
				give_job_popup(H)
				return
			if(findtext(message2recognize, "summon crown"))
				if(SSroguemachine.crown)
					var/obj/item/clothing/head/roguetown/crown/serpcrown/I = SSroguemachine.crown
					if(!I)
						I = new /obj/item/clothing/head/roguetown/crown/serpcrown(src.loc)
					if(ishuman(I.loc))
						var/mob/living/carbon/human/HC = I.loc
						if(HC.stat != DEAD)
							if(I in HC.held_items)
								say("[HC.real_name] holds the crown!")
								playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
								return
							if(H.head == I)
								say("[HC.real_name] wears the crown!")
								playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
								return
					I.forceMove(src.loc)
					say("The crown is summoned!")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					playsound(src, 'sound/misc/hiss.ogg', 100, FALSE, -1)
		if(1)
			make_announcement(H, raw_message)
			mode = 0
		if(2)
			make_decree(H, raw_message)
			mode = 0
		if(3)
			make_outlaw(H, raw_message)
			mode = 0
		if(4)
			make_law(H, raw_message)
			mode = 0

/obj/structure/roguemachine/titan/proc/give_tax_popup(mob/living/carbon/human/user)
	if(!Adjacent(user))
		return
	var/newtax = input(user, "Set a new tax percentage (1-99)", src, SStreasury.tax_value*100) as null|num
	if(newtax)
		if(!Adjacent(user))
			return
		if(findtext(num2text(newtax), "."))
			return
		newtax = CLAMP(newtax, 1, 99)
		SStreasury.tax_value = newtax / 100
		priority_announce("The new tax in Rockhill shall be [newtax] percent.", "The Generous Lord Decrees", 'sound/misc/alert.ogg', "Captain")

/obj/structure/roguemachine/titan/proc/give_job_popup(mob/living/carbon/human/user)
	if(!Adjacent(user))
		return

	var/list/mob/possible_mobs = orange(2, src)
	var/mob/victim = input(user, "Who should change their post?", src, null) as null|mob in possible_mobs - user
	if(isnull(victim) || !Adjacent(user))
		return

	var/list/possible_positions = GLOB.noble_positions + GLOB.garrison_positions + GLOB.church_positions + GLOB.serf_positions + GLOB.peasant_positions + GLOB.apprentices_positions + GLOB.allmig_positions - "King"
	var/new_pos = input(user, "Select their new position", src, null) as anything in possible_positions

	if(isnull(new_pos) || !Adjacent(user))
		return

	playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	victim.job = new_pos
	if(!SScommunications.can_announce(user))
		return

	priority_announce("Henceforth, the vassal known as [victim.real_name] shall have the title of [new_pos].", "The King Decrees", 'sound/misc/alert.ogg', "Captain")

/obj/structure/roguemachine/titan/proc/make_announcement(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	var/datum/antagonist/prebel/P = user.mind?.has_antag_datum(/datum/antagonist/prebel)
	if(P)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(istype(C))
			if(P.rev_team)
				if(P.rev_team.members.len < 3)
					to_chat(user, "<span class='warning'>I need more folk on my side to declare victory.</span>")
				else
					for(var/datum/objective/prebel/obj in user.mind.get_all_objectives())
						obj.completed = TRUE
					if(!C.headrebdecree)
						user.mind.adjust_triumphs(1)
					C.headrebdecree = TRUE

	SScommunications.make_announcement(user, FALSE, raw_message)

/obj/structure/roguemachine/titan/proc/make_decree(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	var/datum/antagonist/prebel/P = user.mind?.has_antag_datum(/datum/antagonist/prebel)
	if(P)
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(istype(C))
			if(P.rev_team)
				if(P.rev_team.members.len < 3)
					to_chat(user, "<span class='warning'>I need more folk on my side to declare victory.</span>")
				else
					for(var/datum/objective/prebel/obj in user.mind.get_all_objectives())
						obj.completed = TRUE
					if(!C.headrebdecree)
						user.mind.adjust_triumphs(1)
					C.headrebdecree = TRUE
	GLOB.lord_decrees += raw_message
	SScommunications.make_announcement(user, TRUE, raw_message)

/obj/structure/roguemachine/titan/proc/make_outlaw(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	if(user.job)
		var/datum/job/J = SSjob.GetJob(user.job)
		var/used_title = J.title
		if(user.gender == FEMALE && J.f_title)
			used_title = J.f_title
		if(used_title != "King")
			return
	else
		return
	if(raw_message in GLOB.outlawed_players)
		GLOB.outlawed_players -= raw_message
		priority_announce("[raw_message] is no longer an outlaw in Rockhill lands.", "The King Decrees", 'sound/misc/alert.ogg', "Captain")
		return FALSE
	var/found = FALSE
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.real_name == raw_message)
			found = TRUE
	if(!found)
		return FALSE
	GLOB.outlawed_players += raw_message
	priority_announce("[raw_message] has been declared an outlaw and must be captured or slain.", "The King Decrees", 'sound/misc/alert.ogg', "Captain")

/obj/structure/roguemachine/titan/proc/make_law(mob/living/user, raw_message)
	if(!SScommunications.can_announce(user))
		return
	GLOB.laws_of_the_land += raw_message
	priority_announce("[length(GLOB.laws_of_the_land)]. [raw_message]", "A LAW IS DECLARED", 'sound/misc/lawdeclaration.ogg', "Captain")

/obj/structure/roguemachine/titan/proc/remove_law(law_index)
	if(!GLOB.laws_of_the_land[law_index])
		return
	var/law_text = GLOB.laws_of_the_land[law_index]
	GLOB.laws_of_the_land -= law_text
	priority_announce("[law_index]. [law_text]", "A LAW IS ABOLISHED", 'sound/misc/lawdeclaration.ogg', "Captain")

/obj/structure/roguemachine/titan/proc/purge_laws()
	GLOB.laws_of_the_land = list()
	priority_announce("All laws of the land have been purged!", "LAWS PURGED", 'sound/misc/lawspurged.ogg', "Captain")
