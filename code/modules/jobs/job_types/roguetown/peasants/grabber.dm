/datum/job/roguetown/grabber
	title = "Steveador"
	flag = GRABBER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

	tutorial = "Be an Steveador is one of the lowest, yet most needed positions in town, they are expected to aid the Merchant, steward, masons, and blacksmiths in hauling goods and deliveries while they keep an eye on the goods and the warehouses of the town."

	outfit = /datum/outfit/job/roguetown/grabber
	give_bank_account = TRUE
	display_order = JDO_GRABBER
	bypass_lastclass = TRUE

/datum/job/roguetown/grabber/after_spawn(mob/living/L, mob/M, latejoin = TRUE)

/datum/outfit/job/roguetown/grabber/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE) // You get a cudgel for nonlethal self defense and that's it.
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)//they can use the merchant machine and that's it
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.change_stat("strength", 1)
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		pants = /obj/item/clothing/under/roguetown/tights/sailor
		head = /obj/item/clothing/head/roguetown/headband/red
		beltr = /obj/item/rogueweapon/mace/cudgel
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		wrists = /obj/item/keyring/steveador
		belt = /obj/item/storage/belt/rogue/leather/rope
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("strength", 1)//thug bodytype
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
		pants = /obj/item/clothing/under/roguetown/tights/sailor
		beltr = /obj/item/rogueweapon/mace/cudgel
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		wrists = /obj/item/keyring/steveador
		belt = /obj/item/storage/belt/rogue/leather/rope
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
		head = /obj/item/clothing/head/roguetown/headband
		H.change_stat("endurance", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 1)
