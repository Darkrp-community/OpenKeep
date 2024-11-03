/datum/advclass/combat/marauder //role capable of crafting their own low-tier armor.
	name = "Marauder Tribal"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/marauder
	category_tags = list(CTAG_ADVENTURER)
	tutorial = "Ever since Grezenholft invasions on Fog Islands, the Kappa Tribes became allies of many Abyssariad clans and guardians. Even if untrue for the entire government itself, Kappa Marauders take part of Abyssariad expeditions as ''allies'' and formidable annihilators of Humens and Goblins alike."

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
	H.become_blind("TRAIT_GENERIC")
	var/tribaltype = list("boneclad","bodysnatcher", "skypiercer")
	var/specialization = input("Choose your equipments", "Available equipments") as anything in tribaltype
	switch(specialization)
		if("boneclad") //Starts with no survival tool. Full melee, tier 3 makeshift armor roundstart. Mace/axe focus.
			H.set_blindness(0)
			armor = /obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
			head = /obj/item/clothing/head/roguetown/helmet/ceramic/reinforced
			pants = /obj/item/clothing/under/roguetown/kaizoku/ceramic
			beltl = /obj/item/rogueweapon/mace/cudgel/rungu
			backl = /obj/item/rogueweapon/mace/cudgel/ararebo/obsidian
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
			wrists = /obj/item/clothing/wrists/roguetown/bracers/bonebracer
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/tribal
			belt = /obj/item/storage/belt/rogue/leather/rope

			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			
			to_chat(H, span_warning( "<span class='info'>I am a warrior from Boneclad Clan! Revenge against paumpers-folk! No more shall we pity the fool! To be forced to work is only for weaklings and the disgraced!</span>"))

			//same as normal warriors.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		if("bodysnatcher") //Starts with blade as survival tool. Has Tier 2 makeshift armor, spear and throwable ranged weapon. Spear focus.
			H.set_blindness(0)
			armor = /obj/item/clothing/suit/roguetown/armor/ceramic
			head = /obj/item/clothing/head/roguetown/helmet/ceramic/medium
			pants = /obj/item/clothing/under/roguetown/kaizoku/ceramic/light
			backr = /obj/item/rogueweapon/spear/obsidian
			backl = /obj/item/rogueweapon/shield/rattan
			beltr = /obj/item/rogueweapon/mace/cudgel/rungu
			beltl = /obj/item/rogueweapon/huntingknife/kunai
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
			wrists = /obj/item/clothing/wrists/roguetown/bracers/bonebracer
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/tribal
			belt = /obj/item/storage/belt/rogue/leather/rope

			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			
			to_chat(H, span_warning( "<span class='info'>I hold the banner of my ancestors with all that is left, the grief long eternal. We've long suffered under the deathly sickle of the Humens. How long we shall last in war?</span>"))

			//same as normal warriors.
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("intelligence", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		if("skypiercer") //Start with survival tool. Ranged weapon focus.
			H.set_blindness(0)
			cloak = /obj/item/clothing/cloak/raincloak/mino
			armor = /obj/item/clothing/suit/roguetown/armor/leather/muneate/kappa
			shirt = /obj/item/clothing/suit/roguetown/armor/ceramic/light
			head = /obj/item/clothing/head/roguetown/helmet/ceramic
			pants = /obj/item/clothing/under/roguetown/kaizoku/tribal
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
			wrists = /obj/item/clothing/wrists/roguetown/bracers/bonebracer
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			beltl = /obj/item/flashlight/flare/torch/lantern
			backl = /obj/item/quiver/arrows
			belt = /obj/item/storage/belt/rogue/leather

			H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
			backpack_contents = list(/obj/item/bait = 1, /obj/item/rogueweapon/huntingknife/kunai = 1)
	H.cure_blind("TRAIT_GENERIC")