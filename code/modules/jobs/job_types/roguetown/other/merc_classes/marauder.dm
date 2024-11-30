/datum/advclass/mercenary/crimson
	name = "Bloodsworn Skirmisher"
	tutorial = "You come from the far-off savage realm of the Crimsonlands, your people are renown marauders, engaging in various ranged skirmishes before committing terrifiying charges against your whittled down foe. Fear, munitions and brutality are the way of the Jinetes, and this place is willing to pay top mammon for a warrior of your ability, you have been trained to use effectively the spear and shield, alongside your trusty knife."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Tiefling")
	outfit = /datum/outfit/job/roguetown/mercenary/marauder
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 4
	cmode_music = 'sound/music/combat_old.ogg'//soul
/datum/outfit/job/roguetown/mercenary/marauder/pre_equip(mob/living/carbon/human/H)//new skirmisher merc class, 4 weapon skills like other merc classes and dodge expert
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)//good spear user trowing and defending with it
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)//so they can heal themselves, after all they didn't survived the mercenary life without know how to sew their wounds

	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	shoes = /obj/item/clothing/shoes/roguetown/gladiator
	belt = /obj/item/storage/belt/rogue/leather/mercenary
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather//leather armor so they match other roles that get heavy leather gloves
	head = /obj/item/clothing/head/roguetown/helmet/ironpot/marauder
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea/marauder
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/red
	beltl = /obj/item/rogueweapon/shield/tower/buckleriron
	backl = /obj/item/rogueweapon/polearm/spear
	neck = /obj/item/clothing/neck/roguetown/coif
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/knife/hunting = 1)

	H.change_stat("perception", 1)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
