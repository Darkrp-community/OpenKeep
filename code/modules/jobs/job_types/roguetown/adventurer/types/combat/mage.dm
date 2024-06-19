/datum/advclass/combat/mage
	name = "Mage"
	tutorial = "Mages are usually grown-up apprentices of wizards. They are seeking adventure, using their arcyne knowledge to aid other adventurers."
	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/mage
	maxchosen = 2

/datum/outfit/job/roguetown/adventurer/mage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		if(H.age == AGE_OLD)
			head = /obj/item/clothing/head/roguetown/wizhat/gen
			armor = /obj/item/clothing/suit/roguetown/shirt/robe
			backl = /obj/item/storage/backpack/rogue/backpack
			H.change_stat("intelligence", 1)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.change_stat("strength", -2)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -2)
		H.change_stat("endurance", -1)
		H.change_stat("speed", -2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/projectile/magic_missile)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall)
