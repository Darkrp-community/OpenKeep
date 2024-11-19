/**find and set
 * Finds an item near themselves, sets a blackboard key as it. Very useful for ais that need to use machines or something.
 * if you want to do something more complicated than find a single atom, change the search_tactic() proc
 * cool tip: search_tactic() can set lists
 */
/datum/ai_behavior/find_and_set
	action_cooldown = 5 SECONDS
	///search range in how many tiles around the pawn to look for the path
	var/search_range = 7
	//optional, don't use if you're changing search_tactic()
	var/locate_path
	var/bb_key_to_set

/datum/ai_behavior/find_and_set/perform(delta_time, datum/ai_controller/controller)
	. = ..()
	var/find_this_thing = search_tactic(controller)
	if(find_this_thing)
		controller.blackboard[bb_key_to_set] = find_this_thing
		finish_action(controller, TRUE)
	else
		finish_action(controller, FALSE)

/datum/ai_behavior/find_and_set/proc/search_tactic(datum/ai_controller/controller)
	return locate(locate_path) in oview(search_range, controller.pawn)
