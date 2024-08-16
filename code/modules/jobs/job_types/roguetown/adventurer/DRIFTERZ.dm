
/*
	Once again we are back here, ha hahaha....
	Also this is basically just a shell for the drifter queue system to manipulate.
*/
/datum/job/roguetown/drifters
	title = "Drifter"
	flag = WAVE_DRIFTER
	department_flag = PEASANTS
	faction = "Station"
	show_in_credits = FALSE

	// Everyone can be a homeless man looking for work!
	allowed_races = ALL_RACES_LIST_NAMES

	tutorial = "A drifter of unknown origin searching things such as fame, fortune, and perhaps just some work to do."


	outfit = null
	outfit_female = null

	display_order = JDO_DRIFTER
	show_in_credits = TRUE
	min_pq = -999

	total_positions = 0
	spawn_positions = 0
	advclass_cat_rolls = list(CTAG_PILGRIM = 2, CTAG_ADVENTURER = 2)

/datum/job/roguetown/drifters/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		if(!H.mind)
			if(HAS_TRAIT(H, TRAIT_ASSASSIN)) // If the mob is an assassin, they will be given the assassin antag.
				var/datum/antagonist/new_antag = new /datum/antagonist/assassin()
				H.mind.add_antag_datum(new_antag)
		if(!H.mind)
			if(HAS_TRAIT(H, TRAIT_NECROMANCER)) // if the mob is a necromancer, they will be given the necromancer antag (i want to enact pain on this antag)
				var/datum/antagonist/new_antag = new /datum/antagonist/necromancer()
				H.mind.add_antag_datum(new_antag)

