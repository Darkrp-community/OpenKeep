
/datum/advclass/combat/puritan
	name = "Witch Hunter"
	tutorial = "Witch Hunters dedicate their lives to the eradication of the varied evils infesting Grimoria.<br>\
	They know the vile sorcery of the necromancer, the insidious nature of the cultist and monstrousness of vampires and werevolfs.<br>\
	They also know how best to end them."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Changeling",
		"Kenku",
		"Ogrun",
		"Undine"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/puritan
	maximum_possible_slots = 1
	pickprob = 15
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 2

/datum/outfit/job/roguetown/adventurer/puritan/pre_equip(mob/living/carbon/human/H)
	..()

	head = /obj/item/clothing/head/roguetown/helmet/leather/inquisitor
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	cloak = /obj/item/clothing/cloak/cape/puritan
	gloves = /obj/item/clothing/gloves/roguetown/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/whip/antique/silver
	beltr = /obj/item/rogueweapon/sword/rapier/silver
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/black

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)

		switch(H.patron?.name)
			if("Astrata")
				wrists = /obj/item/clothing/neck/roguetown/psycross/silver/astrata
			if("Necra")
				wrists = /obj/item/clothing/neck/roguetown/psycross/silver/necra
			if("Pestra")
				wrists = /obj/item/clothing/neck/roguetown/psycross/silver/pestra
			else
				wrists = /obj/item/clothing/wrists/roguetown/bracers/leather

	H.change_stat("intelligence", 1)
	H.change_stat("strength", 1)
	H.change_stat("perception", 2)
	H.change_stat("constitution", 2)

	H.verbs |= /mob/living/carbon/human/proc/torture_victim

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)		//If they have torture variables, they shouldn't be effected by stuff.
