/datum/status_effect/buff
	status_type = STATUS_EFFECT_REFRESH


/datum/status_effect/buff/drunk
	id = "drunk"
	alert_type = /atom/movable/screen/alert/status_effect/buff/drunk
	effectedstats = list("intelligence" = -1, "speed" = -1, "endurance" = 1)
	duration = 12 MINUTES

/atom/movable/screen/alert/status_effect/buff/drunk
	name = "Drunk"
	desc = "<span class='nicegreen'>I feel very drunk.</span>\n"
	icon_state = "drunk"

/datum/status_effect/buff/drunk/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/drunk)
/datum/status_effect/buff/drunk/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/drunk)

/datum/status_effect/buff/foodbuff
	id = "foodbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/foodbuff
	effectedstats = list("constitution" = 1,"endurance" = 1)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/buff/foodbuff
	name = "Great Meal"
	desc = "<span class='nicegreen'>That was a good meal!</span>\n"
	icon_state = "foodbuff"

/datum/status_effect/buff/foodbuff/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/goodfood)

/datum/status_effect/buff/druqks
	id = "druqks"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("endurance" = 3,"speed" = 3,"fortune" = -5)
	duration = 2 MINUTES

/datum/status_effect/buff/druqks/on_apply()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.add_stress(/datum/stressevent/high)


/datum/status_effect/buff/druqks/on_remove()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.remove_stress(/datum/stressevent/high)

/atom/movable/screen/alert/status_effect/buff/druqks
	name = "High"
	desc = "<span class='nicegreen'>I am tripping balls.</span>\n"
	icon_state = "acid"

/datum/status_effect/buff/ozium
	id = "ozium"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
	effectedstats = list("speed" = -99)
	duration = 2 MINUTES

/datum/status_effect/buff/ozium/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/ozium)
	ADD_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)

/datum/status_effect/buff/ozium/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_NOPAIN, TRAIT_GENERIC)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/ozium)

/datum/status_effect/buff/moondust
	id = "moondust"
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
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
	alert_type = /atom/movable/screen/alert/status_effect/buff/druqks
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
	alert_type = /atom/movable/screen/alert/status_effect/buff/weed
	effectedstats = list("intelligence" = 2,"speed" = -2,"fortune" = 2)
	duration = 5 MINUTES

/datum/status_effect/buff/weed/on_apply()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.add_stress(/datum/stressevent/weed)

/datum/status_effect/buff/weed/on_remove()
	. = ..()
	if(owner?.client)
		if(owner.client.screen && owner.client.screen.len)
			var/atom/movable/screen/plane_master/game_world/PM = locate(/atom/movable/screen/plane_master/game_world) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_fov_hidden) in owner.client.screen
			PM.backdrop(owner)
			PM = locate(/atom/movable/screen/plane_master/game_world_above) in owner.client.screen
			PM.backdrop(owner)
			var/mob/living/carbon/C = owner
			C.remove_stress(/datum/stressevent/weed)

/atom/movable/screen/alert/status_effect/buff/weed
	name = "Dazed"
	desc = "<span class='nicegreen'>I am so high maaaaaaaaan</span>\n"
	icon_state = "weed"

/datum/status_effect/buff/ravox
	id = "ravoxbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/ravoxbuff
	effectedstats = list("constitution" = 1,"endurance" = 1,"strength" = 1)
	duration = 240 MINUTES

/atom/movable/screen/alert/status_effect/buff/ravoxbuff
	name = "Divine Power"
	desc = "<span class='nicegreen'>Divine power flows through me.</span>\n"
	icon_state = "ravox"

/datum/status_effect/buff/calm
	id = "calm"
	alert_type = /atom/movable/screen/alert/status_effect/buff/calm
	effectedstats = list("fortune" = 1)
	duration = 240 MINUTES

/atom/movable/screen/alert/status_effect/buff/calm
	name = "Calmness"
	desc = "<span class='nicegreen'>I feel a supernatural calm coming over me.</span>\n"
	icon_state = "stressg"

/datum/status_effect/buff/calm/on_apply()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/calm)

/datum/status_effect/buff/calm/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/calm)

/datum/status_effect/buff/noc
	id = "nocbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/nocbuff
	effectedstats = list("intelligence" = 3)
	duration = 240 MINUTES

/atom/movable/screen/alert/status_effect/buff/nocbuff
	name = "Divine Knowledge"
	desc = "<span class='nicegreen'>Divine knowledge flows through me.</span>\n"
	icon_state = "intelligence"

