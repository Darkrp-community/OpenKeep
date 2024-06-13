/datum/advclass/combat/heartfelthand
	name = "Hand of Heartfelt"
	tutorial = "You serve your lord as the royal hand, taking care of all diplomatic actions in your relm. \
	maybe one day you will become lord too."
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/heartfelthand
	maxchosen = 1
	plevel_req = 2
	israre = TRUE

/datum/outfit/job/roguetown/adventurer/heartfelthand/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/hand
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	beltl = /obj/item/rogueweapon/sword/decorated
	beltr = /obj/item/scomstone
	backr = /obj/item/storage/backpack/rogue/satchel/heartfelt
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
