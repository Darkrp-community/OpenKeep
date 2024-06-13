/datum/job/roguetown/veteran
	title = "Veteran"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	tutorial = "You've known combat your entire life. There isn't a way to kill a man you haven't practiced in the tapestries of war itself. \
				You wouldn't call yourself a hero, those belong to the men left rotting in the fields of where you practiced your ancient trade. \
				Trading adventure for stable pay was the only logical solution, and maybe someday you'll get to lay down the blade for good..."
	allowed_ages = list(AGE_OLD)
	display_order = JDO_VET
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/veteran
	give_bank_account = 50

/datum/outfit/job/roguetown/veteran/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/half/vet
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond
	armor = /obj/item/clothing/suit/roguetown/armor/plate/scale
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/keyring/guardcastle
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/sword
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)

	if(H.charflaw)
		if(H.charflaw.type != /datum/charflaw/noeyer)
			if(H.charflaw.type != /datum/charflaw/noeyel)
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
				H.charflaw = new /datum/charflaw/noeyer()
				if(!istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch))
					qdel(H.wear_mask)
					mask = /obj/item/clothing/mask/rogue/eyepatch

	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Desensitized through thousand campaigns
