/datum/job/roguetown/niteman
	title = "Niteman"
	flag = JESTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	f_title = "Nitematron"

	allowed_races = list(
		"Humen",
		"Dwarf",
		"Elf",
		"Half-Elf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

	tutorial = "You are renting out the bath-house in a joint operation with the Innkeep. Providing security for the bathwenches and helping them find work, or a troublemaking rake that the others hate to tolerate."

	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/niteman
	display_order = JDO_NITEMAN
	give_bank_account = 100
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/niteman/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/keyring/niteman
	beltl = /obj/item/rogueweapon/huntingknife
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE) // Need the strongarm to wrestle people out of the baths
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)	// Don't make me regret these levels.
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/niteman
		if(H.dna?.species)
			if(H.dna.species.id == "human")
				H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
			if(H.dna.species.id == "elf")
				armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
			if(H.dna.species.id == "dwarf")
				armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	else
		pants = /obj/item/clothing/under/roguetown/tights
		armor = /obj/item/clothing/suit/roguetown/armor/armordress/alt
