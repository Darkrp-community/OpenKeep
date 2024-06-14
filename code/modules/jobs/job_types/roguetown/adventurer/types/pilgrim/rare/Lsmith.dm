//dwarf master smith

/datum/advclass/pilgrim/rare/masterblacksmith
	name = "Master Blacksmith"
	tutorial = "Dwarves, and humen who trained extensively under them in the art of smithing, \
	become the most legendary smiths at their craft, gaining reputation beyond compare."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Dwarf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/masterblacksmith
	isvillager = FALSE
	ispilgrim = TRUE
	maxchosen = 1
	israre = TRUE

/datum/outfit/job/roguetown/adventurer/masterblacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	beltr = /obj/item/rogueweapon/hammer
	backl = /obj/item/storage/backpack/rogue/backpack
	mask = /obj/item/clothing/mask/rogue/facemask
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/rogueweapon/huntingknife
	cloak = /obj/item/clothing/cloak/apron/brown
	gloves = /obj/item/clothing/gloves/roguetown/leather
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueweapon/tongs=1, /obj/item/rogueore/coal=1, /obj/item/rogueore/iron=1)
	
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(2,3,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(1,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,2,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(1,2,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(2,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, pick(2,3,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, pick(1,2,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, pick(1,2,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, pick(1,2,2), TRUE)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if(H.age == AGE_OLD) // Wise still on every field, but gimped stats from age.
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", -2)
		else // The actual stats
			H.change_stat("strength", 2)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 3)
			H.change_stat("speed", -1)

	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt

