/datum/advclass/combat/abyssariad/onmyoji //They will have their own magic in the future, most hopefully.
	name = "Wandering Onmyoji"
	tutorial = "The Pilgrim of the Pressuring Depth, spiritcallers of Abyssor, sage of the oceans. The Onmyojis are celestial magicians skilled in divination \
	and manifesting the powers of the sea as intermediaries between the Abyssariads and the Abyssal realm. The Onmyojis are empowered in the same way Abyssor \
	was empowered, in the depths of the Weeping God's pressuring tears."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Kitsune",
		"Tengu",
		"Oni",
		"Kappa"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/onmyoji
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/adventurer/mage
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/adventurer/abyssariad/onmyoji/pre_equip(mob/living/carbon/human/H)
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
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
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