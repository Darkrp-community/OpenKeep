/datum/sex_action/tailjob_other_anus
	name = "Tail their butt"
	check_same_tile = FALSE

/datum/sex_action/tailjob_other_anus/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/tailjob_other_anus/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN, skipundies = FALSE))
		return FALSE
	return TRUE

/datum/sex_action/tailjob_other_anus/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] starts putting the tail tip into [target]'s butt...</span>")

/datum/sex_action/tailjob_other_anus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] stuffs [target]'s butt with the tail..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 6, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/tailjob_other_anus/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] stops stuffing the tail into [target]'s butt.</span>")

/datum/sex_action/tailjob_other_anus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
