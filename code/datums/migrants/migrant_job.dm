/datum/job/roguetown/migrant
	title = "Migrant"
	flag = MIGRANT
	department_flag = PEASANTS
	faction = "Station"
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	outfit = null
	outfit_female = null
	display_order = JDO_MIGRANT
	show_in_credits = FALSE
	min_pq = -999
	total_positions = 0
	spawn_positions = 0

/datum/job/roguetown/migrant/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(GLOB.adventurer_hugbox_duration)
			///FOR SOME FUCKING REASON THIS REFUSED TO WORK WITHOUT A FUCKING TIMER IT JUST FUCKED SHIT UP
			addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, adv_hugboxing_start)), 1)
