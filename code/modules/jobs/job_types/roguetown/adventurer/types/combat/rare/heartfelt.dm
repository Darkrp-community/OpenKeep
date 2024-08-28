/datum/advclass/combat/heartfeltlord
	name = "Lord of Heartfelt"
	tutorial = "The proud lord of Heartfelt - your kingdom conquered of late by Grezenholft. \
	Rebellious masses grows on your previous fief, and your alies are no longer in hiding. \
	However, there was a reason on why you came to the Isle of Enigma..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/heartfeltlord
	min_pq = 2
	maximum_possible_slots = 1
	pickprob = 50
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/heartfeltlord/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather/black
	mask = /obj/item/clothing/mask/rogue/kaizoku/menpo/steel
	head = /obj/item/clothing/head/roguetown/helmet/visored/knight/zunari/heartfelt
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/heartfelt
	armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/lord/kaizoku
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	beltl = /obj/item/rogueweapon/sword/long/rider/tachi
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 1)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)  //Cultural Trait. Must not be considered a 'buff' or 'debuff'.