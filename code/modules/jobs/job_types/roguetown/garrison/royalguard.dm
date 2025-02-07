/datum/job/roguetown/royalguard
	title = "Royal Guard"
	flag = ROYAL_GUARD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar",
		"Changeling", //Lore Situationism: The three abyssariad races have been brought over to the Garrison for prestige values and to cement the King's power by holding culturally loyal-bound raiders as part of the army.
		"Skylancer",
		"Ogrun"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "You're the rulers hand-picked guard, awarded with knighthood for your prowess and loyalty. Your only oath is a personal one to your ruler, no one else may command you! Serve them until your dying breath."
	display_order = JDO_ROYALGUARD
	whitelist_req = TRUE
	bypass_lastclass = FALSE

	outfit = /datum/outfit/job/roguetown/royalguard
	give_bank_account = 30
	min_pq = 0
	selection_color = "#920909"

	cmode_music = 'sound/music/combat_old.ogg'

/datum/job/roguetown/royalguard/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/tabard/knight/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "knight's tabard ([index])"
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "zamurai's odoshi ([index])"
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		if(H.dna.species?.id != "abyssariad")
			var/honorary = "Sir"
			if(H.gender == FEMALE)
				honorary = "Dame"
			H.real_name = "[honorary] [prev_real_name]"
			H.name = "[honorary] [prev_name]"
		else
			var/original_first_name
			var/original_clan
			var/honorary = "-dono" //The organization for that one is different of the Rockhillian counterpart.

			var/index = findtext(prev_real_name, " of ") // If no "of" is found, apply honorific to the full name instead. Someone made a snowflake.
			if(index)
				original_first_name = copytext(prev_real_name, 1, index)
				original_clan = copytext(prev_real_name, index)
				H.real_name = "[original_first_name][honorary][original_clan]"
			else // If no "of" is found, apply honorific to the full name instead.
				H.real_name = "[prev_real_name][honorary]"

			H.name = H.real_name // Sync `name` with the modified `real_name`

/datum/outfit/job/roguetown/royalguard/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.dna?.species && H.dna.species?.id == "abyssariad")
		to_chat(H, span_warning( "<span class='userdanger'>I am a noble storm-hardened Zamurai. I hold the blood oath of my ancestors, bound to the throne - I serve the ruler's clan with utmost devotion, let death find me before dishonoring my pact.</span>"))
		pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
		neck = null //Abyssariads rarely uses gorgets. For that they use menpos.
		mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
		cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai
		shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt
		armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
		belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
		beltr = /obj/item/rogueweapon/sword/uchigatana
		backr = /obj/item/storage/backpack/rogue/satchel
		r_hand = /obj/item/rogueweapon/polearm/halberd/bardiche/naginata
		backl = /obj/item/rogueweapon/shield/tower/metal/abyssal
		if(prob(30))
			head = /obj/item/clothing/head/roguetown/helmet/visored/zunari
		else
			head = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
		if(findtext(H.real_name, " Clanless"))
			to_chat(H, "<span class='warning'>The King acquired my clan - so I have to belong to one before reaching this royal duty I serve.</span>")
			clanfication(H)
		H.cmode_music = list('sound/music/kaizoku/combat/combat_changeling.ogg','sound/music/kaizoku/combat/combat_stormwarrior.ogg','sound/music/kaizoku/combat/combat_searaider.ogg','sound/music/kaizoku/combat/combat_oldtides.ogg','sound/music/kaizoku/combat/combat_decapitator.ogg','sound/music/kaizoku/combat/combat_emperor.ogg','sound/music/kaizoku/combat/combat_traditional.ogg','sound/music/kaizoku/combat/combat_navalretainers.ogg','sound/music/kaizoku/combat/combat_kyudo.ogg')

	if(H.dna?.species && H.dna.species?.id != "abyssariad")
		pants = /obj/item/clothing/under/roguetown/chainlegs
		cloak = /obj/item/clothing/cloak/tabard/knight/guard
		neck = /obj/item/clothing/neck/roguetown/gorget
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
		armor = /obj/item/clothing/suit/roguetown/armor/brigandine // Wear the King's colors.
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light
		beltl = /obj/item/keyring/mguard
		belt = /obj/item/storage/belt/rogue/leather
		beltr = /obj/item/rogueweapon/sword
		backr = /obj/item/storage/backpack/rogue/satchel
		backl = /obj/item/rogueweapon/shield/tower/metal
		r_hand = /obj/item/rogueweapon/polearm/halberd
		if(prob(30))
			head = /obj/item/clothing/head/roguetown/helmet/visored/knight
		else
			head = /obj/item/clothing/head/roguetown/helmet/sallet
	if(H.dna.species.name == "Ogrun")
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		r_hand = /obj/item/rogueweapon/mace/goden/steel/tetsubo
	else
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.cmode_music = list('sound/music/kaizoku/combat/combat_changeling.ogg','sound/music/kaizoku/combat/combat_stormwarrior.ogg','sound/music/kaizoku/combat/combat_searaider.ogg','sound/music/kaizoku/combat/combat_oldtides.ogg','sound/music/kaizoku/combat/combat_decapitator.ogg','sound/music/kaizoku/combat/combat_emperor.ogg','sound/music/kaizoku/combat/combat_traditional.ogg','sound/music/kaizoku/combat/combat_navalretainers.ogg','sound/music/kaizoku/combat/combat_kyudo.ogg')

	H.change_stat("strength", 2)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)

	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
