/datum/advclass/crusader
	name = "Crusader"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/crusader
	plevel_req = 0
	maxchosen = 2
	isvillager = FALSE
	tutorial = "The crusaders... Knights who have pledged \
	their wealth and lands to the church, taking up the banner \
	of one of the rival Orders dedicated to retaking the holy land. \
	The 451st crusade is sure to be the last."

/datum/outfit/job/roguetown/adventurer/crusader
	name = "Crusader"

/datum/outfit/job/roguetown/adventurer/crusader/pre_equip(mob/living/carbon/human/H)
	..()

	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	pants = /obj/item/clothing/under/roguetown/chainlegs
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	armor = /obj/item/clothing/cloak/stabard/crusader
	cloak = /obj/item/clothing/cloak/cape/crusader
	gloves = /obj/item/clothing/gloves/roguetown/chain
	backr = /obj/item/rogueweapon/shield/tower/metal
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword/decorated
	beltl = /obj/item/clothing/head/roguetown/helmet/heavy/crusader
	neck = /obj/item/clothing/neck/roguetown/psicross/astrata
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/rich=1)

	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", -1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	for(var/I in GLOB.adv_classes)
		var/datum/advclass/A = I
		if(A.name == name)
			if(A.amtchosen > 1)
				armor = /obj/item/clothing/cloak/stabard/crusader/t
				cloak = /obj/item/clothing/cloak/raincloak/furcloak
				beltl = /obj/item/clothing/head/roguetown/helmet/heavy/crusader/t
				neck = /obj/item/clothing/neck/roguetown/psicross
				beltr = /obj/item/rogueweapon/sword/sabre
				belt = /obj/item/storage/belt/rogue/leather/plaquesilver

	if(H.gender == FEMALE)
		backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
		backr = /obj/item/storage/backpack/rogue/satchel
		beltr = /obj/item/quiver/bolts
		gloves = /obj/item/clothing/gloves/roguetown/chain
		shoes = /obj/item/clothing/shoes/roguetown/boots/armor
		backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver = 1, /obj/item/storage/belt/rogue/pouch/coins/rich=1)
		H.change_stat("strength", 1)


//	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)


/obj/item/clothing/cloak/stabard/crusader
	name = "surcoat of the golden order"
	icon_state = "crusader_surcoat"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/cloak/stabard/crusader/t
	name = "surcoat of the silver order"
	icon_state = "crusader_surcoatt2"

/obj/item/clothing/cloak/cape/crusader
	name = "desert cape"
	icon_state = "crusader_cloak"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/head/roguetown/helmet/heavy/crusader
	name = "bucket helm"
	icon_state = "crusader_helm"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/head/roguetown/helmet/heavy/crusader/t
	icon_state = "crusader_helmt2"

/obj/item/clothing/cloak/cape/crusader/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/cloak/cape/crusader/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE
	..()

/obj/item/clothing/cloak/cape/crusader/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
