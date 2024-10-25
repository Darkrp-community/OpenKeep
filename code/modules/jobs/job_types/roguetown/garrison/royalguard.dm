/datum/job/roguetown/royalguard
	title = "Royal Guard"
	flag = GUARDSMAN
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
		"Aasimar",
		"Kitsune", //Lore Situationism: The three abyssariad races have been brought over to the Garrison for prestige values and to cement the King's power by holding culturally loyal-bound raiders as part of the army.
		"Tengu",
		"Oni"
	)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	tutorial = "You're an elite member of the Garrison, awarded with knighthood for your prowess and loyalty. Be a stalwart guardian for the royal family, and serve them until your dying breath."
	display_order = JDO_ROYALGUARD
	whitelist_req = FALSE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/royalguard
	give_bank_account = 30
	min_pq = -4
	selection_color = "#920909"

	cmode_music = 'sound/music/combat_guard.ogg'

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
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Ser"
		if(H.gender == FEMALE)
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"


/datum/outfit/job/roguetown/royalguard/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/haramaki/odoshi/zamurai
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine // Wear the King's colors.
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light
	beltl = /obj/item/keyring/guardcastle
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/sword
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/shield/tower/metal
	r_hand = /obj/item/rogueweapon/halberd
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/helmet/visored/knight
	else
		head = /obj/item/clothing/head/roguetown/helmet/sallet
	if(H.dna?.species)
		if(H.dna.species?.id == "abyssariad")
			to_chat(H, "<span class='warning'>I am a Zamurai fighting under the banner of Rockhill's king, and I must treat him as I would my daimyo with the uppermost honor.")
			pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
			neck = null //Abyssariads rarely uses gorgets. For that they use menpos.
			mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/random
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
			beltr = /obj/item/rogueweapon/sword/uchigatana
			backr = /obj/item/storage/backpack/rogue/satchel
			r_hand = /obj/item/rogueweapon/halberd/bardiche/naginata
			if(prob(30))
				head = /obj/item/clothing/head/roguetown/helmet/visored/knight/zunari
			else
				head = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
			if(H.dna.species.name == "Oni")
				r_hand = /obj/item/rogueweapon/mace/goden/tetsubo //We hitting the proper oni tropes.
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		if(H.dna.species.name == "Oni")
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, -4, TRUE) //re:focus on their proper weapon. Hopefully this code WORKS.
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
