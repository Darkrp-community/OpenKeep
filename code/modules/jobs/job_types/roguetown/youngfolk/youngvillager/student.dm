/datum/advclass/pilgrim/farmhand
	name = "student"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/student
	allowed_ages = list(AGE_YOUNG)
	isvillager = TRUE
	ispilgrim = FALSE

/datum/outfit/job/roguetown/adventurer/student/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, rand(1,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.virginity = TRUE
	belt = /obj/item/storage/belt/rogue/leather
	if(H.gender == MALE)
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/purple
		else
			shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/blue
		pants = /obj/item/clothing/under/roguetown/tights/black
	if(H.gender == FEMALE)
		if(prob(50))
			armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
		else
			armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = null
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1,/obj/item/paper/scroll = 1,/obj/item/natural/feather = 1)
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 3)
	H.change_stat("constitution", -2)
	H.mind.adjust_skillrank(/datum/skill/labor/mathematics, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
