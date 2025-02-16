/datum/job/roguetown/dungeoneer
	title = "Dungeoneer"
	flag = DUNGEONEER
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",		// Elsewhere lore suggests ancient elves were cannibals, so why not. N.
		"Half-Elf",	// Half-elves are often the unwanted dregs of society. N.
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Changeling", //Abyssariad dungeoneers, on the standards of Rockhill, are burakumins. Their non-impure version is the Kaishakunin.
		"Skylancer",
		"Ogrun"
	)
	allowed_sexes = list(MALE, FEMALE)

	display_order = JDO_DUNGEONEER

	tutorial = "Be you an instrument of sadism for the King or the guarantor of his merciful hospitality, your duties are a service paid for most handsomely. Perhaps you were promoted from the garrison down to these cells to get your brutality off the town streets where cracked skulls caused outcries, or maybe your soft-hearted lord wanted to be sure his justice was done without malice. In either case, your little world is the lowest office in the Realm; from it your guests see only hell." // changed to reduce dictation of character. Nikov.

	outfit = /datum/outfit/job/roguetown/dungeoneer
	give_bank_account = 50	// Bought loyalty was previously the same as any guardsman, now in line with village elder, etc. N.
	min_pq = 0

	cmode_music = 'sound/music/combat_weird.ogg'

/datum/outfit/job/roguetown/dungeoneer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/menacing
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	// Small storage. N.
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	cloak = /obj/item/clothing/cloak/stabard/dungeon
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/whip/antique
	beltl = /obj/item/keyring/dungeoneer
	backr = /obj/item/storage/backpack/rogue/satchel	// lack of satchel requires dealing with the merchant to correct, which requires entering town; not ideal. N.

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) // Allow reading notes passed to the literate noble prisoner, or writing reports. N. See peasants\prisoner.dm.
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("intelligence", -2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 1)
		H.change_stat("speed", -1)
		H.change_stat("perception", -1)
	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
	H.verbs |= /mob/living/carbon/human/proc/torture_victim

	if(H.dna.species?.id == "abyssariad")
		mask = /obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor
		H.burakumin = TRUE
		to_chat(H, "<span class='userdanger'>My honor is forfeit; I have become a tool of cruelty and torture. The swift and merciful death that must be yearned to my victims are no option for me here. Perhaps one dae my sins will no longer linger.</span>")
		if(H.wear_mask)
			if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch || /obj/item/clothing/mask/rogue/eyepatch/left ))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor
