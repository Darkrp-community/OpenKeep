/datum/job/roguetown/butler
	title = "Butler"
	flag = BUTLER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	f_title = "Housekeeper"
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	tutorial = "Servitude unto death, your blade a charcuterie of artisanal cheeses and meat, your armor wit and classical training. You're a part of the family now, the head of the Royal household staff and wear their colors. You alone have raised Kings, Queens, Princesses and Princes; without you the royals would have all starved to death."
	outfit = /datum/outfit/job/roguetown/butler
	display_order = JDO_BUTLER
	bypass_lastclass = TRUE
	give_bank_account = 5

/datum/outfit/job/roguetown/butler/pre_equip(mob/living/carbon/human/H)
	..()
	backpack_contents = list(/obj/item/book/rogue/manners = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, pick(1,1,2,3), TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 1)
		H.change_stat("endurance", 1)

	if(H.charflaw)
		if(H.charflaw.type != /datum/charflaw/badsight)
			var/obj/item/bodypart/O = H.get_bodypart(BODY_ZONE_R_ARM)
			if(O)
				O.drop_limb()
				qdel(O)
			O = H.get_bodypart(BODY_ZONE_L_ARM)
			if(O)
				O.drop_limb()
				qdel(O)
			H.regenerate_limb(BODY_ZONE_R_ARM)
			H.regenerate_limb(BODY_ZONE_L_ARM)
			H.charflaw = new /datum/charflaw/badsight()
			if(!istype(H.wear_mask, /obj/item/clothing/mask/rogue/spectacles))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/mask/rogue/spectacles

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		shoes = /obj/item/clothing/shoes/roguetown/nobleboot
		belt = /obj/item/storage/belt/rogue/leather/plaquesilver
		beltr = /obj/item/keyring/butler
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/butler
		backr = /obj/item/storage/backpack/rogue/satchel

	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/maid
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		cloak = /obj/item/clothing/cloak/apron
		belt = /obj/item/storage/belt/rogue/leather/cloth/lady
		beltr = /obj/item/keyring/butler
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		backr = /obj/item/storage/backpack/rogue/satchel
