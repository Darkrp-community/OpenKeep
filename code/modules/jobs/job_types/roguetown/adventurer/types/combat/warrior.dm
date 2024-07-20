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
	category_tags = list(CTAG_ADVENTURER)


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, pick(1,2,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(1,1,2), TRUE)

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_BLACK
		H.update_body()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/black
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/wood
	var/armortype = pickweight(list("Chainmail" = 6, "Plate" = 3, "Steel" = 1))
	var/weapontype = pickweight(list("Messer" = 3, "Sword" = 5, "Shortsword" = 2))
	switch(armortype)
		if("Chainmail")
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		if("Plate")
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
		if("Steel") // Big roller gets chainlegs as well
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	switch(weapontype)
		if("Messer")
			beltl = /obj/item/rogueweapon/sword/iron/messer
		if("Sword")
			beltl = /obj/item/rogueweapon/sword/iron
		if("Shortsword") // Big roller gets steel sword.
			beltl = /obj/item/rogueweapon/sword/short
	if(prob(66))
		neck = /obj/item/clothing/neck/roguetown/gorget
		head = /obj/item/clothing/head/roguetown/helmet/skullcap
	else // High roller gets steel chain coif
		neck = /obj/item/clothing/neck/roguetown/chaincoif

	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", -1) // Muscle brains
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
