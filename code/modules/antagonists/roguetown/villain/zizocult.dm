GLOBAL_LIST_EMPTY(ritualslist)

/datum/antagonist/zizocultist
	name = "Zizoid Lackey"
	roundend_category = "zizoid cultists"
	antagpanel_category = "Zizoid Cult"
	job_rank = ROLE_ZIZOIDCULTIST
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "cultist"
	confess_lines = list(
		"DEATH TO THE TEN!", 
		"PRAISE ZIZO!",
		"I AM THE FUTURE!",
		"NO GODS! ONLY MASTERS!",
	)
	var/islesser = TRUE

/datum/antagonist/zizocultist/leader
	name = "Zizoid Cultist"
	islesser = FALSE

/proc/iszizolackey(mob/living/M)
	return istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/zizocultist)

/proc/iszizocultist(mob/living/M)
	return istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/zizocultist/leader)

/datum/antagonist/zizocultist/examine_friendorfoe(datum/antagonist/examined_datum, mob/examiner, mob/examined)
	if(istype(examined_datum, /datum/antagonist/zizocultist))
		return "<span class='boldnotice'>A lackey for the future.</span>"
	if(istype(examined_datum, /datum/antagonist/zizocultist/leader))
		return "<span class='boldnotice'>OUR LEADER!</span>"

/datum/antagonist/zizocultist/on_gain()
	. = ..()
	var/datum/game_mode/C = SSticker.mode
	var/mob/living/carbon/human/H = owner.current
	C.cultists |= owner
	H.patron = GLOB.patronlist[/datum/patron/inhumen/zizo]

	owner.special_role = ROLE_ZIZOIDCULTIST
	H.cmode_music = 'sound/music/combatcult.ogg'
	owner.current.verbs |= /mob/living/carbon/human/proc/praise
	owner.current.verbs |= /mob/living/carbon/human/proc/communicate
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)

	if(islesser)
		add_objective(/datum/objective/zizoserve)
		greet()
	else
		add_objective(/datum/objective/zizo)
		greet()
		owner.current.verbs |= /mob/living/carbon/human/proc/draw_sigil

/datum/antagonist/zizocultist/greet()
	to_chat(owner, "<span class='danger'>I'm a lackey to the LEADER. A new future begins.</span>")
	owner.announce_objectives()

/datum/antagonist/zizocultist/leader/greet()
	to_chat(owner, "<span class='danger'>I'm a cultist to the ALMIGHTY. They call it the UNSPEAKABLE. I require LACKEYS to make my RITUALS easier. I SHALL ASCEND.</span>")
	owner.announce_objectives()

/datum/antagonist/zizocultist/can_be_owned(datum/mind/new_owner)
	. = ..()
	if(.)
		if(new_owner.assigned_role in GLOB.noble_positions)
			return FALSE
		if(new_owner.assigned_role in GLOB.church_positions)
			return FALSE
		if(new_owner.unconvertable)
			return FALSE
		if(new_owner.current && HAS_TRAIT(new_owner.current, TRAIT_MINDSHIELD))
			return FALSE

/datum/antagonist/zizocultist/proc/can_be_converted(mob/living/candidate)
	if(!candidate.mind)
		return FALSE
	if(!can_be_owned(candidate.mind))
		return FALSE
	if(candidate.mind.assigned_role in GLOB.noble_positions)
		return FALSE
	if(candidate.mind.assigned_role in GLOB.church_positions)
		return FALSE
	var/mob/living/carbon/C = candidate //Check to see if the potential rev is implanted
	if(!istype(C)) //Can't convert simple animals
		return FALSE
	return TRUE

/datum/antagonist/zizocultist/proc/add_cultist(datum/mind/cult_mind)
	if(!can_be_converted(cult_mind.current))
		return FALSE
	cult_mind.add_antag_datum(/datum/antagonist/zizocultist)
	return TRUE

/datum/objective/zizo
	name = "ASCEND"
	explanation_text = "Ensure that I ascend."
	team_explanation_text = "Ensure that I ascend."
	triumph_count = 5

