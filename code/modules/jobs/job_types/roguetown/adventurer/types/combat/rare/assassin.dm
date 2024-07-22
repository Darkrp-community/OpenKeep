/datum/advclass/combat/assassin
	name = "Assassin"
	tutorial = "From a young age you have been drawn to blood, to hurting others. Eventually you found others like you, and a god who would bless your actions. Your cursed dagger has never led you astray, and with every stab you feel a little less empty."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Tiefling",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/assassin
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 2
	pickprob = 100

/datum/outfit/job/roguetown/adventurer/assassin/pre_equip(mob/living/carbon/human/H)
	..()
	H.verbs |= /mob/living/carbon/human/proc/who_targets
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) // Used for leaving notes after your evil work.

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_BLACK
		H.update_body()
	// Assassin now spawns disguised as one of the non-combat drifters. You never know who will stab you in the back.
	var/disguise = pick("Fisher", "Hunter", "Miner", "Noble", "Woodcutter")
	switch (disguise)
		if("Fisher")
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE) //Have to know to play the part.
			if(H.gender == MALE)
				pants = /obj/item/clothing/under/roguetown/tights/random
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				head = /obj/item/clothing/head/roguetown/fisherhat
				armor = /obj/item/clothing/suit/roguetown/armor/workervest
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather/assassin
				backr = /obj/item/fishingrod
				backpack_contents = list(/obj/item/natural/worms = 1,/obj/item/rogueweapon/shovel/small=1)
			else
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				head = /obj/item/clothing/head/roguetown/fisherhat
				backr = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather/assassin
				beltr = /obj/item/fishingrod
				backpack_contents = list(/obj/item/natural/worms = 1,/obj/item/rogueweapon/shovel/small=1)
		if("Hunter")
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) //The assassin trades their crossbow abilities to match their disguise.
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, -2, TRUE)
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			head = /obj/item/clothing/head/roguetown/roguehood
			backr = /obj/item/storage/backpack/rogue/satchel
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			belt = /obj/item/storage/belt/rogue/leather/assassin
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/flashlight/flare/torch/lantern
			gloves = /obj/item/clothing/gloves/roguetown/leather
		if("Miner")
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE) //Use the pickaxe...
			H.mind.adjust_skillrank(/datum/skill/combat/swords, -2, TRUE)
			head = /obj/item/clothing/head/roguetown/armingcap
			pants = /obj/item/clothing/under/roguetown/trou
			armor = /obj/item/clothing/suit/roguetown/armor/workervest
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/assassin
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/pick
			backl = /obj/item/storage/backpack/rogue/backpack
		if("Noble")
			if(H.gender == MALE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE) //The male noble's sword is less useful than the female noble's bow, so no downside.
				shoes = /obj/item/clothing/shoes/roguetown/boots
				beltr = /obj/item/flashlight/flare/torch/lantern
				backl = /obj/item/storage/backpack/rogue/satchel
				neck = /obj/item/storage/belt/rogue/pouch/coins/rich //Fake nobles get less money
				belt = /obj/item/storage/belt/rogue/leather/assassin
				id = /obj/item/clothing/ring/silver
				pants = /obj/item/clothing/under/roguetown/tights/purple
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/purple
				cloak = /obj/item/clothing/cloak/half
				head = /obj/item/clothing/head/roguetown/fancyhat
				beltl = /obj/item/rogueweapon/sword/iron
			else
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE) //Female nobles get the male noble's bow, but are less trained than an Assassin disguising as a Hunter. Balance.
				H.mind.adjust_skillrank(/datum/skill/combat/crossbows, -1, TRUE)
				shoes = /obj/item/clothing/shoes/roguetown/boots
				beltr = /obj/item/flashlight/flare/torch/lantern
				backl = /obj/item/storage/backpack/rogue/satchel
				neck = /obj/item/storage/belt/rogue/pouch/coins/rich //Fake nobles get less money
				belt = /obj/item/storage/belt/rogue/leather/assassin
				id = /obj/item/clothing/ring/silver
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
				head = /obj/item/clothing/head/roguetown/hatblu
				cloak = /obj/item/clothing/cloak/raincloak/purple
				backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
				beltl = /obj/item/quiver/arrows
		if("Woodcutter")
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE) //Use the axe...
			H.mind.adjust_skillrank(/datum/skill/combat/swords, -2, TRUE)
			belt = /obj/item/storage/belt/rogue/leather/assassin
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			pants = /obj/item/clothing/under/roguetown/trou
			head = /obj/item/clothing/head/roguetown/roguehood
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			backr = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			armor = /obj/item/clothing/suit/roguetown/armor/workervest
			beltr = /obj/item/rogueweapon/woodcut

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ASSASSIN, TRAIT_GENERIC)
	H.change_stat("strength", 1)
	H.change_stat("perception", 2)
	H.change_stat("speed", 3)
	if(H.patron != /datum/patron/inhumen/graggar)
		H.patron = GLOB.patronlist[/datum/patron/inhumen/graggar] // Assassins are associated with the God of murder, Graggar
		to_chat(H, "<span class='danger'>My worship of [H.patron] has led me to who I am tonight. Let the blood flow.")

/mob/living/carbon/human/proc/who_targets()
	set name = "Remember Targets"
	set category = "Memory"
	if(!mind)
		return
	mind.recall_targets(src)