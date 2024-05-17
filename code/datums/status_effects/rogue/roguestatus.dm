/datum/status_effect/stress
	id = "stress init"
	alert_type = /atom/movable/alert/status_effect/stress
	status_type = STATUS_EFFECT_REFRESH

/datum/status_effect/stress/stressinsane
	id = "insane"
	effectedstats = list("constitution" = -1, "endurance" = -2, "speed" = -2)
	alert_type = /atom/movable/alert/status_effect/stress/stressinsane
	
/atom/movable/alert/status_effect/stress/stressinsane
	name = "Insane"
	desc = "I need relief. I need relief. I need relief."
	icon_state = "stressinsane"

/datum/status_effect/stress/stressvbad
	id = "stressvbad"
	effectedstats = list("constitution" = -1,"endurance" = -1, "speed" = -1)
	alert_type = /atom/movable/alert/status_effect/stress/stressvbad

/atom/movable/alert/status_effect/stress/stressvbad
	name = "Annoyed"
	desc = "I can't focus! It's all starting to get to me."
	icon_state = "stressvbad"

/datum/status_effect/stress/stressbad
	id = "stressbad"
	effectedstats = list("speed" = -1)
	alert_type = /atom/movable/alert/status_effect/stress/stressbad

/atom/movable/alert/status_effect/stress/stressbad
	name = "Stressed"
	desc = "I'm getting fed up."
	icon_state = "stressbad"
	
/datum/status_effect/stress/stressvgood
	id = "stressvgood"
	effectedstats = list("fortune" = 1)
	alert_type = /atom/movable/alert/status_effect/stress/good/stressvgood

/atom/movable/alert/status_effect/stress/good/stressvgood
	name = "Nirvana"
	desc = "My body is a temple, and my mind a garden."
	icon_state = "stressvgood"
