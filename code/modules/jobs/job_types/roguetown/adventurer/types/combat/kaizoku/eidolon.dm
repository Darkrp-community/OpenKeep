/datum/advclass/combat/abyssariad/eidolon //We balling with the literal reference. Just less on the naked side for REASONS.
	name = "Eidolon"
	tutorial = "Scarred by hellfire and face-forged in abyssal urns, the Eidolon are bound to the task of demonslaying. \
	Their faith and speed shields the flesh when armor would not, defying the limits of flesh. \
	The hells weights their hands on a daily basis, long begging for a destructive release."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/eidolon
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 1
	pickprob = 100

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
	backr = /obj/item/rogueweapon/greatsword/odachi
	neck = /obj/item/clothing/neck/roguetown/gorget
	cloak = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo/eidolon
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded/kikko/eidolon
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/eidolon
	wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
	pants = /obj/item/clothing/under/roguetown/tobi/hakama/eidolon

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("strength", 2)
	H.change_stat("speed", 2)
	H.change_stat("endurance", 1)
	H.change_stat("perception", -2) //Using a urn on the head, struggling for years to understand how the magic reflected light functions surely can't lead to a good sight.
	H.change_stat("intelligence", -1)