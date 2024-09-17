/datum/advclass/mercenary/strangler
	name = "Strangler"
	tutorial = "With the brutal dismantlement of drow society, your Order's talents were no longer needed. Yet where one door closes, another opens - the decadent mortals of the overworld clamber over each other to bid for your blade. Show them your craft."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Dark Elf")
	outfit = /datum/outfit/job/roguetown/mercenary/strangler
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 5

	cmode_music = 'sound/music/combat_delf.ogg'

/datum/outfit/job/roguetown/mercenary/strangler/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather/black
	pants = /obj/item/clothing/under/roguetown/trou/shadowpants
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/storage/belt/rogue/pouch/coins/poor, /obj/item/rogueweapon/huntingknife/idagger/steel/special)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		if(H.gender == FEMALE) //Melee defense-oriented brute, heavy lean towards non-lethal takedowns and capture.
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/shadowplate
			gloves = /obj/item/clothing/gloves/roguetown/chain/iron/shadowgauntlets
			wrists = /obj/item/net //Only chance against dodgers. Males getting this would be busted.
			mask = /obj/item/clothing/mask/rogue/facemask/shadowfacemask
			neck = /obj/item/clothing/neck/roguetown/gorget
			backr = /obj/item/rogueweapon/shield/tower/spidershield
			beltr = /obj/item/rogueweapon/whip/spiderwhip

			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE) //Alternative "upgrade" path.
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)

			H.change_stat("strength", 2) //Grenz merc statline but with maluses.
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 1)
			H.change_stat("intelligence", -1) //Brutebrain, relies on archer for healing, lockpicking and crafting.
			H.change_stat("speed", -1)

			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) //Torture mastery.
			H.verbs |= /mob/living/carbon/human/proc/torture_victim

		if(H.gender == MALE) //Squishy hit-and-runner assassin.
			shirt = /obj/item/clothing/suit/roguetown/shirt/shadowshirt
			armor = /obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
			cloak = /obj/item/clothing/cloak/half/shadowcloak
			gloves = /obj/item/clothing/gloves/roguetown/fingerless/shadowgloves
			mask = /obj/item/clothing/mask/rogue/shepherd/shadowmask
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve //Coupled with the racial PER malus, abysmal damage, but good for poison arrows.
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/rogueweapon/sword/iron/short

			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE) //Spread-out support skills, but inferior to Steppesman/Boltslinger.
			H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)

			H.change_stat("speed", 2) //Speedier than a Steppesman, but not as tough or damaging.
			H.change_stat("endurance", 1)

			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC) //Can sit in ambush in unlikeliest places.

		H.merctype = 7