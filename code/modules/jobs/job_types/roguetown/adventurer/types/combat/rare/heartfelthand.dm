/datum/advclass/combat/heartfelthand
	name = "Hand of Heartfelt"
	tutorial = "You serve your lord as hand, taking care of diplomatic actions within your realm, \
	but why have you come to Rockhill?"
	allowed_sexes = list(FEMALE, MALE)
	allowed_races = list(
		"Humen",
		"Changeling", //With the alliance, members of the Zamurai/Court class from Fog Island becomes hands if other members of the family marry with heartfelt nobles or vice-versa.
		"Skylancer",
		"Ogrun",
		"Undine"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/heartfelthand
	maximum_possible_slots = 1
	min_pq = 1
	pickprob = 50
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/heartfelthand/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/ridingboots/gutal
	pants = /obj/item/clothing/under/roguetown/trou/tobi/dark
	neck = /obj/item/clothing/neck/roguetown/gorget
	if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/hand
		head = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku
	else
		armor = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/hand/female
		head = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku/female
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	gloves = /obj/item/clothing/gloves/roguetown/leather/black
	beltl = /obj/item/rogueweapon/sword/sabre/piandao/dec
	beltr = /obj/item/scomstone
	backr = /obj/item/storage/backpack/rogue/satchel/heartfelt
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	if(!HAS_TRAIT(H, TRAIT_KAIZOKU))
		ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)
		to_chat(H, "<span class='info'I am an Islander, and I respectively have the culture of one.</span>")
