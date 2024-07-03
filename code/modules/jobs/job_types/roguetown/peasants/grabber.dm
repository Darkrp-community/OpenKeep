/datum/job/roguetown/grabber
	title = "Hauler"
	flag = GRABBER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

	tutorial = "Hauler is one of the lowest positions in town, they are expected to aid steward, merchant, masons, and blacksmiths in hauling goods and deliveries."

	outfit = /datum/outfit/job/roguetown/grabber
	give_bank_account = TRUE
	display_order = JDO_GRABBER
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/grabber/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE) // You get a cudgel for nonlethal self defense and that's it.
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.change_stat("strength", 1)
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		pants = /obj/item/clothing/under/roguetown/tights/sailor
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/rogueweapon/mace/cudgel
		beltl = /obj/item/roguekey/warehouse
		belt = /obj/item/storage/belt/rogue/leather/rope
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		if(prob(30))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
		if(prob(23))
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 2)
		H.change_stat("speed", 1)
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
		pants = /obj/item/clothing/under/roguetown/tights/sailor
		beltr = /obj/item/rogueweapon/mace/cudgel
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltl = /obj/item/roguekey/warehouse
		belt = /obj/item/storage/belt/rogue/leather/rope
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		if(prob(23))
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		if(prob(77))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
		H.change_stat("endurance", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
