/datum/antagonist/zizocultist
	name = "Zizoid Lackey"
	roundend_category = "zizoid cultists"
	antagpanel_category = "Zizoid Cult"
	job_rank = ROLE_CULTIST
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

/datum/antagonist/zizocultist/examine_friendorfoe(datum/antagonist/examined_datum, mob/examiner, mob/examined)
	if(istype(examined_datum, /datum/antagonist/zizocultist))
		return "<span class='boldnotice'>A lackey for the future.</span>"
	if(istype(examined_datum, /datum/antagonist/zizocultist/leader))
		return "<span class='boldnotice'>OUR LEADER!</span>"

/datum/antagonist/zizocultist/on_gain()
	. = ..()
	var/datum/game_mode/C = SSticker.mode
	C.cultists |= owner
	H.patron = GLOB.patronlist[/datum/patron/inhumen/zizo]

	owner.special_role = ROLE_CULTIST
	var/mob/living/carbon/human/H = owner.current
	H.cmode_music = 'sound/music/combat_weird.ogg'
	add_objective(/datum/objective/zizoserve)
	owner.current.verbs |= /mob/living/carbon/human/proc/praise
	owner.current.verbs |= /mob/living/carbon/human/proc/communicate
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)

/datum/antagonist/zizocultist/leader/on_gain()
	add_objective(/datum/objective/zizo)
	owner.current.verbs |= /mob/living/carbon/human/proc/draw_sigil
	..()

/datum/antagonist/zizocultist/greet()
	to_chat(owner, "<span class='danger'>I'm a lackey to the LEADER. A new future begins.</span>")
	owner.announce_objectives()
	..()

/datum/antagonist/zizocultist/leader/greet()
	to_chat(owner, "<span class='danger'>I'm a cultist to the ALMIGHTY. They call it the UNSPEAKABLE. I require LACKEYS to make my RITUALS easier. I SHALL ASCEND.</span>")
	owner.announce_objectives()
	..()

/datum/antagonist/zizocultist/can_be_owned(datum/mind/new_owner)
	. = ..()
	if(.)
		if(new_owner.assigned_role in GLOB.noble_positions)
			return FALSE
		if(new_owner.assigned_role in GLOB.garrison_positions)
			return FALSE
		if(new_owner.unconvertable)
			return FALSE
		if(new_owner.current && HAS_TRAIT(new_owner.current, TRAIT_MINDSHIELD))
			return FALSE

/datum/objective/zizo
	name = "ASCEND"
	explanation_text = "Ensure that I ascend."
	team_explanation_text = "Ensure that I ascend."

/datum/objective/zizoserve
	name = "Serve your Leader"
	explanation_text = "Serve your leader."
	team_explanation_text = "Serve your leader."

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
	var/speak = input("What do you speak?", "ROGUETOWN") as text|null
	if(!speak)
		return
	playsound_local(src, 'sound/vo/cult/skvor.ogg', 100)
	whisper("O schlet'a ty'schkotot ty'skvoro...")
	whisper("[speak]")

	for(var/datum/mind/V in C.vampires)
		to_chat(V, "<span class='boldnotice'>A message from [src.real_name]: \"[speak]\"</span>")

/obj/effect/decal/cleanable/sigil
	name = "sigils"
	desc = "Strange runics."
	icon_state = "center"
	icon = 'icons/obj/sigils.dmi'
	var/sigil_type = "Servantry"

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