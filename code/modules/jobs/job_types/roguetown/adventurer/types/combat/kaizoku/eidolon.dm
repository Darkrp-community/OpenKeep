/datum/advclass/combat/abyssariad/eidolon //We balling with the literal reference
	name = "Eidolon"
	tutorial = "Scarred by hellfire and face-forged in abyssal urns, the Eidolon are bound to the task of demonslaying. Their faith and speed shields the flesh when armor would not, defying the limits of flesh. The hells weights their hands on a daily basis, long begging for a destructive release."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/eidolon

/datum/outfit/job/roguetown/adventurer/abyssariad/eidolon/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)

	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bronzepot // cursed item.
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	beltr = /obj/item/rogueweapon/greatsword/odachi
	neck = /obj/item/clothing/neck/roguetown/bevor
	wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("strength", 2)
	H.change_stat("speed", 2)
	H.change_stat("endurance", 1)
	H.change_stat("perception", -2) //Using a urn on the head surely can't lead to good things.
	H.change_stat("constitution", -1)
	H.change_stat("intelligence", -1)