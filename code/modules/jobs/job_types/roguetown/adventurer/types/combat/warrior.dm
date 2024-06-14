//shield sword
/datum/advclass/combat/sfighter
	name = "Warrior"
	tutorial = "Warriors are the heart of any party, hidden behind a large shield with the courage to take on any foe."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Tiefling"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(3,4), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(3,4), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(3,4), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_BLACK
		H.update_body()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	if(prob(25))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail
		pants = /obj/item/clothing/under/roguetown/tights/black
	else if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
		pants = /obj/item/clothing/under/roguetown/tights/black
	else
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/wood
	if(prob(33))
		beltl = /obj/item/rogueweapon/sword/iron
	else if(prob(50))
		beltl = /obj/item/rogueweapon/sword/iron/messer
	else
		beltl = /obj/item/rogueweapon/sword/short
	if(prob(66))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
	else
		head = /obj/item/clothing/head/roguetown/helmet/skullcap
		neck = /obj/item/clothing/neck/roguetown/gorget

	H.change_stat("strength", 2)
	H.change_stat("endurance", 1) // 7 stat points total as a low-skill martial role without magic. Compared to Pally with 5 points.
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
