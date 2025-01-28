/datum/job/roguetown/head_humen
	title = "Head of House Humen"
	flag = HEAD_HUMEN
	department_flag = THE_HILLIAN_DIET
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen"
	)
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/roguetown/head_humen
	display_order = JDO_HAND
	tutorial = "Once, you were a mere childhood friend of the monarch of Rockhill; now, you are one of the most important people in the kingdom. Your roles are right-hand man, confidant, and spymaster alike, and you have killed more with your whispers than with a blade."
	bypass_lastclass = TRUE
	whitelist_req = FALSE
	give_bank_account = 120
	min_pq = 2
	cmode_music = 'sound/music/combat_noble.ogg'

/datum/outfit/job/roguetown/head_humen/pre_equip(mob/living/carbon/human/H)
	. = ..()
	pants = /obj/item/clothing/under/roguetown/tights/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/hand
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/hand
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/knife/dagger/steel = 1, /obj/item/keyring/hand = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("perception", 2)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 2)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.verbs |= /mob/living/carbon/human/proc/torture_victim
