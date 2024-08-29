/datum/advclass/combat/marauder
	name = "Marauder Tribal"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/marauder
	isvillager = FALSE
	tutorial = "The Kappa tribes offers warriors to Abyssariad parties under mutual agreement of more manpower for the usage of their technology. Armored in bone and ceramic plates made of silica and carbon in abyssal lava furnaces, these marauders are formidable annihilators of goblins and humens alike."

/datum/outfit/job/roguetown/adventurer/marauder/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	if(prob(30))
		pants = /obj/item/clothing/under/roguetown/kaizoku/ceramic
	else
		pants = /obj/item/clothing/under/roguetown/kaizoku/tribal
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	if(prob(40))
		shirt = /obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/light
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/tribal
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic
	else
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/medium
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	if(prob(50))
		beltl = /obj/item/rogueweapon/mace/cudgel/rungu
		backr = /obj/item/rogueweapon/mace/cudgel/ararebo/obsidian
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	else
		beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/tanto
		backr = /obj/item/rogueweapon/spear/obsidian
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	head = /obj/item/clothing/head/roguetown/kaizoku/big/ceramic/heavy
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 2)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

