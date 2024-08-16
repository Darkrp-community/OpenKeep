/datum/advclass/necromancer
	name = "Necromancer"
	tutorial = "Ostracized and hunted by society for their dark magics and perversion of life, Necromancers have been known to summon ghosts, ghouls, and zombies; you cannot."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Tiefling",
		"Dark Elf",
	)
	outfit = /datum/outfit/job/roguetown/adventurer/necromancer
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 1
	pickprob = 100
	allowed_patrons = list(/datum/patron/inhumen/zizo)

/datum/outfit/job/roguetown/adventurer/necromancer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff

	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)	
	H.change_stat("strength", -1)
	H.change_stat("intelligence", 3)
	H.change_stat("constitution", -2)
	H.change_stat("endurance", -1)
	H.change_stat("speed", -1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/sickness)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
	ADD_TRAIT(H, TRAIT_NECROMANCER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	H.faction |= "undead"