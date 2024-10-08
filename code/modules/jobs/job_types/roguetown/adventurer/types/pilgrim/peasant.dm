/datum/advclass/pilgrim/peasant
	name = "Peasant"
	tutorial = "A serf with no particular proficiency of their own, born poor \
				and more likely to die poor. Farm workers, carriers, handymen."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/peasant
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/peasant/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, rand(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/taming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(3,3,4), TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/trou
	head = /obj/item/clothing/head/roguetown/strawhat
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/rogueweapon/hoe
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	beltl = /obj/item/rogueweapon/sickle
	beltr = /obj/item/flint
	if(H.gender == FEMALE)
		head = /obj/item/clothing/head/roguetown/armingcap
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = null
	backpack_contents = list(/obj/item/neuFarm/seed/wheat=1,/obj/item/neuFarm/seed/apple=1,/obj/item/ash=1,/obj/item/rogueweapon/huntingknife/villager=1)
	H.change_stat("strength", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 1)
	H.change_stat("intelligence", -1)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)	//Peasents probably smell terrible. (:
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
