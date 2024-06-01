/datum/advclass/pilgrim/rare/pilgrimchef
	name = "Wandering Chef"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/pilgrimchef
	isvillager = FALSE
	ispilgrim = TRUE
	maxchosen = 2

/datum/outfit/job/roguetown/adventurer/pilgrimchef/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	cloak = /obj/item/clothing/cloak/apron
	head = /obj/item/clothing/head/roguetown/chef
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/cooking/pan
	beltl = /obj/item/rogueweapon/huntingknife/cleaver
	backpack_contents = list(/obj/item/reagent_containers/powder/flour/salt = 1,/obj/item/reagent_containers/food/snacks/rogue/cheese=1,)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 1)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)