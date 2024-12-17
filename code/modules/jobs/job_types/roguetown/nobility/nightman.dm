/datum/job/roguetown/nitemaster
	title = "Nitemaster"
	flag = NIGHTMAN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	f_title = "Nitematron"

	allowed_races = list(
		"Humen",
		"Dwarf",
		"Elf",
		"Half-Elf",
	)

	tutorial = "You are the master of the bath-house guild, likely a disgraced noble who fell on hard times. Whatever the reason, you now have a supply of drugs and nitemaidens to employ and profit from. Fencing valuables stolen by bandits and rogues might provide even more mammons, to wash away the shame your trade has brought you and your family."

	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/roguetown/niteman
	display_order = JDO_NITEMAN
	give_bank_account = 100
	min_pq = 1
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/niteman/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/keyring/niteman
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE) // Need the strongarm to wrestle people out of the baths
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)	// Don't make me regret these levels.
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
		if(H.dna?.species)
			if(H.dna.species.id == "human")
				H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
			if(H.dna.species.id == "elf")
				armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
			if(H.dna.species.id == "dwarf")
				armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	else
		pants = /obj/item/clothing/under/roguetown/tights
