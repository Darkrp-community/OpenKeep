/datum/job/roguetown/undertaker
	title = "Gravedigger"
	flag = GRAVEDIGGER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Changeling",
		"Kenku",
		"Ogrun",
		"Undine"
	)
	tutorial = "The dead dont speak, least if youre doing your job right. Youve a pilfers dream, for few have enough to pay for your services out of pocket- So you take it from the fallen. Your job isnt considered highly, but without you: who else would disgrace the sanctity of the dead?"

	outfit = /datum/outfit/job/roguetown/undertaker
	display_order = JDO_GRAVEMAN
	give_bank_account = 34
	min_pq = -50
	bypass_lastclass = TRUE

/datum/outfit/job/roguetown/undertaker/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/tights/black
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/roguekey/graveyard
	beltr = /obj/item/storage/belt/rogue/pouch
	backr = /obj/item/rogueweapon/shovel
	if(H.gender == FEMALE)
		pants = null
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/black
	else
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", -2)
		H.change_stat("speed", 1)
		H.change_stat("fortune", -1) // Tradeoff for never being cursed when unearthing graves.
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Operating with corpses every day.
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC) // In case they need to move tombs or anything.

	if(H.dna.species?.id == "abyssariad")
		to_chat(H, "<span class='warning'>Despite what some people may believe, my role on society is respected, as my abyssal honor is not put in test in a daily basis, as butchering is no death trade.")
		if(H.gender == FEMALE)
			pants = null
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono/dark
		else
			armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/haori/dark
			pants = /obj/item/clothing/under/roguetown/tobi/dark