/datum/status_effect/buff/barbrage
	id = "barbrage"
	alert_type = /atom/movable/screen/alert/status_effect/buff/barbrage
	effectedstats = list("strength" = 1, "endurance" = 2, "perception" = -2, "intelligence" = -2) //endurance to boost pain treshold, not powerful enough to warrant total painkilling
	duration = 15 SECONDS

/atom/movable/screen/alert/status_effect/buff/barbrage
	name = "Barbaric Rage"
	desc = "<span class='nicegreen'>WITNESS ME!</span>\n"
	icon_state = "ravox"

/datum/status_effect/buff/barbrage/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.apply_status_effect(/datum/status_effect/debuff/barbfalter)
    
// BARDIC BUFFS BELOW

/datum/status_effect/bardicbuff
	var/name
	id = "bardbuff"
	tick_interval = 1 SECONDS
	status_type = STATUS_EFFECT_REFRESH
	alert_type = /atom/movable/screen/alert/status_effect/bardbuff
	duration = 50 // Sanity, so that people outside the bard buff listening area lose the buff after a few seconds

/datum/status_effect/bardicbuff/on_apply()
	if(owner.mind?.has_antag_datum(/datum/antagonist)) // Check if antag datum present
		if(owner.mind?.isactuallygood()) // Then check if they're actually a "good" antag (purishep, prisoner)
			for(var/S in effectedstats)
				owner.change_stat(S, effectedstats[S])
			return TRUE
		else // Otherwise, no buff
			return FALSE
	else // All non antags get the buffs
		for(var/S in effectedstats)
			owner.change_stat(S, effectedstats[S])
		return TRUE

// SKELETON BARD BUFF ALERT
/atom/movable/screen/alert/status_effect/bardbuff
	name = "Musical buff"
	desc = "My stats have been buffed by music!"
	icon_state = "intelligence"

// TIER 1 - WEAK
/datum/status_effect/bardicbuff/intelligence
	name = "Enlightening (+1 INT)"
	id = "bardbuff_int"
	effectedstats = list("intelligence" = 1)

// TIER 2 - AVERAGE
/datum/status_effect/bardicbuff/endurance
	name = "Invigorating (+1 END)"
	id = "bardbuff_end"
	effectedstats = list("endurance" = 1)

// TIER 3 - SKILLED
/datum/status_effect/bardicbuff/constitution
	name = "Fortitude (+1 CON)"
	id = "bardbuff_con"
	effectedstats = list("constitution" = 1)

// TIER 4 - EXPERT
/datum/status_effect/bardicbuff/speed
	name = "Inspiring (+1 SPD)"
	id = "bardbuff_spd"
	effectedstats = list("speed" = 1)

// TIER 5 - MASTER
/datum/status_effect/bardicbuff/ravox
	name = "Empowering (+1 STR, +1 PER)"
	id = "bardbuff_str"
	effectedstats = list("strength" = 1, "perception" = 1)

// TIER 6 - LEGENDARY
/datum/status_effect/bardicbuff/awaken
	name = "Awaken! (purges sleep)"
	id = "bardbuff_awaken"
	effectedstats = list("fortune" = 1)

/datum/status_effect/bardicbuff/awaken/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/O = owner
		if(owner.mind?.has_antag_datum(/datum/antagonist))
			if(owner.mind.isactuallygood()) // Check for "good antags"
				for(var/S in effectedstats)
					owner.change_stat(S, effectedstats[S])
				if(O.has_status_effect(/datum/status_effect/debuff/sleepytime))
					O.remove_status_effect(/datum/status_effect/debuff/sleepytime)
					O.tiredness = 0
					if(O.IsSleeping())
						O.SetSleeping(0) // WAKE UP!
					O.adjust_triumphs(1) // Before people start crying about muh triumph lost
					to_chat(O, "<span class='nicegreen'>Astrata's blessed light cleanses away your tiredness!</span>")
			else
				return
		else
			for(var/S in effectedstats)
				owner.change_stat(S, effectedstats[S])
			if(O.has_status_effect(/datum/status_effect/debuff/sleepytime))
				O.remove_status_effect(/datum/status_effect/debuff/sleepytime)
				O.tiredness = 0
				if(O.IsSleeping())
					O.SetSleeping(0) // GRAB A BRUSH AND PUT A LITTLE MAKEUP
				O.adjust_triumphs(1) // Before people start crying about muh triumph lost
				to_chat(O, "<span class='nicegreen'>Astrata's blessed light cleanses away your tiredness!</span>")
			else
				return	
