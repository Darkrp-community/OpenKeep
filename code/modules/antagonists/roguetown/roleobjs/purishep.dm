
/datum/antagonist/purishep
	name = "purishep"
	increase_votepwr = FALSE
	isgoodguy = TRUE

/datum/antagonist/purishep/on_gain()
	if(!(locate(/datum/objective/purishep) in objectives))
		var/datum/objective/purishep/escape_objective = new
		escape_objective.owner = owner
		objectives += escape_objective
		return
	return ..()

/datum/antagonist/purishep/on_removal()
	return ..()


/datum/antagonist/purishep/greet()
	owner.announce_objectives()
	..()

/datum/objective/purishep
	explanation_text = "Serve the priest first, protect the church and the acolytes from evil. Make those that wrong the church confess their sins."

/datum/objective/purishep/check_completion()
	if(GLOB.confessors)
		if(GLOB.confessors.len >= 5)
			return TRUE

