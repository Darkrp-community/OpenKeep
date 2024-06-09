/datum/objective/proc/get_random_noble()
	var/list/possible_targets = list()
	for(var/datum/mind/possible_target in get_crewmember_minds())
		if(HAS_TRAIT(possible_target.current, RTRAIT_NOBLE))
			possible_targets += possible_target
	return pick(possible_targets)