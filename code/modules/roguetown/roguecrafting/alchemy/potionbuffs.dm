/atom/movable/screen/alert/status_effect/buff/alch
	desc = "Power rushes through your veins."
	icon_state = "buff"

/datum/status_effect/buff/alch/strengthpot
	id = "strpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/strengthpot
	effectedstats = list("strength" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/strengthpot
	name = "Strength"
	icon_state = "buff"

/datum/status_effect/buff/alch/perceptionpot
	id = "perpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/perceptionpot
	effectedstats = list("perception" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/perceptionpot
	name = "Perception"
	icon_state = "buff"

/datum/status_effect/buff/alch/intelligencepot
	id = "intpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/intelligencepot
	effectedstats = list("intelligence" = 3)
	duration = 3000

/atom/movable/screen/alert/status_effect/buff/alch/intelligencepot
	name = "Intelligence"
	icon_state = "buff"

/datum/status_effect/buff/alch/constitutionpot
	id = "conpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/constitutionpot
	effectedstats = list("constitution" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/constitutionpot
	name = "Constitution"
	icon_state = "buff"

/datum/status_effect/buff/alch/endurancepot
	id = "endpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/endurancepot
	effectedstats = list("endurance" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/endurancepot
	name = "Endurance"
	icon_state = "buff"

/datum/status_effect/buff/alch/speedpot
	id = "spdpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/speedpot
	effectedstats = list("speed" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/speedpot
	name = "Speed"
	icon_state = "buff"

/datum/status_effect/buff/alch/fortunepot
	id = "forpot"
	alert_type = /atom/movable/screen/alert/status_effect/buff/alch/fortunepot
	effectedstats = list("fortune" = 3)
	duration = 300

/atom/movable/screen/alert/status_effect/buff/alch/fortunepot
	name = "Fortune"
	icon_state = "buff"



	
/*
/datum/status_effect/buff/foodbuff
	id = "foodbuff"
	alert_type = /obj/screen/alert/status_effect/buff/foodbuff
	effectedstats = list("constitution" = 1,"endurance" = 1)
	duration = 10 MINUTES

/datum/status_effect/buff/foodbuff/on_apply()
	owner.add_stress(/datum/stressevent/goodfood)
	return ..()

/obj/screen/alert/status_effect/buff/foodbuff
	name = "Great Meal"
	desc = ""
	icon_state = "foodbuff"*/
