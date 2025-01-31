/datum/reagent/fogblight
	name = "fogblight"
	description = "liquid concentrate from fog island's frogs. Used by shinobis."
	taste_description = ""
	reagent_state = LIQUID
	color = "#1f434d"
	metabolization_rate = 0.2

/datum/reagent/fogblight/on_mob_life(mob/living/carbon/M)
	switch(current_cycle)
		if(1 to 10)
			M.confused += 2
			M.drowsyness += 2
		if(10 to 50)
			M.Sleeping(40, 0)
			. = 1
		if(51 to INFINITY)
			M.Sleeping(40, 0)
			M.adjustToxLoss((current_cycle - 50)*REM, 0)
			. = 1
	..()

/*--------------\
| spell reagent |
\--------------*/

/datum/reagent/medicine/abyssalpurificator
	name = "abyssal purification"
	description = "abyssor be with you."
	reagent_state = LIQUID
	metabolization_rate = 0.5
	color = "#8fb9bc"

/datum/reagent/medicine/abyssalpurificator/on_mob_life(mob/living/carbon/affected_mob, seconds_per_tick, times_fired)
	for(var/datum/reagent/target_reagent in affected_mob.reagents.reagent_list)
		if(istype(target_reagent, /datum/reagent/medicine/abyssalpurificator))
			continue
		// Remove 2 units of the reagent per second, scaled by the server's REM and tick rate
		affected_mob.reagents.remove_reagent(target_reagent.type, 2 * REM * seconds_per_tick)