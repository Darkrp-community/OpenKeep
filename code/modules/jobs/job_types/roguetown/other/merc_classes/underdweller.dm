/datum/advclass/mercenary/underdweller
	name = "Underdweller"
	tutorial = "A member of the Underdwellers, you've taken many of the deadliest contracts known to man in the Dwarven Federation. Drow or Dwarf, you've put your differences aside for coin and adventure."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Dwarf",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/mercenary/underdweller
	ismerc = TRUE

/datum/outfit/job/roguetown/mercenary/underdweller/pre_equip(mob/living/carbon/human/H)
    ..()
    head = /obj/item/clothing/head/roguetown/helmet/leather/minershelm
    pants = /obj/item/clothing/under/roguetown/trou/leather
    armor = /obj/item/clothing/suit/roguetown/armor/plate/half
    shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
    shoes = /obj/item/clothing/shoes/roguetown/boots/leather
    belt = /obj/item/storage/belt/rogue/leather
    neck = /obj/item/clothing/neck/roguetown/chaincoif
    beltl = /obj/item/rogueweapon/woodcut/pick
    beltr = /obj/item/rogueweapon/huntingknife
    backl = /obj/item/storage/backpack/rogue/backpack
    backr = /obj/item/rogueweapon/shield/wood
    backpack_contents = list(/obj/item/roguekey/mercenary, /obj/item/storage/belt/rogue/pouch/coins/poor)
    if(H.mind)
        H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
        H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
        H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
        H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
        H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
        H.change_stat("fortune", 1)
        H.change_stat("strength", 1)
    ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
