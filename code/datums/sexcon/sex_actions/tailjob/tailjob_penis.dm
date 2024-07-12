/datum/sex_action/tailjob_penis
	name = "Jerk off with the tail"

/datum/sex_action/tailjob_penis/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!(user.gender == MALE))
		return FALSE
	return TRUE

/datum/sex_action/tailjob_penis/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.dna.species?.id != "Tiefling")
		return FALSE
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, skipundies = FALSE))
		return FALSE
	if(!(user.gender == MALE))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/tailjob_penis/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] starts jerking off with the tail...</span>")

/datum/sex_action/tailjob_penis/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/chosen_verb = pick(list("jerks his cock with the tail", "strokes his cock with the tail", "tailjobs with the tail", "jerks off with the tail"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [chosen_verb]..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/tailjob_penis/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] stops jerking off with the tail.</span>")

/datum/sex_action/tailjob_penis/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
