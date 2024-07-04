/datum/advclass/noble
	name = "Noble"
	tutorial = "You are a noble, from some place far away, trying to visit the nobility of the area \
	you are encouraged to make your own story. But with wealth, come the poor, ready to pilfer you \
	of your hard earned (inherited) Mammons, so tread lightly unless you want to meet a grizzly end"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/noble
	category_tags = (CTAG_PILGRIM)
	maximum_possible_slots = 2


/datum/outfit/job/roguetown/adventurer/noble/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("intelligence", 1)
	H.change_stat("strength", -1)
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/veryrich
	belt = /obj/item/storage/belt/rogue/leather
	id = /obj/item/clothing/ring/silver
	if(H.gender == FEMALE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
		head = /obj/item/clothing/head/roguetown/hatblu
		cloak = /obj/item/clothing/cloak/raincloak/purple
		backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
		beltl = /obj/item/quiver/arrows
		backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver)
	if(H.gender == MALE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		pants = /obj/item/clothing/under/roguetown/tights/purple
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/purple
		cloak = /obj/item/clothing/cloak/half
		head = /obj/item/clothing/head/roguetown/fancyhat
		beltl = /obj/item/rogueweapon/sword/rapier/dec
		backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		r_hand = /obj/item/rogueweapon/woodstaff
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
