//master carpenter

/datum/advclass/pilgrim/rare/mastercarpenter
	name = "Master Carpenter"
	tutorial = "A master carpenter, unlike the masons you went to discover the secrets of the wood. \
	Dendorian followers taught you how to transform the wood into anything you wish, \
	but you swore to chop down trees only when it is necessary."

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Humen",
	"Elf",
	"Half-Elf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/mastercarpenter
	category_tags = list(CTAG_PILGRIM)
	maximum_possible_slots = 1
	pickprob = 15

/datum/outfit/job/roguetown/adventurer/mastercarpenter/pre_equip(mob/living/carbon/human/H)
	..()

	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) // They work at great heights.
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)

	head = /obj/item/clothing/head/roguetown/hatblu
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	pants = /obj/item/clothing/under/roguetown/trou
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/hammer/claw
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueweapon/huntingknife = 1)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 3)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 1)
