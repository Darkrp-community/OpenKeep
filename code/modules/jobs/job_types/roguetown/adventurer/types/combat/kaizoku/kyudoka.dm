/datum/advclass/combat/abyssariad/kyudoka
	name = "Kyudoka"
	tutorial = "The praticioners of Kyujutsu trained in Dustwalker dojos, making use of the large Yumi as a weapon of war, \
	trying to keep the culture alive even after the creation of handcannons and firelances."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/kyudoka
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/abyssariad/kyudoka/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1,1), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot/gutal
	pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/fur/random
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/random //For the drip's sake that portrays their military side.
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather/abyssal
	else
		gloves = /obj/item/clothing/gloves/roguetown/leather/yugake
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	cloak = /obj/item/clothing/cloak/raincloak/mino
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long/yumi
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(/obj/item/bait = 1, /obj/item/rogueweapon/huntingknife/idagger/kunai = 1)
	beltl = /obj/item/quiver/arrows
	H.change_stat("perception", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
