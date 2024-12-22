/datum/advclass/mercenary/boltslinger
	name = "Vagabond Boltslinger"
	tutorial = "A cutthroat and a soldier of fortune, your mastery of the crossbow has brought you to many battlefields, all in pursuit of mammon, you don't stay behind from being a good fighter with one handed swords either."
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
	outfit = /datum/outfit/job/roguetown/mercenary/boltslinger
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 5


/datum/outfit/job/roguetown/mercenary/boltslinger/pre_equip(mob/living/carbon/human/H)
	..()

	head = /obj/item/clothing/head/roguetown/helmet/kettle
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	cloak = /obj/item/clothing/cloak/half
	gloves = /obj/item/clothing/gloves/roguetown/angle
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	belt = /obj/item/storage/belt/rogue/leather/mercenary
	beltr = /obj/item/rogueweapon/sword/iron
	beltl = /obj/item/quiver/bolts
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow

	if(H.mind)//crossbow mercenary with armor training 4 weapon skills and a ranged weapon
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, pick(0,0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

	H.change_stat("perception", 3)
	H.change_stat("endurance", 1)
	H.change_stat("strength", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
