//swordmaster with spear

/datum/advclass/combat/lancer
	name = "Lancer"
	tutorial = "Working for many years as a famous mercenary in the southern Humen kingdoms, you've started heading north to avoid the skeletons of your past. With your polearm by your side, you can face down any foe."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/lancer
	maxchosen = 1
	plevel_req = 1
	israre = TRUE

/datum/outfit/job/roguetown/adventurer/lancer/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("speed", -1)

	var/randy = rand(1,5)
	switch(randy)
		if(1 to 2)
			backr = /obj/item/rogueweapon/halberd/bardiche
		if(3 to 4)
			backr = /obj/item/rogueweapon/eaglebeak
		if(5)
			backr = /obj/item/rogueweapon/spear/billhook


	pants = /obj/item/clothing/under/roguetown/tights/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/roguetown/boots/rare/humanspplate
	gloves = /obj/item/clothing/gloves/roguetown/rare/humanspplate
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	armor = /obj/item/clothing/suit/roguetown/armor/rare/humanspplate
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/rare/humanspplate
	neck = /obj/item/clothing/neck/roguetown/chaincoif

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
