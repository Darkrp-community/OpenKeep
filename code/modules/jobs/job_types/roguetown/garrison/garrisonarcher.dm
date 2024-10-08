/datum/job/roguetown/watchman
	title = "Garrison Archer"
	flag = WATCHMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Kitsune", //Lore Situationism: The three abyssariad races have been brought over to the Garrison for prestige values and to cement the King's power by holding culturally loyal-bound raiders as part of the army.
		"Tengu",
		"Oni",
		"Kappa" // So they are not kept out. People hate the lack of options afterall, but they will not be present on royal ones. 
	)
	tutorial = "You are an Archer in the Kings garrison and are used as a scout, or to man the walls and shoot at invaders."
	display_order = JDO_GARRISONARCHER
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/watchman
	give_bank_account = 30
	min_pq = -4

	cmode_music = 'sound/music/combat_guard.ogg'

/datum/outfit/job/roguetown/watchman
	name = "Garrison Archer"
	jobtype = /datum/job/roguetown/watchman

/datum/outfit/job/roguetown/watchman/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	cloak = /obj/item/clothing/cloak/stabard/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/keyring/guard
	beltr = /obj/item/quiver/arrows
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1)
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/helmet/kettle
	else
		head = /obj/item/clothing/head/roguetown/roguehood/red

	if(H.dna?.species)
		if(H.dna.species?.id == "abyssariad")
			to_chat(H, "<span class='warning'>I am a Ashigaru working under the banner of the king, and I must treat him as I would my daimyo, and the captain my leading shogun.")
			pants = /obj/item/clothing/under/roguetown/tobi/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/random
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/jikatabi
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/tanto = 1)
			if(prob(30))
				head = /obj/item/clothing/head/roguetown/helmet/kettle/jingasa
			else
				head = /obj/item/clothing/head/roguetown/roguehood/red
	if(H.mind)
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
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1,1), TRUE) // For rapier use
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, pick(1,1,2), TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 2)
		H.change_stat("endurance", 1)
		H.change_stat("speed", 2)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
