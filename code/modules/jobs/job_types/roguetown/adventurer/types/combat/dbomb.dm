/datum/advclass/comatb/dbomb
	name = "Dwarf"
	tutorial = "Dwarves like to blow things up."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Dwarf")
	outfit = /datum/outfit/job/roguetown/adventurer/dbomb
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/dbomb/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/horned
	pants = /obj/item/clothing/under/roguetown/trou
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/bomb = 1, /obj/item/flint = 1)
	switch(pick(1,2))
		if (1)
			beltl = /obj/item/rogueweapon/pick		
		if (2)
			beltl = /obj/item/rogueweapon/hammer
	switch(pick(1,2))
		if (1)
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather	
		if (2)
			shoes = /obj/item/clothing/shoes/roguetown/simpleshoes

/datum/outfit/job/roguetown/adventurer/dbomb/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)

	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
