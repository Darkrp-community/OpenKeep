/datum/food_processor_process
	var/input
	var/output
	var/time = 40
	var/required_machine = /obj/machinery/processor

/datum/food_processor_process/mob/slime
	input = /mob/living/simple_animal/slime
	output = null
	required_machine = /obj/machinery/processor/slime

