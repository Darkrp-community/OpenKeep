/datum/advclass/combat/amazon
	name = "Amazon"
	tutorial = "Amazons are savage and deft warrior-women from the mysterious isle of Issa. They hunt for prey amid the treetops and pick fights for sport, just to prove their worth."
	allowed_sexes = list(FEMALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/amazon
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/amazon/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	var/armortype = pickweight(list("Chainkini" = 5, "Leather" = 2, "Hide" = 1))
	var/weapontype = pickweight(list("Sword" = 7, "Spear" = 3))
	switch(armortype)
		if("Chainkini")
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/chainkini
		if("Leather")
			armor = /obj/item/clothing/suit/roguetown/armor/leather
		if("Hide")
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	switch(weapontype)
		if("Sword")
			beltr = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Spear")
			r_hand = /obj/item/rogueweapon/spear
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	if(prob(45))
		backr = /obj/item/storage/backpack/rogue/satchel
	if(prob(50))
		shoes = /obj/item/clothing/shoes/roguetown/boots
	H.change_stat("strength", 2)
	H.change_stat("intelligence", -1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)

