/datum/advclass/combat/heartfeltlord
	name = "Lord of Heartfelt"
	tutorial = "You are the proud lord of Heartfelt, \
	but why have you come to Rockhill?"
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/heartfeltlord
	min_pq = 2
	maximum_possible_slots = 1
	pickprob = 50
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/heartfeltlord/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt
	belt = /obj/item/storage/belt/rogue/leather/black
	neck = /obj/item/clothing/neck/roguetown/gorget
	head = /obj/item/clothing/head/roguetown/heartfelt
	shoes = /obj/item/clothing/shoes/roguetown/ridingboots/gutal
	pants = /obj/item/clothing/under/roguetown/trou/tobi/dark
	cloak = /obj/item/clothing/cloak/newheartfelt
	armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/scomstone
	gloves = /obj/item/clothing/gloves/roguetown/leather/abyssal/black
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	beltl = /obj/item/rogueweapon/sword/long/tachi
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
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	if(!HAS_TRAIT(H, TRAIT_KAIZOKU))
		ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
		to_chat(H, "<span class='info'I am an Islander, and I respectively have the culture of one.</span>")
