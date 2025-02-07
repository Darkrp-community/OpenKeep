/datum/job/roguetown/cook
	title = "Cook"
	flag = COOK
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar",
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine"
	)
	tutorial = "Slice, chop, and into the pot... You've spent more nites than you can count cutting meat and vegetables until your fingers are bloody and raw, but it's honest work."

	outfit = /datum/outfit/job/roguetown/cook
	display_order = JDO_COOK
	bypass_lastclass = FALSE
	give_bank_account = 8
	whitelist_req = FALSE

/datum/outfit/job/roguetown/cook/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/taming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/roguekey/tavern
	beltr = /obj/item/rogueweapon/knife/villager
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	head = /obj/item/clothing/head/roguetown/cookhat
	cloak = /obj/item/clothing/cloak/apron/cook
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		H.change_stat("constitution", 2)


/datum/outfit/job/roguetown/cook
	var/reminder = "<br><br><font color='#3d8985'><span class='bold'>If the Inkeep is around, they´re your boss. If not, run the Inn as you best can!</span></font><br><br>"

/datum/outfit/job/roguetown/cook/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, reminder)

