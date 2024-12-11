/datum/job/roguetown/sheriff
	title = "Sheriff"
	flag = CAPTAIN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_races = list(
		"Humen",
		"Dwarf"
	)
	allowed_sexes = list(MALE)
	display_order = JDO_CAPTAIN
	allowed_ages = list(AGE_OLD, AGE_MIDDLEAGED)
	tutorial = "Enforcer of the Law appointed by the ruler from one of the old respected families, no troublemaker or misfit will escape your watchful eye in this town. You command the town watch and the gates."
	whitelist_req = FALSE
	bypass_lastclass = TRUE
	outfit = /datum/outfit/job/roguetown/sheriff
	give_bank_account = 100
	min_pq = 4

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/outfit/job/roguetown/sheriff/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/bascinet
	gloves = /obj/item/clothing/gloves/roguetown/chain
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/sheriff
	beltr = /obj/item/rogueweapon/mace/steel/morningstar
	beltl = /obj/item/flashlight/flare/torch/lantern
	cloak = /obj/item/clothing/cloak/cape/guard
	backpack_contents = list(/obj/item/natural/cloth = 1, /obj/item/signal_horn = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

	if(H.dna.species.id == "dwarf")
		H.cmode_music = 'sound/music/combat_dwarf.ogg'


/datum/job/roguetown/watchman
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Dwarf",
		"Aasimar"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "You are a member of the town watch, responsible for keeping the peace and fighting fires. The Sheriff is your commander."
	display_order = JDO_GARRISONGUARD
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/watchman
	give_bank_account = 30
	min_pq = 0

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/watchman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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

/datum/outfit/job/roguetown/watchman/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/stabard/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/townwatch
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel

	head = /obj/item/clothing/head/roguetown/helmet/kettle
	neck = 	/obj/item/clothing/neck/roguetown/coif/cloth
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson

	beltr = /obj/item/rogueweapon/mace/cudgel
	beltl = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(/obj/item/natural/cloth = 1)

	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/*
/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")
*/
