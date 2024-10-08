/datum/advclass/combat/abyssariad/sohei
	name = "Senso Sohei"
	tutorial = "Senso Soheis are the Abyssanctum war disciples from the Tideweaver branch, the direct continuation of the champions of old age. Their duty is to protect the shrines and spiritual entities from demonic corruption."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Kitsune",
		"Tengu",
		"Oni",
		"Kappa"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/sohei
	category_tags = list(CTAG_ADVENTURER)
	vampcompat = FALSE
	maximum_possible_slots = 2 //Only two, united with Yamabushi. Perhaps in the future they start as unpowered Church role? At least that's the case for Kaizoku maps.  

/datum/outfit/job/roguetown/adventurer/abyssariad/sohei
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/adventurer/abyssariad/sohei/pre_equip(mob/living/carbon/human/H)
	..()

	neck = /obj/item/clothing/head/roguetown/soheicloth
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/sanmaido
	wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/jikatabi
	head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	beltr = /obj/item/rogueweapon/huntingknife/idagger/sai

	var/background = pickweight(list("thunder" = 1, "storm" = 1, "ocean" = 1, "island" = 1)) //This is just flavour. Mostly unwritten portrayal how different Soheis were of each other. Leave it up to the players to interact.
	var/weapontype = pickweight(list("yari" = 6, "tsukushi" = 5, "katakama" = 3, "jumonji" = 1)) // Rolls for various polearms.
	switch(background)
		if("thunder")
			neck = /obj/item/clothing/head/roguetown/soheicloth/thunder
			pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/thunder
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/thunder
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/thunder
		if("storm")
			neck = /obj/item/clothing/head/roguetown/soheicloth/storm
			pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/storm
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/storm
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/storm
		if("ocean")
			neck = /obj/item/clothing/head/roguetown/soheicloth/ocean
			pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/ocean
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/ocean
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/ocean
		if("island")
			neck = /obj/item/clothing/head/roguetown/soheicloth/island
			pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/island
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/island
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/island
	switch(weapontype)
		if("tsukushi")
			backr = /obj/item/rogueweapon/halberd/bardiche/naginata/tsukushi //weaker naginata, mass-produced iron tier. Slightly more rare than Yari.
		if("jumonji")
			backr = /obj/item/rogueweapon/spear/yari/katakama/jumonji //Steel, more combat-effective than Katakama - but rarer.
		if("katakama")
			backr = /obj/item/rogueweapon/spear/yari/katakama //Steel, more combat-effective and rarer than iron Yari.
		if("yari")
			backr = /obj/item/rogueweapon/spear/yari //just a simple spear.

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE) //The true focus of this class.
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) //I don't think they are deserving of bows tbh
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1,1), TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("perception", -2) //imagine training meditation so hard you end up edging your own eyes, but start noticing spirits. (schizophrenia)
		H.change_stat("speed", -1)

	//Soheis have some powers related to the Tideweaver branch - which means, not many. Their focus is elsewhere.
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	//Max devotion limit - Sohei are strong for a common role, but cannot pray to gain more abilities beyond t1
	C.update_devotion(50, 50)
	C.holder_mob = H
	C.grant_spells_templar(H) //IMPORTANT: change this to an Abyssor one when they are made. DO NOT allow this to go PR'd without this part.
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	if(H.patron != /datum/patron/divine/abyssor)
		H.patron = GLOB.patronlist[/datum/patron/divine/abyssor]
		to_chat(H, "<span class='warning'>I am a Abyssanctum, loyal to The World Whale. May the tides of fate guide me to honor.")