/datum/job/roguetown/guardsman
	title = "Garrison Guard"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 8
	spawn_positions = 8

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

	outfit = /datum/outfit/job/roguetown/guardsman		//Default outfit.
	advclass_cat_rolls = list(CTAG_GARRISON = 20)			//Handles class selection.

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

//Universal stuff for all guards, regardless of their class selection.
/datum/outfit/job/roguetown/guardsman
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	cloak = /obj/item/clothing/cloak/stabard/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/keyring/guard
	belt = /obj/item/storage/belt/rogue/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)

/* ! ! ! Class Selection Section Below ! ! !

Design philosphy:
- Footsman, specializes in axes/maces and shields. - Medium armor
- Pikemen, specializes in polearms with some bonus stats. - Medium armor
- Archer, specializes in bow/crossbow and daggers. - Dodge expert, no medium armor, some crafting stats (low)
- Arcane Enforcer, specializes in mild magic usage at the cost of most other combat stats. - No armor training at all, LIMITED to 2 max slots. (We'll see how it goes.)
*/

/datum/advclass/garrison/footsman
	name = "Garrison Footsman"
	tutorial = "You are a footsman of Rockhill's garrison levy. Well versed in various close-quarters weapons, such as axes and maces, and in aprehending street-savy criminals."
	outfit = /datum/outfit/job/roguetown/guardsman/footsman

	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/roguetown/guardsman/footsman/pre_equip(mob/living/carbon/human/H)
	..()
	//Armor for class
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/gorget
	head = /obj/item/clothing/head/roguetown/helmet
	beltr = /obj/item/rogueweapon/mace/cudgel
	backr = /obj/item/rogueweapon/shield/wood

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell


/datum/advclass/garrison/pikeman
	name = "Garrison Pikeman"
	tutorial = "You are a pikeman of Rockhill's garrison levy. While you may not be as fast as others, you know how to use far larger weapons! Spears, pikes, billhooks - all in your expertise."
	outfit = /datum/outfit/job/roguetown/guardsman/pikesman

	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/roguetown/guardsman/pikesman/pre_equip(mob/living/carbon/human/H)
	..()
	//Armor for class
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/gorget
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	if(prob(50))
		backr = /obj/item/rogueweapon/spear/billhook
	else
		backr = /obj/item/rogueweapon/spear
	
	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("perception", 1)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell


/datum/advclass/garrison/archer
	name = "Garrison Archer"
	tutorial = "You are an archer of Rockhill's garrison levy. What you lack in strength you make up for in speed, capable of man-hunting from rooftops with just your bow and dagger."
	outfit = /datum/outfit/job/roguetown/guardsman/archer

	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/roguetown/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	//Armor for class
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	beltr = /obj/item/quiver/arrows
	head = /obj/item/clothing/head/roguetown/roguehood/red
	neck = /obj/item/clothing/neck/roguetown/chaincoif

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE) // For rapier use
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell


/datum/advclass/garrison/enforcer
	name = "Garrison Arcane Enforcer"
	tutorial = "You are an arcane enforcer of Rockhill's garrison levy. A rarity among men, a magic user! Though your skills are little more than that of an apprentace, you've found a making in man-catching!"
	outfit = /datum/outfit/job/roguetown/guardsman/enforcer

	category_tags = list(CTAG_GARRISON)
	maximum_possible_slots = 2	// More than 2 and this would be silly as all hell.

/datum/outfit/job/roguetown/guardsman/enforcer/pre_equip(mob/living/carbon/human/H)
	..()
	//Armor for class
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot		//Fortnite chugjug
	backr = /obj/item/rogueweapon/woodstaff								//Stinky-uggy wizard staff. Go do kung-fu.
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	neck = /obj/item/clothing/neck/roguetown/coif						//Screw you, magic-man. You get a worse coif!

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.change_stat("strength", -2)	//Basically similar stats to that of sorceress/wandering mage, but tiny tad bit better. (No speed penalty due to less spells.)
	H.change_stat("intelligence", 3)
	H.change_stat("endurance", -1)
	H.change_stat("constitution", -1)
	H.verbs |= /mob/proc/haltyell

	//Spells - Keep these as LOW-TIER spells. Don't go making these guys able to replace court mage!
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/projectile/magic_missile)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)		//Literal base-game security (lmao); not sure on this one.

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")

