/datum/skill/labor
	abstract_type = /datum/skill/labor
	name = "Labor"
	desc = ""

/datum/skill/labor/mining
	name = "Mining"

/datum/skill/labor/mining/get_skill_speed_modifier(level)
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 1.3
		if(SKILL_LEVEL_NOVICE)
			return 1.2
		if(SKILL_LEVEL_APPRENTICE)
			return 1.1
		if(SKILL_LEVEL_JOURNEYMAN)
			return 1
		if(SKILL_LEVEL_EXPERT)
			return 0.9
		if(SKILL_LEVEL_MASTER)
			return 0.75
		if(SKILL_LEVEL_LEGENDARY)
			return 0.5

/datum/skill/labor/farming
	name = "Farming"

/datum/skill/labor/taming
	name = "Taming"
	dreams = list(
		"...the water is stillborne, quiet... pristine, as if untouched... the line bobs down, and you let it writhe as you stare down at your reflection..."
	)

/datum/skill/labor/mathematics
	name = "Mathematics"
	dreams = list(
		"...arches... mathematically perfect... ah..."
	)

/datum/skill/labor/fishing
	name = "Fishing"
	dreams = list(
		"...my only friend, the worm upon my hook. wriggling, writhing, struggling to surmount the mortal pointlessness that permeates this barren world. i am alone. i am empty. and yet, i fish. ..."
	)

/datum/skill/labor/butchering
	name = "Butchering"
	dreams = list(
		"...you dream of chiseling a marble statue, a small rabbit... and when you open your eyes, the skin is seperated from the flesh..."
	)

/datum/skill/labor/lumberjacking
	name = "Lumberjacking"
	dreams = list(
		"...splinters fly off as a tree falls down on the ground, sending a thundering boom throughout the forest..."
	)
