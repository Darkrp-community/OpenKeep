//More or less the Abyssariad version of the Cleric.

/datum/advclass/combat/abyssariad/yamabushi
	name = "Yamabushi"
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "The Yamabushi stands as the battle-hardened stewards and hermits of knowledge dedicated to society's \
	welfare of Abyssanctum's faith. Their wisdom welcome other patron within their sacred ranks so their devotion \
	further embrace the greater good. They meditate on mountains and endure long lengths each voyage."
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/yamabushi
	maximum_possible_slots = 2 //Less slots. It is split with Sohei.
	min_pq = 2
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 100
	vampcompat = FALSE

/datum/outfit/job/roguetown/adventurer/abyssariad/yamabushi/pre_equip(mob/living/carbon/human/H)
	..()
	switch(H.patron?.name)
		if("Astrata")
			wrists = /obj/item/clothing/neck/roguetown/psicross/astrata
		if("Dendor")
			wrists = /obj/item/clothing/neck/roguetown/psicross/dendor
		if("Necra")
			wrists = /obj/item/clothing/neck/roguetown/psicross/necra
		if("Eora")
			wrists = /obj/item/clothing/neck/roguetown/psicross/eora
		if("Ravox")
			wrists = /obj/item/clothing/neck/roguetown/psicross/ravox
		if("Noc")
			wrists = /obj/item/clothing/neck/roguetown/psicross/noc
		if("Abyssor")
			wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor

	armor = /obj/item/clothing/suit/roguetown/armor/plate/nanbando
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/monkgarb/random
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/jikatabi
	pants = /obj/item/clothing/under/roguetown/tobi/hakama/random
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(prob(40))
		beltr = /obj/item/rogueweapon/mace/cudgel/ararebo
		beltl = /obj/item/rogueweapon/thrown/ono
	else if(prob(20))
		backr = /obj/item/rogueweapon/mace/goden/kanabo // luckyroll
	else
		backr = /obj/item/rogueweapon/mace/warhammer/otsuchi //You know that Warhammer is a crap weapon, and Otsuchi is even worse.
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/tengai/yamabushi
	else
		head = /obj/item/clothing/head/roguetown/tengai/sandogasa/yamabushi

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", -2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	if(H.patron != /datum/patron/divine/abyssor)
		to_chat(H, "<span class='warning'>As a Member of Abyssanctum, the Curator Branch ensured my duties would remain even if I found my faith in another God that is not Abyssor, as long it is Pantheonistic.")

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	C.update_devotion(50, 50)
	C.grant_spells_cleric(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)