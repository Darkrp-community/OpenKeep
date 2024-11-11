/datum/job/roguetown/innkeep
	title = "Innkeep"
	flag = INNKEEP
	department_flag = SERFS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)

	tutorial = "Liquor, lodging, and lavish meals... You're the one who provides the the hardworking townsfolk with a place to eat and drink their sorrows away, and accommodations for weary travelers passing through."

	outfit = /datum/outfit/job/roguetown/innkeep
	display_order = JDO_INNKEEP
	bypass_lastclass = TRUE
	give_bank_account = 60
	min_pq = -10

/datum/outfit/job/roguetown/innkeep/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
		beltr = /obj/item/reagent_containers/glass/bottle/rogue/beer/blackgoat
		neck = /obj/item/keyring/innkeep
		cloak = /obj/item/clothing/cloak/apron/waist
		H.change_stat("strength", 1)
		H.change_stat("endurance", 1)
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		neck = /obj/item/storage/belt/rogue/pouch/coins/mid
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/keyring/innkeep
		beltr = /obj/item/reagent_containers/glass/bottle/rogue/beer/blackgoat
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)

/datum/outfit/job/roguetown/innkeep
	var/reminder = "<br><br><font color='#3d8985'><span class='bold'>Keys to the finer rooms are kept separate from the Peddlar. Make sure to charge for meals so you can hire mercenaries if needed, they may lodge at your Inn but they won't help without pay.</span></font><br><br>"

/datum/outfit/job/roguetown/innkeep/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, reminder)
