/datum/job/roguetown/consort
	title = "Consort"
	flag = CONSORT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf"
	)
	tutorial = "Yours was a marriage of political convenience rather than love, yet you have remained the ruling monarch's good friend and confidant throughout your marriage. But your love and loyalty will be tested, for daggers are equally pointed at your throat."

	outfit = /datum/outfit/job/roguetown/consort

	display_order = JDO_CONSORT
	bypass_lastclass = TRUE
	min_pq = 4
	give_bank_account = 500

	cmode_music = 'sound/music/combat_noble.ogg'

/datum/job/roguetown/consort/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	if(L.gender == FEMALE)
		SSfamilytree.AddRoyal(L, FAMILY_MOTHER)
	else
		SSfamilytree.AddRoyal(L, FAMILY_FATHER)

/datum/outfit/job/roguetown/consort/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/crown/nyle
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/silver
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/keyring/consort
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, pick(1,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/arming
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		armor = pick(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress, /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt)

	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