/datum/objective/zizoserve
	name = "Serve your Leader"
	explanation_text = "Serve your leader and ensure that they ascend."
	team_explanation_text = "Serve your leader and ensure that they ascend."
	triumph_count = 3

/datum/antagonist/zizocultist/proc/add_objective(datum/objective/O)
	var/datum/objective/V = new O
	objectives += V

/datum/antagonist/zizocultist/proc/remove_objective(datum/objective/O)
	objectives -= O

/datum/antagonist/zizocultist/roundend_report()
	var/traitorwin = TRUE

	printplayer(owner)

	var/count = 0
	if(islesser) // don't need to spam up the chat with all spawn
		if(objectives.len)//If the traitor had no objectives, don't need to process this.
			for(var/datum/objective/objective in objectives)
				objective.update_explanation_text()
				if(objective.check_completion())
					to_chat(owner, "<B>Goal #[count]</B>: [objective.explanation_text] <span class='greentext'>TRIUMPH!</span>")
				else
					to_chat(owner, "<B>Goal #[count]</B>: [objective.explanation_text] <span class='redtext'>Failure.</span>")
					traitorwin = FALSE
				count += objective.triumph_count
	else
		if(objectives.len)//If the traitor had no objectives, don't need to process this.
			for(var/datum/objective/objective in objectives)
				objective.update_explanation_text()
				if(objective.check_completion())
					to_chat(world, "<B>Goal #[count]</B>: [objective.explanation_text] <span class='greentext'>TRIUMPH!</span>")
				else
					to_chat(world, "<B>Goal #[count]</B>: [objective.explanation_text] <span class='redtext'>Failure.</span>")
					traitorwin = FALSE
				count += objective.triumph_count

	var/special_role_text = lowertext(name)
	if(traitorwin)
		if(count)
			if(owner)
				owner.adjust_triumphs(count)
		to_chat(world, "<span class='greentext'>The [special_role_text] has TRIUMPHED!</span>")
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(world, "<span class='redtext'>The [special_role_text] has FAILED!</span>")
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

// VERBS

/mob/living/carbon/human/proc/praise()
	set name = "Praise the Lord!"
	set category = "ZIZO"
	audible_message("\The [src] praises <span class='bold'>Zizo</span>!")
	playsound(src.loc, 'sound/vo/cult/praise.ogg', 45, 1)

/mob/living/carbon/human/proc/communicate()
	set name = "Communicate"
	set category = "ZIZO"

	var/datum/game_mode/chaosmode/C = SSticker.mode
	var/speak = input("What do you speak of?", "ROGUETOWN") as text|null
	if(!speak)
		return
	playsound_local(src, 'sound/vo/cult/skvor.ogg', 100)
	whisper("O schlet'a ty'schkotot ty'skvoro...")
	whisper("[speak]")

	for(var/datum/mind/V in C.cultists)
		to_chat(V, "<span class='boldnotice'>A message from [src.real_name]: \"[speak]\"</span>")

/obj/effect/decal/cleanable/sigil
	name = "sigils"
	desc = "Strange runics."
	icon_state = "center"
	icon = 'icons/obj/sigils.dmi'
	var/sigil_type

/obj/effect/decal/cleanable/sigil/Initialize(mapload, list/datum/disease/diseases)
	. = ..()
	if(!LAZYLEN(GLOB.ritualslist))
		testing("initializing ritualslist")
		GLOB.ritualslist = list()
		var/static/list/rituals = subtypesof(/datum/ritual)
		for(var/path in rituals)
			var/datum/ritual/G = path
			testing("now initializing: [path]")
			testing("[G.name]")
			GLOB.ritualslist[G.name] = G

/obj/effect/decal/cleanable/sigil/proc/consume_ingredients(var/datum/ritual/R)

	for(var/atom/A in get_step(src, NORTH))
		if(istype(A, R.n_req) && !ishuman(R.n_req))
			qdel(A)
	
	for(var/atom/A in get_step(src, SOUTH))
		if(istype(A, R.s_req) && !ishuman(R.s_req))
			qdel(A)

	for(var/atom/A in get_step(src, EAST))
		if(istype(A, R.e_req) && !ishuman(R.e_req))
			qdel(A)
	
	for(var/atom/A in get_step(src, WEST))
		if(istype(A, R.w_req) && !ishuman(R.w_req))
			qdel(A)

	for(var/atom/A in loc.contents)
		if(istype(A, R.center_requirement) && !ishuman(R.center_requirement))
			qdel(A)

