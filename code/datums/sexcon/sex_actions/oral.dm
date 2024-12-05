/datum/sex_action/cunnilingus
	name = "mouth service"

/datum/sex_action/cunnilingus/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!target.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/cunnilingus/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/cunnilingus/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts to eat [target]."))

/datum/sex_action/cunnilingus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] eats [target]."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 3, TRUE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] tightens in ectasy!"))
		target.sexcon.cum_into()

/datum/sex_action/cunnilingus/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops sucking [target]'s clit ..."))

/datum/sex_action/cunnilingus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/blowjob
	name = "mouth service"
	check_same_tile = FALSE

/datum/sex_action/blowjob/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(target.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/blowjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(target.gender == FEMALE)
		return FALSE
	return TRUE

/datum/sex_action/blowjob/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts to suck off [target]."))

/datum/sex_action/blowjob/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] sucks off [target]."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] tightens in ectasy!"))
		target.sexcon.cum_into()

/datum/sex_action/blowjob/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops sucking off [target]."))

/datum/sex_action/blowjob/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/rimming
	name = "mouth service on whistler"

/datum/sex_action/rimming/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/rimming/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/rimming/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] starts licking [target]'s whistler."))

/datum/sex_action/rimming/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] licks [target]'s whistler."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/rimming/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(span_warning("[user] stops licking [target]'s whistler."))

/datum/sex_action/rimming/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
