/datum/advclass/mercenary/valoria
	name = "Valorian Swordfighter"
	tutorial = "Born of humble origins and driven by desperation, you sought survival in the service of the Gold Courts of the Valorian Coin Lords. There, commoners like you were thrown into brutal duels, mere pawns in the Coin Lords' power struggles—pitted against one another to settle disputes for the wealthy elite. You never sought glory, only the hope of a payday. Fearing the day your luck might run out, you abandoned the bloodshed and signed on as a guard for the Merchant Guild, eventually finding yourself on this remote place, you are an skilled swordsman with a good shield to fend off any threat."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen"
	)//valorian elfs will get their own mercenary role when possible
	outfit = /datum/outfit/job/roguetown/mercenary/valoria
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 4
	cmode_music = 'sound/music/combat_weird.ogg'//undead music for undead ruled nation habitant innit?
/datum/outfit/job/roguetown/mercenary/valoria/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)//average infantrymen merc class, 4 weapon skills like other merc classes and medium armor training
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE) // standarized skills for infantryman
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)//so they can heal themselves, after all they didn't survived the mercenary life without know how to sew their wounds


	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/sword/rapier/iron
	neck = /obj/item/clothing/neck/roguetown/gorget
	pants = /obj/item/clothing/under/roguetown/tights/green
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/mercenary
	shirt = shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather//leather armor so they match other roles that get heavy leather gloves
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	armor = armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
	backl = /obj/item/rogueweapon/shield/tower/buckleriron
	backr = /obj/item/storage/backpack/rogue/satchel

	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
