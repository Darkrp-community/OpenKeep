/datum/sex_action/force_blowjob
	name = "Force them to suck"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_blowjob/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!(user.gender == MALE))
		return FALSE
	return TRUE

/datum/sex_action/force_blowjob/can_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_GROIN, skipundies = FALSE))
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!(user.gender == MALE))
		return FALSE
	if(!user.sexcon.can_use_penis())
		return
	return TRUE

/datum/sex_action/force_blowjob/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] forces [target]'s head down to swallow and suck on his cock!</span>")
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)

/datum/sex_action/force_blowjob/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to suck his cock."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message("<span class='notice'>cums into [target]'s throat!</span>")
		user.sexcon.cum_into()

	user.sexcon.perform_deepthroat_oxyloss(user, 1.3)
	user.sexcon.perform_sex_action(target, 0, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_blowjob/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	user.visible_message("<span class='danger'>[user] pulls his cock out of [target]'s throat.</span>")

/datum/sex_action/force_blowjob/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
