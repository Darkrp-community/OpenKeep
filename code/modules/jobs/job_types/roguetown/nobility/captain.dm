/datum/job/roguetown/captain
	title = "Captain"
	flag = CAPTAIN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Changeling", //Lore Situationism: The three abyssariad races have been brought over to the Garrison for prestige values and to cement the King's power by holding culturally loyal-bound raiders as part of the army.
		"Skylancer",
		"Ogrun"
	)

	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_CAPTAIN
	tutorial = "Law and Order, your divine reason for existence. You have been given command over the garrison to help keep order and peace within the city and defend it against the many dangers of the island."
	whitelist_req = TRUE
	bypass_lastclass = FALSE
	outfit = /datum/outfit/job/roguetown/captain
	give_bank_account = 120
	min_pq = 0
	selection_color = "#af594f"
	cmode_music = 'sound/music/combat_guard.ogg'

/datum/job/roguetown/captain/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		if(H.dna.species?.id != "abyssariad")
			var/honorary = "Sir"
			if(H.gender == FEMALE)
				honorary = "Dame"
			H.real_name = "[honorary] [prev_real_name]"
			H.name = "[honorary] [prev_name]"
		else
			var/honorary = "Jiangjun" //Just like china, abyssariads have a standardized military practices from a unified political system for the Imperial Court.
				// Jianjun IS a term for 'General' nowadays, but it was widely used during Han, Tang, Song, Yuan and Ming dynasties for high-ranking military officers.
			H.real_name = "[honorary] [prev_real_name]"
			H.name = "[honorary] [prev_name]"

/datum/outfit/job/roguetown/captain/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.dna?.species && H.dna.species?.id != "abyssariad") // Default non-Islander equipment
		head = /obj/item/clothing/head/roguetown/helmet/visored/knight
		gloves = /obj/item/clothing/gloves/roguetown/plate
		pants = /obj/item/clothing/under/roguetown/platelegs
		armor = /obj/item/clothing/suit/roguetown/armor/brigandine/captain
		neck = /obj/item/clothing/neck/roguetown/gorget
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
		shoes = /obj/item/clothing/shoes/roguetown/boots
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/rogueweapon/shield/tower/metal
		belt = /obj/item/storage/belt/rogue/leather/plaquesilver
		beltl = /obj/item/rogueweapon/sword/sabre
		beltr = /obj/item/rogueweapon/mace/cudgel
		cloak = /obj/item/clothing/cloak/cape/guard

	else if(H.dna?.species && H.dna.species?.id == "abyssariad") // Alternative, Islander equipment
		to_chat(H, "<span class='userdanger'>As a Abyssal Guardian, I follow the desires of Abyssor's son to now be bound to the Rockhill throne - I serve the ruler's clan with utmost devotion, let death find me before dishonoring my pact.")
		head = /obj/item/clothing/head/roguetown/helmet/visored/zunari
		gloves = /obj/item/clothing/gloves/roguetown/plate/lamellaetekko
		armor = /obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai
		pants = /obj/item/clothing/under/roguetown/platelegs/weepershanwenkai
		neck = /obj/item/clothing/neck/roguetown/gorget
		shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt
		shoes = /obj/item/clothing/shoes/roguetown/ridingboots/gutal
		beltl = /obj/item/rogueweapon/sword/sabre/piandao
		beltr = /obj/item/rogueweapon/mace/cudgel/jitte
		backl = /obj/item/rogueweapon/shield/tower/metal/abyssal
		backr = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather/plaquesilver
		cloak = /obj/item/clothing/cloak/raincloak/guardiancloak/guard
		H.champion = TRUE

		if(findtext(H.real_name, " Clanless"))
			to_chat(H, "<span class='warning'>The King acquired my clan - so I have to belong to one before reaching this royal duty I serve.</span>")
			clanfication(H)

	backpack_contents = list(/obj/item/keyring/captain = 1, /obj/item/signal_horn = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