/obj/effect/decal/cleanable/sigil/attack_hand(mob/living/user)
	. = ..()
	testing("clicked by [user]")
	var/list/rituals = list()
	if(icon_state != "center") // fucking awful but it has to be this way
		return
	if(iszizocultist(user) || iszizolackey(user))
		for(var/G in GLOB.ritualslist)
			var/datum/ritual/path = GLOB.ritualslist[G]
			if(path.circle == sigil_type)
				rituals |= path.name

		var/ritualnameinput = input(user, "Rituals", "ROGUETOWN") as anything in rituals
		testing("ritualnameinput [ritualnameinput]")
		var/datum/ritual/pickritual
		
		pickritual = GLOB.ritualslist[ritualnameinput]
		testing("pickritual [pickritual]")

		var/cardinal_success = FALSE
		var/center_success = FALSE

		if(!pickritual)
			return
		
		var/dews = 0

		if(pickritual.e_req)
			for(var/atom/A in get_step(src, EAST))
				if(istype(A, pickritual.e_req))
					dews++
					break
				else
					continue
		else
			dews++

		if(pickritual.s_req)
			for(var/atom/A in get_step(src, SOUTH))
				if(istype(A, pickritual.s_req))
					dews++
					break
				else
					continue
		else
			dews++

		if(pickritual.w_req)
			for(var/atom/A in get_step(src, WEST))
				if(istype(A, pickritual.w_req))
					dews++
					break
				else
					continue
		else
			dews++

		if(pickritual.n_req)
			for(var/atom/A in get_step(src, NORTH))
				if(istype(A, pickritual.n_req))
					dews++
					break
				else
					continue
		else
			dews++

		if(dews >= 4)
			cardinal_success = TRUE
			testing("CARDINAL SUCCESS!")

		for(var/atom/A in loc.contents)
			if(!istype(A, pickritual.center_requirement))
				continue
			else
				center_success = TRUE
				testing("CENTER SUCCESS!")
				break
		
		if(cardinal_success != TRUE)
			return

		if(center_success != TRUE)
			return

		testing("Now calling proc")
		consume_ingredients(pickritual)
		call(pickritual.function)(user, loc)

/obj/effect/decal/cleanable/sigil/N
	icon_state = "N"

/obj/effect/decal/cleanable/sigil/NE
	icon_state = "NE"

/obj/effect/decal/cleanable/sigil/E
	icon_state = "E"

/obj/effect/decal/cleanable/sigil/SE
	icon_state = "SE"

/obj/effect/decal/cleanable/sigil/S
	icon_state = "S"

/obj/effect/decal/cleanable/sigil/SW
	icon_state = "SW"

/obj/effect/decal/cleanable/sigil/W
	icon_state = "W"

/obj/effect/decal/cleanable/sigil/NW
	icon_state = "NW"

/turf/open/floor/proc/generateSigils(var/mob/M, var/input)
	var/turf/T = get_turf(M.loc)
	for(var/obj/A in T)
		if(istype(A, /obj/effect/decal/cleanable/sigil))
			to_chat(M, "<span class='warning'>There is already a sigil here.</span>")
			return
		if(A.density && !(A.flags_1 & ON_BORDER_1))
			to_chat(M, "<span class='warning'>There is already something here!</span>")
			return
	if(do_after(M, 5 SECONDS))
		M.bloody_hands--
		M.update_inv_gloves()
		var/obj/effect/decal/cleanable/sigil/C = new(src)
		C.sigil_type = input
		playsound(M, 'sound/items/write.ogg', 100)
		var/list/sigilsPath = list(
			/obj/effect/decal/cleanable/sigil/N,
			/obj/effect/decal/cleanable/sigil/S,
			/obj/effect/decal/cleanable/sigil/E,
			/obj/effect/decal/cleanable/sigil/W,
			/obj/effect/decal/cleanable/sigil/NE,
			/obj/effect/decal/cleanable/sigil/NW,
			/obj/effect/decal/cleanable/sigil/SE,
			/obj/effect/decal/cleanable/sigil/SW
		)

		for(var/i = 1; i <= alldirs.len; i++)
			var/turf/floor = get_step(src, alldirs[i])
			var/sigil = sigilsPath[i]

			new sigil(floor)

