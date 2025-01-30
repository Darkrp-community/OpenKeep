/datum/job/roguetown/stevedore
	title = "Stevedore"
	flag = STEVEDORE
	department_flag = TOWNERS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar",
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine"
	)

	tutorial = "The strongest workers are hired by the Mercator guild, trained by monks of Ravox and expected to help out with handling troublemakers as well as moving cargo and messages around. The Merchant is your boss!"

	outfit = /datum/outfit/job/roguetown/stevedore
	give_bank_account = TRUE
	min_pq = -50
	display_order = JDO_STEVEDORE
	bypass_lastclass = TRUE

/datum/job/roguetown/stevedore/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
/datum/outfit/job/roguetown/stevedore/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)//they can use the merchant machine and that's it
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

	head = /obj/item/clothing/head/roguetown/headband/blue
	neck = /obj/item/roguekey/shop
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	pants = /obj/item/clothing/under/roguetown/tights/sailor
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(H.gender == MALE)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		H.change_stat("strength", 3)
		H.change_stat("speed", -1)
	else
		shoes = /obj/item/clothing/shoes/roguetown/gladiator
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
		head = /obj/item/clothing/head/roguetown/headband
		H.change_stat("strength", 2)
		H.change_stat("endurance", 1)
		H.change_stat("perception", 1)

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

	if(HAS_TRAIT(H, TRAIT_KAIZOKU))
		if(H.patron == /datum/patron/divine/abyssor) //Abyssanctum have combative edge as well, but only for those culturally bound to fog islands. The gods are the same, but the religion is not.
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	else
		if(H.patron == /datum/patron/divine/ravox)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
