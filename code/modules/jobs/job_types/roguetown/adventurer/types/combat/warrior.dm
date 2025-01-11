// Onehanded weapon and shield, medium-low armor, one skill 50/50 of being 4 but loads of variety in skills so can pick up most weapons

/datum/advclass/combat/sfighter
	name = "Warrior"
	tutorial = "Wandering sellswords, foolhardy gloryhounds, deserters... many and varied folk turn to the path of the warrior. Very few meet anything greater than the bottom of a tankard or the wrong end of a noose."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Tiefling",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/sfighter
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0


/datum/outfit/job/roguetown/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()

	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/rogueweapon/shield/wood
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/trou/leather
	if(prob(50))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	var/armortype = pickweight(list("Ironmail" = 3, "Ironplate" = 1, "Leather&Legs" = 2)) // At best they can get an iron breastplate over mail and iron chainleggings
	var/weapontype = pickweight(list("Axe" = 2, "Messer" = 2, "Sword" = 3, "Flail" = 1)) // Rolls for various weapons, all of these are iron tier
	var/helmettype = pickweight(list("Leather" = 1, "Pot" = 2, "Plate" = 1))
	var/necktype = pickweight(list("None" = 2,"Padded" = 1, "Leather" = 2, "Coif" = 1))
	switch(weapontype) // We get +1 weapon skill in either axes/maces, swords, or flails depending on our starting weapon
		if("Axe")
			beltl = /obj/item/rogueweapon/axe/iron
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Messer")
			beltl = /obj/item/rogueweapon/sword/scimitar/messer
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Sword")
			beltl = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail") // Big roller gets one of the best weapons to pair with a shield, even if it is only iron tier. Lucky bastard
			beltl = /obj/item/rogueweapon/flail
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	switch(helmettype)
		if("Leather")
			head = /obj/item/clothing/head/roguetown/helmet/leather/conical
		if("Pot")
			head = /obj/item/clothing/head/roguetown/helmet/ironpot
		if("Plate")
			head = /obj/item/clothing/head/roguetown/helmet/heavy/ironplate
	switch(necktype)
		if("None")
		if("Padded")
			neck = /obj/item/clothing/neck/roguetown/coif/cloth
		if("Leather")
			neck = /obj/item/clothing/neck/roguetown/coif
		if("Coif")
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	switch(armortype)
		if("Ironmail")
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
		if("Ironplate")
			if(prob(30))
				neck = /obj/item/clothing/neck/roguetown/gorget
			armor = /obj/item/clothing/suit/roguetown/armor/cuirass/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
		if("Leather&Legs")
			armor = /obj/item/clothing/suit/roguetown/armor/leather
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_SOOT_BLACK
		H.update_body()
	if(H.dna.species.id == "dwarf")
		head = /obj/item/clothing/head/roguetown/helmet/winged
		H.cmode_music = 'sound/music/combat_dwarf.ogg'
		if(prob(10))
			mask = /obj/item/clothing/mask/rogue/facemask

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, pick(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, pick(0,1), TRUE)

	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // MEDIUM armor training only, this is not a rare drifter, they shouldn't have more armor training than a garrison guard
