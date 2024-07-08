/datum/job/roguetown/merchant
	title = "Merchant"
	flag = MERCHANT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "You were born into wealth, learning from before you could talk about the basics of mathematics. Counting coins is a simple pleasure for any person, but youve made it an artform. These people are addicted to your wares and you are the literal beating heart of this economy: Dont let these filthy-covered troglodytes ever forget that."

	display_order = JDO_MERCHANT
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/merchant
	bypass_lastclass = TRUE
	give_bank_account = 22
	selection_color = "#192bc2"

/datum/outfit/job/roguetown/merchant/pre_equip(mob/living/carbon/human/H)
	..()

	neck = /obj/item/clothing/neck/roguetown/horus
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/keyring/merchant
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/merchant
	head = /obj/item/clothing/head/roguetown/chaperon
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	id = /obj/item/clothing/ring/gold/guild_mercator

	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		if(H.dna?.species)
			if(H.dna.species.id == "human")
				H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator

	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

	H.change_stat("intelligence", 2)
	H.change_stat("perception", 1)
	H.change_stat("strength", -2)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/mathematics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)

