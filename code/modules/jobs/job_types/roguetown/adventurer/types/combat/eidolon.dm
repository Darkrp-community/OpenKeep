/datum/advclass/combat/eidolon
	name = "Eidolon"
	tutorial = "The Champions of the Urn who faced demons without relying on armor, as nothing short of faith and evasion protects the user against their all-corrupting powers. Their speed is as unmatched as their strength."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	maxchosen = 1
	outfit = /datum/outfit/job/roguetown/adventurer/eidolon

/datum/outfit/job/roguetown/adventurer/eidolon/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)

	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/kaizoku/big/bronzeb
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	beltr = /obj/item/rogueweapon/sword/uchigatana
	beltl = /obj/item/rogueweapon/sword/uchigatana

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("strength", 2)
	H.change_stat("perception", -3)
	H.change_stat("speed", 5)
	H.change_stat("endurance", -2)
	H.change_stat("constitution", -1)