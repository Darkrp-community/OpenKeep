/datum/advclass/mercenary/swashbuckler
	name = "Corsair"
	tutorial = "Banished from polite society, you once found kin with privateers, working adjacent to Heartfelt's Royal Navy. After the Red Flag battered itself in the wind one last time, your purse was still not satisfied... And yet he complained that his belly was not full."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Tiefling"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/swashbuckler
	maximum_possible_slots = 5
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/adventurer/swashbuckler
	head = /obj/item/clothing/head/roguetown/helmet/leather/headscarf
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/natural/worms/leech = 2, /obj/item/storage/belt/rogue/pouch/coins/mid)
	backr = /obj/item/fishingrod/fisher
	beltl = /obj/item/rogueweapon/sword/sabre/cutlass
	beltr = /obj/item/rogueweapon/knife/dagger
	shoes = /obj/item/clothing/shoes/roguetown/boots
	neck = /obj/item/clothing/neck/roguetown/psycross/silver/abyssor

/datum/outfit/job/roguetown/adventurer/swashbuckler/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)

		H.mind?.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)

	shirt = pick(/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor, /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("strength", 1)
	H.change_stat("perception", 1)
	H.change_stat("constitution", 1)
	H.change_stat("endurance", 3)
	H.change_stat("speed", 2)

		H.merctype = 8
