/proc/get_living_crew() // more so get_living_people, or get_living_minds
	. = list()
	for(var/i in GLOB.human_list)
		var/mob/living/carbon/human/player = i
		if(player.stat != DEAD && player.mind)
			. |= player.mind

/datum/objective/proc/get_random_noble()
	var/list/possible_targets = list()
	for(var/datum/mind/possible_target in get_living_crew())
		if(HAS_TRAIT(possible_target.current, TRAIT_NOBLE))
			possible_targets += possible_target
	if(!possible_targets.len) // failback if no nobles
		for(var/datum/mind/possible_target in get_living_crew())
			possible_targets += possible_target
	return pick(possible_targets)