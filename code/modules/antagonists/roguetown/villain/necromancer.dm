/datum/antagonist/necromancer
	name = "Necromancer"
	roundend_category = "Necromancer"
	antagpanel_category = "Necromancer"
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "Necromancer"
	show_name_in_check_antagonists = TRUE
	confess_lines = list(
		"PRAISE BE TO THE UNDYING!",
		"PRAISE ZIZO!",
		"DEATH CANNOT HOLD ME!",
		"I WILL CONSUME YOUR SOUL!",
	)

/datum/antagonist/necromancer/on_gain()
	owner.current.cmode_music = 'sound/music/combat_necromancer.ogg'


/datum/antagonist/necromancer/roundend_report()
	var/traitorwin = FALSE

	if(!considered_alive(owner))
		traitorwin = FALSE

	if(traitorwin)
		to_chat(world, "<span class='greentext'>The [name] [owner.name] has TRIUMPHED!</span>")
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(world, "<span class='redtext'>The [name] [owner.name] has FAILED!</span>")
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)
