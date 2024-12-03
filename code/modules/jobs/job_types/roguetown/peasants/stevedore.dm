/datum/job/roguetown/stevedore
	title = "Stevedore"
	flag = STEVEDORE
	department_flag = MERCATOR_GUILD
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

	tutorial = "You're hired by the merchant to haul goods and do errands, helping out the Steward or the Makers Guild is fine but make sure to get paid. The Merchant is your boss!"

	outfit = /datum/outfit/job/roguetown/stevedore
	give_bank_account = TRUE
	min_pq = -50
	display_order = JDO_STEVEDORE
	bypass_lastclass = TRUE

/datum/job/roguetown/stevedore/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
/datum/outfit/job/roguetown/stevedore/pre_equip(mob/living/carbon/human/H)
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

	head = /obj/item/clothing/head/roguetown/headband/red
	neck = /obj/item/roguekey/shop
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	H.change_stat("strength", 1)
	if(H.gender == MALE)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("strength", 1)//thug bodytype
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		head = /obj/item/clothing/head/roguetown/headband
		H.change_stat("endurance", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("speed", 1)

