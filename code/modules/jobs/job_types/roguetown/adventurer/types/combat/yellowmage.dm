/datum/advclass/combat/yellowmage
	name = "Yellow Mage"
	tutorial = "Yellow Mages belong to an order which believes experience trumps any amount of teaching, to this end the Yellow Mages wander Grimoria in search of both enlightenment and power. They are hardier than their more well learned counterparts, but lack some spells only available to those with an education."
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
	outfit = /datum/outfit/job/roguetown/adventurer/yellowmage
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/adventurer/yellowmage

/datum/outfit/job/roguetown/adventurer/yellowmage/pre_equip(mob/living/carbon/human/H)
	..()

	head = /obj/item/clothing/head/roguetown/yellowhood
	r_hand = /obj/item/rogueweapon/polearm/woodstaff
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/yellowrobe
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/rogue/manapot

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)

		H.mind.adjust_spellpoints(4)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/learnspell)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

	H.change_stat("strength", -1)
	H.change_stat("intelligence", 3)
	H.change_stat("constitution", -1)
	H.change_stat("endurance", -1)
	H.change_stat("speed", -1)

