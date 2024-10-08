/datum/job/roguetown/captain
	title = "Captain"
	flag = CAPTAIN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Kitsune", //Lore Situationism: The three abyssariad races have been brought over to the Garrison for prestige values and to cement the King's power by holding culturally loyal-bound raiders as part of the army.
		"Tengu",
		"Oni" //gatekeeping Aasimars and Onis from joining as Captains, but allowing Dwarves is not really well perceived by me.
	)
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_CAPTAIN
	tutorial = "Law and Order, your divine reason for existence. You have been given command over the garrison to help keep order and peace within the city and defend it against the many dangers of the island."
	whitelist_req = FALSE
	bypass_lastclass = TRUE
	outfit = /datum/outfit/job/roguetown/captain
	give_bank_account = 120
	min_pq = -4

/datum/job/roguetown/captain/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Ser"
		if(H.gender == FEMALE)
			honorary = "Dame"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

/datum/outfit/job/roguetown/captain/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/visored/knight
	gloves = /obj/item/clothing/gloves/roguetown/plate
	pants = /obj/item/clothing/under/roguetown/platelegs
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/captain
	neck = /obj/item/clothing/neck/roguetown/gorget
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/rogueweapon/sword/sabre
	beltr = /obj/item/rogueweapon/mace/cudgel
	cloak = /obj/item/clothing/cloak/cape/guard

	if(H.dna?.species)
		if(H.dna.species?.id == "abyssariad") // Weaponskill 5 justifies the Abyssariad being a legitimate Abyssal Champion.
			to_chat(H, "<span class='warning'>I am a still lingering champion of Abyssor from the ancient ages, a Shogun. My duty is to protect the divine right of Rockhill's royal family, and lead their retainers.")
			head = /obj/item/clothing/head/roguetown/helmet/visored/knight/abyssalchampion
			gloves = /obj/item/clothing/gloves/roguetown/plate/tatamitekko
			pants = /obj/item/clothing/under/roguetown/platelegs/weepershanwenkai
			armor = /obj/item/clothing/suit/roguetown/armor/shanwenkai
			neck = /obj/item/clothing/neck/roguetown/gorget //Exception.
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
			shoes = /obj/item/clothing/shoes/roguetown/nobleboot/gutal
			beltl = /obj/item/rogueweapon/sword/sabre/piandao
			beltr = /obj/item/rogueweapon/mace/cudgel/jitte

	backpack_contents = list(/obj/item/keyring/captain = 1, /obj/item/signal_horn = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
