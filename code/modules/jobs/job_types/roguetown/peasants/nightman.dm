/datum/job/roguetown/nightman
	title = "Nightman"
	flag = JESTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dark Elf",
		"Tiefling",
		"Aasimar"
	)

	tutorial = "You are renting out the bath-house in a joint operation with the barkeep. Providing security for the bathwenches and helping them find work, or a troublemaking rake that the others hate to tolerate."

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	outfit = /datum/outfit/job/roguetown/nightman
	display_order = JDO_NIGHTMAN
	give_bank_account = TRUE
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/nightman/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/keyring/nightman
	beltl = /obj/item/rogueweapon/huntingknife
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -1)
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()
		if(H.dna.species.id == "elf")
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		if(H.dna.species.id == "dwarf")
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
