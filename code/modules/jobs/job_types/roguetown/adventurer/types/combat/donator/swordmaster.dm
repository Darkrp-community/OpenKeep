/datum/advclass/combat/swordmaster
	name = "Swordmaster"
	tutorial = "You spent years serving the northern Humen lords, and now you spend your days as a travelling hedge knight. Upon this island, you like to increase the fame of your swordskills, as well as your honor."
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/swordmaster
	maxchosen = 1
	plevel_req = 1
	israre = TRUE


/datum/outfit/job/roguetown/adventurer/swordmaster/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("speed", -1)

	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/rogueweapon/greatsword/flamberge
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/roguetown/boots/rare/humanswplate
	gloves = /obj/item/clothing/gloves/roguetown/rare/humanswplate
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	armor = /obj/item/clothing/suit/roguetown/armor/rare/humanswplate
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/rare/humanswplate
	neck = /obj/item/clothing/neck/roguetown/chaincoif

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
