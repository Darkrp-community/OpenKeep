/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /obj/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("speed" = -1,"strength" = -1, "constitution" = -1, "endurance" = -1)
	duration = 100

/obj/screen/alert/status_effect/debuff/hungryt1
	name = "Peckish, stomach growling"
	desc = "<span class='warning'>I am getting hungry.</span>\n"
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt1/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/peckish)
	return ..()

/datum/status_effect/debuff/hungryt1/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/peckish)
	return ..()

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /obj/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list("speed" = -4,"strength" = -2, "constitution" = -2, "endurance" = -1)
	duration = 100

/obj/screen/alert/status_effect/debuff/hungryt2
	name = "Hungry, need food"
	desc = "<span class='warning'>My stomach hurts, I need food.</span>\n"
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt2/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/hungry)
	return ..()

/datum/status_effect/debuff/hungryt2/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/hungry)
	return ..()

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /obj/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list("speed" = -6,"strength" = -6, "constitution" = -6, "endurance" = -6)
	duration = 100

/obj/screen/alert/status_effect/debuff/hungryt3
	name = "STARVING"
	desc = "<span class='boldwarning'>I AM STARVING!</span>\n"
	icon_state = "hunger3"

/datum/status_effect/debuff/hungryt3/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/starving)
	return ..()

/datum/status_effect/debuff/hungryt3/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/starving)
	return ..()
////////////////////

/datum/status_effect/debuff/thirstyt1
	id = "thirstyt1"
	alert_type = /obj/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list("endurance" = -1, "speed" = -1)
	duration = 100

/obj/screen/alert/status_effect/debuff/thirstyt1
	name = "Getting thirsty"
	desc = "<span class='warning'>I could use a drink.</span>\n"
	icon_state = "thirst1"


/datum/status_effect/debuff/thirstyt1/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/drym)
	return ..()

/datum/status_effect/debuff/thirstyt1/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/drym)
	return ..()

/datum/status_effect/debuff/thirstyt2
	id = "thirstyt2"
	alert_type = /obj/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list("speed" = -4, "endurance" = -4)
	duration = 100

/obj/screen/alert/status_effect/debuff/thirstyt2
	name = "Extremly thirsty"
	desc = "<span class='warning'>If I don't drink something soon, my mouth will be sand.</span>\n"
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt2/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/thirst)
	return ..()

/datum/status_effect/debuff/thirstyt2/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/thirst)
	return ..()

/datum/status_effect/debuff/thirstyt3
	id = "thirstyt3"
	alert_type = /obj/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list("strength" = -6, "speed" = -6, "endurance" = -6)
	duration = 100

/obj/screen/alert/status_effect/debuff/thirstyt3
	name = "Extreme Dehydration"
	desc = "<span class='boldwarning'>I AM DYING OF THIRST!</span>\n"
	icon_state = "thirst3"

/datum/status_effect/debuff/thirstyt3/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/parched)
	return ..()

/datum/status_effect/debuff/thirstyt3/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_stress(/datum/stressevent/parched)
	return ..()

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 10 MINUTES
	alert_type = /obj/screen/alert/status_effect/debuff/uncookedfood

/obj/screen/alert/status_effect/debuff/uncookedfood
	name = "Raw Food!"
	desc = "<span class='warning'>Augh! Why didn't I bring that food to fire!?"
	icon_state = "uncookedfood"

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
		C.add_stress(/datum/stressevent/uncookedfood)
	return ..()

/datum/status_effect/debuff/badmeal
	alert_type = /obj/screen/alert/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 10 MINUTES

/obj/screen/alert/status_effect/debuff/badmeal
	name = "Foul Food!"
	desc = "<span class='warning'>That tasted like zcum!"
	icon_state = "badmeal"

/datum/status_effect/debuff/badmeal/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	alert_type = /obj/screen/alert/status_effect/debuff/burntmeal
	id = "burnedfood"
	effectedstats = null
	duration = 10 MINUTES

/datum/status_effect/debuff/burnedfood/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_stress(/datum/stressevent/burntmeal)
		C.add_nausea(100)
	return ..()

/obj/screen/alert/status_effect/debuff/burntmeal
	name = "Burnt Food!"
	desc = "<span class='warning'>That tasted like charcoal and cinder!"
	icon_state = "burntmeal"

/datum/status_effect/debuff/rotfood
	alert_type = /obj/screen/alert/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 10 MINUTES

/obj/screen/alert/status_effect/debuff/rotfood
	name = "Rotten Food!"
	desc = "<span class='warning'>MAGGOT-INFESTED BILE RISES TO MY THROAT!"
	icon_state = "burntmeal"

/datum/status_effect/debuff/rotfood/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
		C.add_stress(/datum/stressevent/rotfood)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /obj/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list("speed" = -2)
	duration = 100

/obj/screen/alert/status_effect/debuff/bleedingt1
	name = "Dizzy"
	desc = "<span class='warning'>Gah! I am bleeding!</span>\n"
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /obj/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list("strength" = -1, "speed" = -4)
	duration = 100

/obj/screen/alert/status_effect/debuff/bleedingt2
	name = "Faint"
	desc = "<span class='warning'>I am bleeding heavily! Help!</span>\n"
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /obj/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list("strength" = -3, "speed" = -6)
	duration = 100

/obj/screen/alert/status_effect/debuff/bleedingt3
	name = "Drained"
	desc = "<span class='boldwarning'>I feel like I am dying.. so.. weak..</span>\n"
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /obj/screen/alert/status_effect/debuff/sleepytime
	effectedstats = list("speed" = -2, "endurance" = -2)

/obj/screen/alert/status_effect/debuff/sleepytime
	name = "Tired"
	desc = "<span class='warning'>I am feeling tired.</span>\n"
	icon_state = "sleepy"

/datum/status_effect/debuff/trainsleep
	id = "trainsleep"
	alert_type = /obj/screen/alert/status_effect/debuff/trainsleep
	effectedstats = list("strength" = -3, "speed" = -3,"endurance" = -3)

/obj/screen/alert/status_effect/debuff/trainsleep
	name = "Muscle Soreness"
	desc = "<span class='warning'>Gaaaah, So sooooooore.</span>\n"
	icon_state = "muscles"
