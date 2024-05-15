/datum/status_effect/buff
	status_type = STATUS_EFFECT_REFRESH


/datum/status_effect/buff/drunk
	id = "drunk"
	alert_type = /obj/screen/alert/status_effect/buff/drunk
	effectedstats = list("intelligence" = -1, "speed" = -1, "endurance" = 1)
	duration = 12 MINUTES

/obj/screen/alert/status_effect/buff/drunk
	name = "Drunk"
	desc = "<span class='nicegreen'>I feel very drunk.</span>\n"
	icon_state = "drunk"

/datum/status_effect/buff/drunk/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/drunk)
	. = ..()

/datum/status_effect/buff/drunk/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/drunk)
	. = ..()

/datum/status_effect/buff/foodbuff
	id = "foodbuff"
	alert_type = /obj/screen/alert/status_effect/buff/foodbuff
	effectedstats = list("constitution" = 1,"endurance" = 1)
	duration = 10 MINUTES

/obj/screen/alert/status_effect/buff/foodbuff
	name = "Great Meal"
	desc = "<span class='nicegreen'>That was a good meal!</span>\n"
	icon_state = "foodbuff"

/datum/status_effect/buff/foodbuff/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/goodfood)
	. = ..()

/datum/status_effect/buff/druqks
	id = "druqks"
	alert_type = /obj/screen/alert/status_effect/buff/druqks
	effectedstats = list("endurance" = 3,"speed" = 3,"fortune" = -5)
	duration = 2 MINUTES

/datum/status_effect/buff/druqks/on_apply()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/obj/screen/plane_master/game_world/PM = locate(/obj/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.add_stress(/datum/stressevent/high)


/datum/status_effect/buff/druqks/on_remove()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/obj/screen/plane_master/game_world/PM = locate(/obj/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.remove_stress(/datum/stressevent/high)
	. = ..()

/obj/screen/alert/status_effect/buff/druqks
	name = "High"
	desc = "<span class='nicegreen'>I am tripping balls.</span>\n"
	icon_state = "acid"

/datum/status_effect/buff/ozium
	id = "ozium"
	alert_type = /obj/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = -99)
	duration = 2 MINUTES

/datum/status_effect/buff/ozium/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/ozium)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/ozium/on_remove()
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/ozium)
	. = ..()

/datum/status_effect/buff/moondust
	id = "moondust"
	alert_type = /obj/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 3, "endurance" = 3)
	duration = 2 MINUTES

/datum/status_effect/buff/moondust/nextmove_modifier()
	return 0.5

/datum/status_effect/buff/moondust/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/moondust)

/datum/status_effect/buff/moondust/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/moondust)

/datum/status_effect/buff/moondust_purest
	id = "purest moondust"
	alert_type = /obj/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = 6, "endurance" = 6)
	duration = 3 MINUTES

/datum/status_effect/buff/moondust_purest/nextmove_modifier()
	return 0.5

/datum/status_effect/buff/moondust_purest/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/moondust_purest)

/datum/status_effect/buff/moondust_purest/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/moondust_purest)


/datum/status_effect/buff/weed
	id = "weed"
	alert_type = /obj/screen/alert/status_effect/buff/weed
	effectedstats = list("intelligence" = 2,"speed" = -2,"fortune" = 2)
	duration = 5 MINUTES

/datum/status_effect/buff/weed/on_apply()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/obj/screen/plane_master/game_world/PM = locate(/obj/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.add_stress(/datum/stressevent/weed)

/datum/status_effect/buff/weed/on_remove()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/obj/screen/plane_master/game_world/PM = locate(/obj/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/obj/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.remove_stress(/datum/stressevent/weed)
	. = ..()

/obj/screen/alert/status_effect/buff/weed
	name = "Dazed"
	desc = "<span class='nicegreen'>I am so high maaaaaaaaan</span>\n"
	icon_state = "weed"
