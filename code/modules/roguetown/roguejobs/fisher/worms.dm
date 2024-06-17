/obj/item
	var/baitpenalty = 100 // Using this as bait will incurr a penalty to fishing chance. 100 makes it useless as bait. Lower values are better, but Never make it past 10.
	var/isbait = FALSE	// Is the item in question bait to be used?
	var/list/fishloot = null

/obj/item/natural/worms
	name = "worm"
	desc = ""
	icon_state = "worm1"
	throwforce = 10
	baitpenalty = 10
	isbait = TRUE
	color = "#b65f49"
	w_class = WEIGHT_CLASS_TINY
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/amt = 1

/obj/item/natural/worms/grubs
	name = "grub"
	baitpenalty = 5
	isbait = TRUE
	color = null
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 5,
		/obj/item/reagent_containers/food/snacks/fish/angler = 1,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 1,
	)

/obj/item/natural/worms/update_icon()
	icon_state = "worm[amt]"
	if(amt > 1)
		name = "[initial(name)]s"
	else
		name = initial(name)

/*
/obj/item/natural/worms/leeches
	name = "leech"
	baitchance = 100
	color = "#472783"
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 5,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	embedding = list("embedded_unsafe_removal_time" = 0, "embedded_pain_chance" = 0, "embedded_pain_multiplier" = 1, "embed_chance" = 0, "embedded_fall_chance" = 0,"embedded_bloodloss"=0)

/obj/item/natural/worms/leeches/update_icon()
	..()
	if(amt > 1)
		name = "[initial(name)]es"


/obj/item/natural/worms/leeches/attack(mob/living/M, mob/user)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			return
		if(!get_location_accessible(H, check_zone(user.zone_selected)))
			to_chat(user, "<span class='warning'>Something in the way.</span>")
			return
		var/used_time = 70 - (H.mind.get_skill_level(/datum/skill/misc/medicine) * 10)
		if(!do_mob(user, H, used_time))
			return
		if(!H)
			return
		user.dropItemToGround(src)
		src.forceMove(H)
		affecting.embedded_objects |= src
		if(M == user)
			user.visible_message("<span class='notice'>[user] places a leech on [user.p_their()] [affecting].</span>", "<span class='notice'>I place a leech on my [affecting].</span>")
		else
			user.visible_message("<span class='notice'>[user] places a leech on [M]'s [affecting].</span>", "<span class='notice'>I place a leech on [M]'s [affecting].</span>")

/obj/item/natural/worms/leeches/on_embed_life(mob/living/user)
	if(!user)
		return
//	testing("onembedlife")
	if(ismob(user))
		if(user.blood_volume <= 0)
			user.simple_embedded_objects -= src
			var/turf/T = get_turf(src)
			if(T)
				forceMove(T)
			else
				qdel(src)
			return TRUE
		else
			user.adjustToxLoss(-2)
			user.blood_volume = max(user.blood_volume - 1, 0)
	else
		var/obj/item/bodypart/BP = user
		if(BP.owner)
			if(BP.owner.blood_volume <= 0)
				BP.receive_damage(w_class*embedding.embedded_fall_pain_multiplier)
				BP.embedded_objects -= src
				var/turf/T = get_turf(src)
				if(T)
					forceMove(T)
				else
					qdel(src)
				return TRUE
			else
				BP.owner.adjustToxLoss(-2)
				BP.owner.blood_volume = max(BP.owner.blood_volume - 1, 0)
	return


/obj/item/natural/worms/grubs
	name = "grub"
	baitchance = 100
	color = null
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1,
					/obj/item/reagent_containers/food/snacks/fish/clownfish = 1)

/obj/item/natural/worms/leeches
	name = "leech"
	baitchance = 100
	color = "#472783"
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 5,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	embedding = list("embedded_unsafe_removal_time" = 0, "embedded_pain_chance" = 0, "embedded_pain_multiplier" = 1, "embed_chance" = 0, "embedded_fall_chance" = 0,"embedded_bloodloss"=0)

/obj/item/natural/worms/leeches/update_icon()
	..()
	if(amt > 1)
		name = "[initial(name)]es"


/obj/item/natural/worms/leeches/attack(mob/living/M, mob/user)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			return
		if(!get_location_accessible(H, check_zone(user.zone_selected)))
			to_chat(user, "<span class='warning'>Something in the way.</span>")
			return
		var/used_time = 70 - (H.mind.get_skill_level(/datum/skill/misc/medicine) * 10)
		if(!do_mob(user, H, used_time))
			return
		if(!H)
			return
		user.dropItemToGround(src)
		src.forceMove(H)
		affecting.embedded_objects |= src
		if(M == user)
			user.visible_message("<span class='notice'>[user] places a leech on [user.p_their()] [affecting].</span>", "<span class='notice'>I place a leech on my [affecting].</span>")
		else
			user.visible_message("<span class='notice'>[user] places a leech on [M]'s [affecting].</span>", "<span class='notice'>I place a leech on [M]'s [affecting].</span>")

//Merk Islands Content//

/obj/item/natural/worms/ticks //Ticks are essentially useless leeches that I plan to be able to cause diseases. Merk Islands has no leeches.
	name = "islander tick"
	desc = "plague-bearing vermin found in tall grass."
	icon_state = "tick"
	baitchance = 0
	embedding = list("embedded_unsafe_removal_time" = 0, "embedded_pain_chance" = 0, "embedded_pain_multiplier" = 1, "embed_chance" = 0, "embedded_fall_chance" = 0,"embedded_bloodloss"=0)


/obj/item/natural/worms/ticks/on_embed_life(mob/living/user)
	if(!user)
		return
	if(ismob(user))
		if(user.blood_volume <= 0)
			user.simple_embedded_objects -= src
			var/turf/T = get_turf(src)
			if(T)
				forceMove(T)
			else
				qdel(src)
			return TRUE
		else
			user.blood_volume = max(user.blood_volume - 1, 0)
	else
		var/obj/item/bodypart/BP = user
		if(BP.owner)
			if(BP.owner.blood_volume <= 0)
				BP.receive_damage(w_class*embedding.embedded_fall_pain_multiplier)
				BP.embedded_objects -= src
				var/turf/T = get_turf(src)
				if(T)
					forceMove(T)
				else
					qdel(src)
				return TRUE
			else
				BP.owner.blood_volume = max(BP.owner.blood_volume - 1, 0)
	return

/obj/item/natural/worms/ants //Ants are hard to come by, and are easier to be used, but it does not conserve space. Only one use each.
	name = "vinegar ant"
	desc = "clubshaped ant with painful bites, which the mandibles are used in medicine."
	icon_state = "tick"
	baitchance = 0
	embedding = list("embedded_unsafe_removal_time" = 0, "embedded_pain_chance" = 0, "embedded_pain_multiplier" = 1, "embed_chance" = 0, "embedded_fall_chance" = 0,"embedded_bloodloss"=0)

//It does not conserve space because the creature is STILL ALIVE.
*/
/*
/obj/item/needle/attack(mob/living/M, mob/user)
	antclamp(M, user)

/obj/item/natural/worms/ants/on_embed_life(mob/living/user)
	if(!user)
		return
	if(ismob(user))
		to_chat(user, "<span class='warning'>Something small has bitten you enough to pull skin!</span>")
		user.simple_embedded_objects -= src
		user.adjustBruteLoss(5)
		var/turf/T = get_turf(src)
		if(T)
			forceMove(T)
		else
			qdel(src)
		return TRUE
	else
		var/obj/item/bodypart/BP = user
		if(BP.owner)
			if(BP.owner.blood_volume <= 0)
				BP.receive_damage(w_class*embedding.embedded_fall_pain_multiplier)
				BP.embedded_objects -= src
				var/turf/T = get_turf(src)
				if(T)
					forceMove(T)
				else
					qdel(src)
				return TRUE
			else
				BP.owner.blood_volume = max(BP.owner.blood_volume - 1, 0)
	return

/obj/item/natural/worms/ants/proc/antclamp(mob/living/target, mob/user)
	if(!ishuman(target) || !isliving(user))
		return
	var/mob/living/doctor = user
	var/mob/living/carbon/human/patient = target
	if(!get_location_accessible(patient, check_zone(doctor.zone_selected)))
		to_chat(doctor, "<span class='warning'>The ant cannot bite with something in the way.</span>")
		return
	var/obj/item/bodypart/affecting = patient.get_bodypart(check_zone(doctor.zone_selected))
	if(!patient.mind || !affecting)
		return
	if(affecting.bandage)
		to_chat(doctor, "<span class='warning'>The bandage unables you from clamping the wound.</span>")
		return
	var/list/sewable = affecting.get_sewable()
	if(!sewable || !sewable.len)
		to_chat(doctor, "<span class='warning'>There aren't any wounds large enough to clamp.</span>")
		return
	var/datum/wound/target_wound = input(doctor, "Which wound?", "Roguetown", name) as null|anything in sortList(sewable)
	if(!target_wound || !target_wound.can_sew || !do_after(doctor, 20))
		return

	playsound(loc, 'sound/foley/sewflesh.ogg', 100, TRUE, -2)
	var/moveup = 10
	if(doctor.mind)
		moveup = (((doctor.mind.get_skill_level(/datum/skill/misc/medicine)) + 1 * 20) + moveup)
	target_wound.progress = min(target_wound.progress + moveup, 100)
	if(target_wound.progress == 100)
		target_wound.sewn()
		doctor.mind.adjust_experience(/datum/skill/misc/medicine, doctor.STAINT * 5)
		qdel(src)


	patient.update_damage_overlays()

	if(patient == doctor)
		doctor.visible_message("<span class='notice'>[doctor] clamps \a [target_wound.name] by twisting the ant's body on [doctor.p_them()]self, leaving the head behind.</span>", "<span class='notice'>I stitch \a [target_wound.name] on my [affecting].</span>")
	else
		doctor.visible_message("<span class='notice'>[doctor] clamps \a [target_wound.name] on [patient]'s [affecting], leaving the insect's head behind.</span>", "<span class='notice'>I clamped \a [target_wound.name] on [patient]'s [affecting] by twisting the abdomen of the ant.</span>")
	log_combat(doctor, patient, "antclamp", "ant")

*/
