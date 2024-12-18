/datum/job/roguetown/nitemaster
	title = "Nitemaster"
	flag = NIGHTMASTER
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Dwarf",
		"Elf",
		"Half-Elf",
	)

	tutorial = "Even nobles can be disgraced and fall on hard times. For whatever reason you have traded your reputation for a supply of drugs and nitemaidens to employ and profit from. Some accuse you of have connections with the Rogues and Bandits of the land but surely its just slander..."

	allowed_sexes = list(MALE)
	outfit = /datum/outfit/job/roguetown/nitemaster
	display_order = JDO_NITEMASTER
	give_bank_account = 100
	min_pq = 0
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/nitemaster/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/brown
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/webs
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/nitemaster
	beltr = /obj/item/rogueweapon/knife/dagger/steel/special
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 2)

	if(H.dna?.species)
		if(H.dna.species.id == "human")
			H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()

