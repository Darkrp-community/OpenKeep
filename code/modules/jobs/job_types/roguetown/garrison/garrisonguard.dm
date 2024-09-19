/datum/job/roguetown/guardsman
	title = "Garrison Guard"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "You are a soldier on guard duty in the kings Garrison, you have been trained in defensive tactics to deal with the horrors of the island and protect the town to the best of your ability."
	display_order = JDO_GARRISONGUARD
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/guardsman
	give_bank_account = 30
	min_pq = -4

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/guardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "guard's tabard ([index])"

/datum/outfit/job/roguetown/guardsman/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/gorget
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	var/armortype = pickweight(list("Ironmail" = 3, "Steelmail" = 3, "Gambison" = 1, "Leather" = 2)) // At best they can get an iron breastplate over mail
	var/weapontype = pickweight(list("Axe" = 1, "Mace" = 2, "Messer" = 1, "Spear" = 2, "Flail" = 2)) // Rolls for various weapons, all of these are iron tier
	switch(armortype)
		if("Ironmail")
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
		if("Ironplate")
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
		if("Ironplate&Mail") // Big roller gets iron chainlegs and an iron breastplate over chainmail. Lucky them
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
			pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	switch(weapontype) // We get +1 weapon skill in either axes/maces, spears, or flails depending on our starting weapon
		if("Axe")
			beltl = /obj/item/rogueweapon/woodcut
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Mace")
			beltl = /obj/item/rogueweapon/mace
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Messer")
			beltl = /obj/item/rogueweapon/sword/iron/messer
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Spear")
			beltl = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail") // Big roller gets one of the best weapons to pair with a shield, even if it is only iron tier. Lucky bastard
			beltl = /obj/item/rogueweapon/flail
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	if(H.mind)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")

