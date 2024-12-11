GLOBAL_LIST_EMPTY(billagerspawns)

/datum/job/roguetown/adventurer
	title = "Adventurer"
	flag = ADVENTURER
	department_flag = OUTSIDERS
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	tutorial = "Hero of nothing, adventurer by trade. Whatever led you to this fate is up to the wind to decide, and you've never fancied yourself for much other than the thrill. Someday your pride is going to catch up to you, and you're going to find out why most men don't end up in the annals of history."


	outfit = null
	outfit_female = null

	var/isvillager = FALSE
	var/ispilgrim = FALSE
	display_order = JDO_ADVENTURER
	show_in_credits = FALSE
	min_pq = 0
	always_show_on_latechoices = TRUE
	job_reopens_slots_on_death = TRUE
	same_job_respawn_delay = 15 MINUTES
	bypass_lastclass = TRUE
	advclass_cat_rolls = list(CTAG_ADVENTURER = 15)


/datum/job/roguetown/adventurer/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
