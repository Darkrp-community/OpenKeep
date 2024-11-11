/datum/job/roguetown/monk
	title = "Acolyte"
	flag = MONK
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "Chores, exercise, prayer... and more chores. You are a humble acolyte at the temple in Rockhill, not yet a trained guardian or an ordained priest. But who else would keep the fires lit and the floors clean?"
	allowed_patrons = ALL_TEMPLE_PATRONS
	outfit = /datum/outfit/job/roguetown/monk

	display_order = JDO_MONK
	give_bank_account = TRUE
	min_pq = -10
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/monk
	name = "Acolyte"
	jobtype = /datum/job/roguetown/monk

/datum/outfit/job/roguetown/monk/pre_equip(mob/living/carbon/human/H)
	..()
	var/datum/patron/A = H.patron
	H.virginity = TRUE
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/roguekey/church
	backpack_contents = list(/obj/item/needle)
	switch(A.name)
		if("Astrata")
			head = /obj/item/clothing/head/roguetown/roguehood/astrata
			neck = /obj/item/clothing/neck/roguetown/psycross/silver/astrata
			wrists = /obj/item/clothing/wrists/roguetown/wrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
			backl = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff
		if("Eora")
			head = /obj/item/clothing/head/roguetown/padded/rabbetvisage
			neck = /obj/item/clothing/neck/roguetown/psycross/silver/eora
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			backl = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff
			H.virginity = FALSE
		if("Noc")
			head = /obj/item/clothing/head/roguetown/roguehood/nochood
			neck = /obj/item/clothing/neck/roguetown/psycross/noc
			wrists = /obj/item/clothing/wrists/roguetown/nocwrappings
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
			backl = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff
		if("Pestra")
			head = /obj/item/clothing/head/roguetown/roguehood/brown
			neck = /obj/item/clothing/neck/roguetown/psycross/silver/pestra
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/green
			shoes = /obj/item/clothing/shoes/roguetown/sandals
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/phys
			backl = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff
		if("Malum")
			head = /obj/item/clothing/head/roguetown/roguehood/brown
			neck = /obj/item/clothing/neck/roguetown/psycross/silver/malum
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/red
			pants = /obj/item/clothing/under/roguetown/tights/black
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/malum
			backl = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff/iron
		else // Failsafe
			head = /obj/item/clothing/head/roguetown/roguehood/random
			neck = /obj/item/clothing/neck/roguetown/psycross/silver
			shoes = /obj/item/clothing/shoes/roguetown/boots
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/plain

	if(H.mind)
		switch(A.name) // sorry, shitcode
			if("Astrata")
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) // They get this and a wooden staff to defend themselves
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			if("Eora")
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE) // creative pursuits!
				H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) // to me eorans have always given the vibe of 'wrestle someone into submission' rather than beat them with sticks.
				H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE) // i like to think they have lakeside parties.
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			if("Noc")
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/medicine, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE) // wimpy nerd arms
				H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE) // in exchange for their lack of physical skills, they can learn arcane magic
				H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
				H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			if("Pestra")
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE) // capable of doing actual surgery, supplemented by their miracles
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE) // to compensate for them being pretty skilled at sewing and medicine, they're now too habitually drunk to wrestle
				H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
			if("Malum")
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE) // in lieu of more conventional acolyte stuff, gets to be a gear support role
				H.mind.adjust_skillrank(/datum/skill/craft/smelting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE) // a free window-repairer for the church
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 2) // For casting lots of spells, and working long hours without sleep at the church
		H.change_stat("perception", -1)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)
