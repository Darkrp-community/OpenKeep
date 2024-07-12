/datum/sex_action/masturbate_breasts
	name = "Tail breasts"

/datum/sex_action/masturbate_breasts/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!(user.gender == FEMALE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_breasts/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_CHEST))
		return FALSE
	if(!(user.gender == FEMALE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_breasts/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] starts rubbing her breasts with the tail...</span>")

/datum/sex_action/masturbate_breasts/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fondles her breasts with the tail..."))

	user.sexcon.perform_sex_action(user, 1, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_breasts/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] stops fondling her breasts with the tail.</span>")

/datum/sex_action/masturbate_breasts/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
