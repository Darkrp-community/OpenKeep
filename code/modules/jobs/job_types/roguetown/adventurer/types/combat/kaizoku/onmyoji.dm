/datum/advclass/combat/abyssariad/onmyoji //They will have their own magic in the future, most hopefully. Currently using 'Sorcerer' as copy-paste.
	name = "Onmyoji"
	tutorial = "The Chosen of the Pressuring Depth, spiritcallers of Abyssor, sage of the oceans. The Onmyojis are celestial magicians skilled in divination \
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

/datum/outfit/job/roguetown/adventurer/abyssariad/onmyoji
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/adventurer/abyssariad/onmyoji/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta/cloudhead
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/shirt/kaizoku/robe/random
		head = /obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi/random
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian
		head = /obj/item/clothing/head/roguetown/wizhat/onmyoji/random
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff/bostaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 3)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", -1)
		H.change_stat("speed", -2)
		//placeholder spells.
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball) //They are intended to have their own powers. I will make that later in the future with the help of another coder.
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/projectile/magic_missile)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/forcewall)