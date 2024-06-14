/datum/job/roguetown/churchling
	title = "Churchling"
	flag = APPRENTICE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Half-Elf"
	)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_YOUNG)

	tutorial = "Your family were zealots, they scolded you with a studded belt and prayed like sinners every waking hour of the day they weren’t toiling in the fields. You escaped them by becoming a churchling, and a guaranteed education isnt so bad"

	outfit = /datum/outfit/job/roguetown/churchling
	display_order = JDO_CHURCHLING
	give_bank_account = TRUE
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/churchling/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, rand(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		belt = /obj/item/storage/belt/rogue/leather/rope
		pants = /obj/item/clothing/under/roguetown/tights
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		belt = /obj/item/storage/belt/rogue/leather/rope
		pants = /obj/item/clothing/under/roguetown/tights
		head = /obj/item/clothing/head/roguetown/armingcap
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
		/obj/item/needle = 1,
		/obj/item/rogueweapon/surgery/scalpel = 1,
		/obj/item/rogueweapon/surgery/saw = 1,
		/obj/item/rogueweapon/surgery/hemostat = 2, //2 forceps so you can clamp bleeders AND manipulate organs
		/obj/item/rogueweapon/surgery/retractor = 1,
		/obj/item/rogueweapon/surgery/bonesetter = 1,
		/obj/item/rogueweapon/surgery/cautery = 1,
	)

	H.change_stat("perception", 1)
	H.change_stat("speed", 2)
