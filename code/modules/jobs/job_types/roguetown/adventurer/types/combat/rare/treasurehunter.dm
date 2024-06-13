//dagger and huntknife
/datum/advclass/combat/gravedigger
	name = "Treasure Hunter"
	tutorial = "Grave robbers sell themselves as treasure hunters, but be sure to wipe that \
	necrotic flesh off of that trinket you found."
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
	outfit = /datum/outfit/job/roguetown/adventurer/gravedigger

/datum/outfit/job/roguetown/adventurer/gravedigger/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/tights/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/rope
	backpack_contents = list(/obj/item/bait = 1)
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltr = /obj/item/storage/belt/rogue/pouch
	backr = /obj/item/rogueweapon/shovel
	head = /obj/item/clothing/head/roguetown/puritan
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", -2)
		ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
