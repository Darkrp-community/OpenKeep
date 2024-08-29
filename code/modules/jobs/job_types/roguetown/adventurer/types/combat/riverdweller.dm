/datum/advclass/combat/riverdweller
	name = "River Dweller"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/riverdweller
	isvillager = FALSE
	tutorial = "The usual, average Kappa tribesmen who lives a generalistic, fruitful life on the edge of nature and civilization. One must know how to fight as much as to hunt, and work."

/datum/outfit/job/roguetown/adventurer/riverdweller/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	pants = /obj/item/clothing/under/roguetown/kaizoku/tribal
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/light
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/tribal
	armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/medium
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	beltr = /obj/item/rogueweapon/huntingknife/idagger/kunai
	beltl = /obj/item/quiver/arrows
	backr = /obj/item/rogueweapon/spear/obsidian
	if(prob(30))
		head = /obj/item/clothing/head/roguetown/kaizoku/big/ceramic
	else
		head = /obj/item/clothing/head/roguetown/kaizoku/ceramic
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/fingerless
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)

	H.change_stat("perception", 3)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

