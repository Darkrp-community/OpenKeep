/datum/sex_action/tailjob_penis_other
	name = "Jerk them off with tail"
	check_same_tile = FALSE

/datum/sex_action/tailjob_penis_other/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "tiefling")
		return FALSE
	if(user == target)
		return FALSE
	if(!(target.gender == MALE))
		return FALSE
	return TRUE

/datum/sex_action/tailjob_penis_other/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "tiefling")
		return FALSE
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, skipundies = FALSE))
		return FALSE
	if(!(target.gender == MALE))
		return FALSE
	return TRUE

/datum/sex_action/tailjob_penis_other/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] starts jerking [target]'s off with the tail...</span>")

/datum/sex_action/tailjob_penis_other/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] jerks [target]'s cock off with the tail..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)

	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/tailjob_penis_other/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] stops jerking [target]'s off with the tail.</span>")

/datum/sex_action/tailjob_penis_other/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
