/datum/sex_action/masturbate_vagina
	name = "Stroke clit with tail"

/datum/sex_action/masturbate_vagina/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!(user.gender == FEMALE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, skipundies = FALSE))
		return FALSE
	if(!(user.gender == FEMALE))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] starts stroking her clit with the tail...</span>")

/datum/sex_action/masturbate_vagina/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] strokes her clit with the tail..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_vagina/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] stops stroking with the tail.</span>")

/datum/sex_action/masturbate_vagina/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
