/datum/sex_action/masturbate_vagina
	name = "Stroke clit"

/datum/sex_action/masturbate_vagina/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	if(!user.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!user.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts stroking her clit..."))

/datum/sex_action/masturbate_vagina/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] strokes her clit..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_vagina/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops stroking."))

/datum/sex_action/masturbate_vagina/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/masturbate_penis
	name = "Jerk off"

/datum/sex_action/masturbate_penis/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	if(!user.gender == MALE)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_penis/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!user.gender == MALE)
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/masturbate_penis/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts jerking off..."))

/datum/sex_action/masturbate_penis/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	var/chosen_verb = pick(list("jerks his cock", "strokes his cock", "masturbates", "jerks off"))
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [chosen_verb]..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_penis/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops jerking off."))

/datum/sex_action/masturbate_penis/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/masturbate_anus
	name = "Finger butt"

/datum/sex_action/masturbate_anus/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_anus/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user != target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_anus/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts fingering their butt..."))

/datum/sex_action/masturbate_anus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers their butt..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 6, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_anus/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops fingering their butt."))

/datum/sex_action/masturbate_anus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