/mob/living/carbon/human/proc/draw_sigil()
	set name = "Draw Sigil"
	set category = "ZIZO"

	var/list/runes = list("Servantry", "Transmutation", "Fleshcrafting")

	if(!bloody_hands)
		to_chat(src, "<span class='danger'>My hands aren't bloody enough.</span>")
		return

	var/input = input("Sigil Type", "ROGUETOWN") as anything in runes|null
	if(!input)
		return
	
	var/turf/open/floor/T = get_turf(src.loc)
	T.generateSigils(src, input)

// RITUAL DATUMS

/datum/ritual
	var/name = "DVRK AND EVIL RITVAL"
	var/circle = null // Servantry, Transmutation, Fleshcrafting
	var/center_requirement = /obj/item
	// This is absolutely fucking terrible. I tried to do it with lists but it just didn't work and 
	//kept runtiming. Something something, can't access list inside a datum.
	//I couldn't find a more efficient solution to do this, I'm sorry. -7
	var/n_req = null
	var/e_req = null
	var/s_req = null
	var/w_req = null
	var/function // a proc

/datum/ritual/transmutate
	name = "Transmutate"
	circle = "Transmutation"
	center_requirement = /obj/item/organ/brain
	
	n_req = /obj/item/organ/brain
	e_req = /obj/item/organ/brain
	s_req = /obj/item/organ/brain
	w_req = /obj/item/organ/brain

	function = /proc/transmutate

/datum/ritual/transmutate2
	name = "Transmutate2"
	circle = "Transmutation"
	center_requirement = /obj/item/organ/brain
	
	n_req = /obj/item/organ/brain
	e_req = /obj/item/organ/brain
	s_req = /obj/item/organ/brain
	w_req = /obj/item/organ/brain

	function = /proc/transmutate

/proc/transmutate(var/mob/user, var/turf/C)
	testing("NOW TESTING TRANSMUTATE")
	for(var/mob/living/carbon/human/H in C.contents)
		if(H != user)
			if(iszizocultist(H) || iszizolackey(H))
				return
			H.gib()

/datum/ritual/convert
	name = "Convert"
	circle = "Servantry"
	center_requirement = /mob/living/carbon/human

	function = /proc/convert

/proc/convert(var/mob/user, var/turf/C)
	var/datum/game_mode/chaosmode/M = SSticker.mode
	testing("NOW TESTING CONVERT")

	for(var/mob/living/carbon/human/H in C.contents)
		if(H != user)
			if(iszizocultist(H) || iszizolackey(H))
				return
			if(!H.client)
				return
			if(H.anchored) // a way to bind the person to the rune if they choose to resist converting
				return
			if(M.cultists.len >= 3)
				to_chat(user, "<span class='danger'>\"The veil is too strong to support more than two lackeys.\"</span>")
				return
			var/datum/antagonist/zizocultist/PR = user.mind.has_antag_datum(/datum/antagonist/zizocultist)
			var/alert = alert(user, "YOU WILL BE SHOWN THE TRUTH. DO YOU YIELD?", "ROGUETOWN", "Yield", "Resist")
			anchored = TRUE
			if(alert == "Yield")
				to_chat(H, "<span class='notice'>I see the truth now! It all makes so much sense! They aren't HERETICS! They want the BEST FOR US!</span>")
				PR.add_cultist(H.mind)
				H.anchored = FALSE
			else
				H.visible_message("<span class='danger'>\The [H] thrashes around, unyielding!</span>")
				to_chat(H, "<span class='danger'>\"Yield.\"</span>")
				if(H.electrocute_act(10, src))
					H.emote("painscream")
				sleep(20)
				H.anchored = FALSE