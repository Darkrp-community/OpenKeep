/datum/antagonist/assassino
	name = "Assassin"
	roundend_category = "Assassins"
	antagpanel_category = "Assassin"
	job_rank = ROLE_ASSASSIN
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "assassin"
	confess_lines = list("I am the terror that lurks in the night.", "I am the one who climbs the roof tops.", "I keep the children up at night, making them pray their throats don't get slit.") // i am the terror that faps in the night

/datum/antagonist/assassino/on_gain()
	owner.special_role = name
	forge_objectives()
	owner.current.playsound_local(get_turf(owner.current), 'sound/music/traitor.ogg', 80, FALSE, pressure_affected = FALSE)
	. = ..()
	ADD_TRAIT(owner.current, RTRAIT_VILLAIN, TRAIT_GENERIC)
	var/mob/living/carbon/human/H = owner.current
	H.change_stat("strength", -3)
	H.change_stat("speed", 4)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", -3)
	H.cmode_music = 'sound/music/combatsneaky.ogg'
	owner.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE) // Knows their way around the blade. Or so.
	owner.adjust_skillrank(/datum/skill/combat/unarmed, -1, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	owner.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)

	owner.current.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/knock/nerfed)
	owner.current.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/switchplanes)

/datum/antagonist/assassino/greet()
	to_chat(owner.current, "<span class='userdanger'>They call me the Assassino, I am sent to places when some things just aren't right. And I have lots of correcting to do.</span>")
	owner.announce_objectives()
	..()

/datum/antagonist/assassino/proc/forge_objectives()
	var/datum/objective/assassinate/killRuler = new
	killRuler.target = SSticker.rulermob.mind
	killRuler.owner = owner
	objectives += killRuler

	var/datum/objective/assassinate/killNoble = new
	killNoble.target = killNoble.get_random_noble()
	killNoble.owner = owner
	objectives += killNoble

	// this is strictly for testing reasons so we dont runtime if for some reason the round starts without a king or noble
	if(killRuler.target == null)
		killRuler.target = owner.current
	if(killNoble.target == null)
		killNoble.target = owner.current

/datum/antagonist/assassino/proc/add_objective(datum/objective/O)
	var/datum/objective/V = new O
	objectives += V

/datum/antagonist/assassino/proc/remove_objective(datum/objective/O)
	objectives -= O

/datum/antagonist/assassino/on_removal()
	if(!silent && owner.current)
		to_chat(owner.current,"<span class='danger'>I am no longer a [job_rank]!</span>")
	owner.special_role = null
	return ..()