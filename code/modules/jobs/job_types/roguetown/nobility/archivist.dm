/datum/job/roguetown/archivist
	title = "Archivist"
	tutorial = "The Archivist meticulously preserves and organizes ancient scrolls and tomes, safeguarding the collective knowledge of the realm for generations to come. Nobles and Peasants alike often seek the Archivists expertise on matters of history and fact."
	flag = ARCHIVIST
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	spells = list(/obj/effect/proc_holder/spell/invoked/projectile/fetch)
	allowed_patrons = list(/datum/patron/divine/noc)

	outfit = /datum/outfit/job/roguetown/archivist
	display_order = 19
	give_bank_account = 100

/datum/outfit/job/roguetown/archivist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/black
		pants = /obj/item/clothing/under/roguetown/tights/black
		head  = /obj/item/clothing/head/roguetown/roguehood/black
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/niteman
		pants = /obj/item/clothing/under/roguetown/tights/black
		head = /obj/item/clothing/head/roguetown/niteman
	H.virginity = TRUE
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/keyring/archivist
	backl = /obj/item/storage/backpack/rogue/satchel
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	backpack_contents = list(/obj/item/literary/apprentice = 1)

	if(H.mind)
		H.grant_language(/datum/language/elvish)
		H.grant_language(/datum/language/dwarvish)
		H.grant_language(/datum/language/zybantine)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", -2)
		H.change_stat("intelligence", 8)
		H.change_stat("constitution", -2)
		H.change_stat("speed", -2)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ARCANE_KNOWLEDGE, TRAIT_GENERIC)
