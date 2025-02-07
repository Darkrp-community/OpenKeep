/datum/job/roguetown/butcher
	title = "Butcher"
	flag = BEASTMASTER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine"
	)
	tutorial = "Some say youre a strange individual, some say youre a cheat while some claim you are a savant in the art of sausage making. Without your skilled hands and knifework most of the livestock around the town would be wasted. "


	outfit = /datum/outfit/job/roguetown/beastmaster
	display_order = JDO_BUTCHER
	give_bank_account = TRUE
	bypass_lastclass = FALSE

/datum/outfit/job/roguetown/beastmaster/pre_equip(mob/living/carbon/human/H)
	..()

	belt = /obj/item/storage/belt/rogue/leather
	beltr= /obj/item/storage/meatbag
	beltl= /obj/item/roguekey/butcher
	backl = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/butcher
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	backpack_contents = list(/obj/item/kitchen/spoon, /obj/item/reagent_containers/food/snacks/rogue/truffles, /obj/item/rogueweapon/knife/hunting)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Used to dismembering live stock, desensitized to it.

	H.change_stat("strength", 1)
	H.change_stat("constitution", 2) // Built sturdy due to HIGH PROTEIN DIET
	H.change_stat("intelligence", -1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE) // Not a trained cook, but knows a thing or two
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/taming, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE) // Better than a soilson, but doesn't outshine a hunter or a weaver
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 5, TRUE)

		H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedarmor) //Guayo asked me to give this to the Butcher.
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/reinforcedhelmet)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumhelmet)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/mediumarmor)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/lighthelmet)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/lightarmor)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_spear)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/obsidian_club)

	if(HAS_TRAIT(H, TRAIT_KAIZOKU))
		to_chat(H, "<span class='warning'>Despite what some people believe, my role on society is respected, as my abyssal honor is not put in test in a daily basis.")
		if(H.gender == MALE)
			pants = /obj/item/clothing/under/roguetown/trou/tobi/random
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
		else
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/kimono/random
