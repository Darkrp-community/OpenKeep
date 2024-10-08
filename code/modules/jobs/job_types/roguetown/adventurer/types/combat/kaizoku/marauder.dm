/datum/advclass/combat/marauder //role capable of crafting their own low-tier armor.
	name = "Marauder Tribal"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/marauder
	category_tags = list(CTAG_ADVENTURER)
	tutorial = "Ever since Grezenholft invasions on Fog Islands, the Kappa Tribes became allies of many Abyssariad clans. Even if untrue for the entire government, Kappa Marauders take part of Abyssariad expeditions as formidable annihilators of Humens and Goblins alike."


/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/light
/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/medium
/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic

/obj/item/clothing/under/roguetown/kaizoku/ceramic/light
/obj/item/clothing/under/roguetown/kaizoku/tribal
/obj/item/clothing/shoes/roguetown/sandals

/obj/item/clothing/head/roguetown/helmet/ceramic
/obj/item/clothing/head/roguetown/helmet/ceramic/medium
/obj/item/clothing/head/roguetown/helmet/ceramic/reinforced

backr = /obj/item/rogueweapon/spear/obsidian
beltl = /obj/item/rogueweapon/mace/cudgel/rungu
backr/obj/item/rogueweapon/mace/cudgel/ararebo/obsidian
backl = /obj/item/storage/backpack/rogue/satchel
/obj/item/clothing/wrists/roguetown/bracers/leather


/datum/outfit/job/roguetown/adventurer/marauder/pre_equip(mob/living/carbon/human/H)
	..()

	//average normal skill for all. They are not civilized kappas, so they have skills for survival.
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE) //Tribal Kappas lives on the river.
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE) //fish is their main course.
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE) //Elf-Goblin nature.


/obj/item/clothing/suit/roguetown/armor/ceramic
/obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
/obj/item/clothing/suit/roguetown/armor/ceramic/light

/datum/outfit/job/roguetown/adventurer/abyssariad/wokou/pre_equip(mob/living/carbon/human/H) // Same as Warrior.
	..()
	H.become_blind("TRAIT_GENERIC")
	var/tribaltype = list("boneclad","riverdweller","bodysnatcher")
	var/specialization = input("Choose your equipments", "Available equipments") as anything in wokoutype
	switch(specialization)
		if("boneclad") //Starts with no survival tool, but has full body equipment they'd usually make by hunting.
			H.set_blindness(0)
			armor = /obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
			head = /obj/item/clothing/head/roguetown/helmet/ceramic/reinforced
			pants = /obj/item/clothing/under/roguetown/kaizoku/ceramic
			beltl = /obj/item/rogueweapon/mace/cudgel/rungu
			beltr = /obj/item/rogueweapon/mace/cudgel/ararebo/obsidian
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			
			to_chat(H, span_warning( "<span class='info'>Boneclad info.</span>"))

			//same as normal warriors.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		if("bodysnatcher") //
			H.set_blindness(0)
			armor = /obj/item/clothing/suit/roguetown/armor/ceramic
			head = /obj/item/clothing/head/roguetown/helmet/ceramic/medium
			pants = /obj/item/clothing/under/roguetown/kaizoku/ceramic/light
			backr = /obj/item/rogueweapon/spear/obsidian
			backl = /obj/item/rogueweapon/shield/rattan
			beltr = /obj/item/rogueweapon/mace/cudgel/rungu

			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			
			to_chat(H, span_warning( "<span class='info'>Boneclad info.</span>"))

			//same as normal warriors.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)