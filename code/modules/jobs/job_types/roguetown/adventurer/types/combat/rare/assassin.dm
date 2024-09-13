/datum/advclass/combat/assassin
	name = "Assassin"
	tutorial = "From a young age you have been drawn to blood, to hurting others. Eventually you found others like you, and a god who would bless your actions. Your cursed dagger has never led you astray, and with every stab you feel a little less empty."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/assassin
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 2
	min_pq = 0
	pickprob = 100

/datum/outfit/job/roguetown/adventurer/assassin/pre_equip(mob/living/carbon/human/H)
	..()
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
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) // Used for leaving notes after your evil work.
		var/datum/antagonist/new_antag = new /datum/antagonist/assassin() // Adds the assassin antag label.
		H.mind.add_antag_datum(new_antag)
		H.mind.assigned_role = "Pilgrim"

	H.become_blind("TRAIT_GENERIC")
	// Assassin now spawns disguised as one of the non-combat drifters. You never know who will stab you in the back.
	var/disguises = list("Bard", "Beggar", "Fisher", "Hunter", "Miner", "Monk", "Noble", "Peasant", "Warrior", "Woodcutter")
	var/disguisechoice = input("Choose your cover", "Available disguises") as anything in disguises

	switch(disguisechoice)
		if("Bard")
			H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE) //Have to know to "PLAY" the part... Eh? Eh?
			head = /obj/item/clothing/head/roguetown/bardhat
			shoes = /obj/item/clothing/shoes/roguetown/boots
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
			belt = /obj/item/storage/belt/rogue/leather/assassin
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			cloak = /obj/item/clothing/cloak/raincloak/red
			backl = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/special
			beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
			backpack_contents = list(/obj/item/flint)
			if(H.dna?.species)
				if(H.dna.species.id == "human")
					backr = /obj/item/rogue/instrument/lute
				if(H.dna.species.id == "dwarf")
					backr = /obj/item/rogue/instrument/accord
				if(H.dna.species.id == "elf")
					backr = /obj/item/rogue/instrument/harp
				if(H.dna.species.id == "tiefling")
					backr = /obj/item/rogue/instrument/guitar
		if("Beggar") //The sole "town" disguise available.
			H.job = "Beggar"
			belt = /obj/item/storage/belt/rogue/leather/assassin
			if(H.gender == FEMALE)
				armor = /obj/item/clothing/suit/roguetown/shirt/rags
			else
				pants = /obj/item/clothing/under/roguetown/tights/vagrant
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if("Fisher")
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE) //Have to know to play the part.
			if(H.gender == MALE)
				pants = /obj/item/clothing/under/roguetown/tights/random
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				head = /obj/item/clothing/head/roguetown/fisherhat
				mouth = /obj/item/rogueweapon/huntingknife
				armor = /obj/item/clothing/suit/roguetown/armor/workervest
				backl = /obj/item/storage/backpack/rogue/satchel
				belt = /obj/item/storage/belt/rogue/leather/assassin
				backr = /obj/item/fishingrod
				beltr = /obj/item/cooking/pan
				beltl = /obj/item/flint
				backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/natural/worms = 1, /obj/item/rogueweapon/shovel/small = 1)
			else
				shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
				armor = /obj/item/clothing/suit/roguetown/armor/workervest
				shoes = /obj/item/clothing/shoes/roguetown/boots/leather
				neck = /obj/item/storage/belt/rogue/pouch/coins/poor
				head = /obj/item/clothing/head/roguetown/fisherhat
				backl = /obj/item/storage/backpack/rogue/satchel
				backr = /obj/item/fishingrod
				belt = /obj/item/storage/belt/rogue/leather/assassin
				beltr = /obj/item/cooking/pan
				beltl = /obj/item/flint
				backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1, /obj/item/natural/worms = 1, /obj/item/rogueweapon/shovel/small = 1)
		if("Hunter")
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE) //The assassin trades their crossbow abilities to match their disguise.
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, -2, TRUE)
			pants = /obj/item/clothing/under/roguetown/tights/random
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backr = /obj/item/storage/backpack/rogue/satchel
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			belt = /obj/item/storage/belt/rogue/leather/assassin
			beltr = /obj/item/quiver/arrows
			beltl = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/flint = 1, /obj/item/bait = 1, /obj/item/rogueweapon/huntingknife = 1)
			gloves = /obj/item/clothing/gloves/roguetown/leather
		if("Miner")
			head = /obj/item/clothing/head/roguetown/armingcap
			pants = /obj/item/clothing/under/roguetown/trou
			armor = /obj/item/clothing/suit/roguetown/armor/workervest
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			shoes = /obj/item/clothing/shoes/roguetown/boots/leather
			belt = /obj/item/storage/belt/rogue/leather/assassin
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/pick
			backr = /obj/item/rogueweapon/shovel
			backl = /obj/item/storage/backpack/rogue/backpack
			backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueweapon/huntingknife = 1)
		if("Monk") //Peak AC reference.
			head = /obj/item/clothing/head/roguetown/roguehood
			neck = /obj/item/clothing/neck/roguetown/psicross/ravox
			shoes = /obj/item/clothing/shoes/roguetown/shortboots
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			armor = /obj/item/clothing/suit/roguetown/shirt/robe
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			belt = /obj/item/storage/belt/rogue/leather/assassin
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			backl = /obj/item/storage/backpack/rogue/backpack
			backr = /obj/item/rogueweapon/woodstaff
		if("Noble")
			shoes = /obj/item/clothing/shoes/roguetown/boots
			beltr = /obj/item/flashlight/flare/torch/lantern
			backl = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor //Spent all their money on expensive clothing.
			belt = /obj/item/storage/belt/rogue/leather/assassin
			id = /obj/item/clothing/ring/silver
			if(H.gender == MALE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE) //The male noble's sword is less useful than the female noble's bow, so no downside.
				pants = /obj/item/clothing/under/roguetown/tights/purple
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/purple
				cloak = /obj/item/clothing/cloak/half
				head = /obj/item/clothing/head/roguetown/fancyhat
				beltl = /obj/item/rogueweapon/sword/rapier/dec
				backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special)
			else
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE) //Female nobles get the male noble's bow, but are less trained than an Assassin disguising as a Hunter. Balance.
				H.mind.adjust_skillrank(/datum/skill/combat/crossbows, -1, TRUE)
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
				head = /obj/item/clothing/head/roguetown/hatblu
				cloak = /obj/item/clothing/cloak/raincloak/purple
				backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
				beltl = /obj/item/quiver/arrows
				backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver)
		if("Peasant")
			H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
			belt = /obj/item/storage/belt/rogue/leather/assassin
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			pants = /obj/item/clothing/under/roguetown/trou
			head = /obj/item/clothing/head/roguetown/armingcap
			shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
			backr = /obj/item/storage/backpack/rogue/satchel
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			backl = /obj/item/storage/backpack/rogue/satchel
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			armor = /obj/item/clothing/suit/roguetown/armor/workervest
			mouth = /obj/item/rogueweapon/huntingknife
			beltr = /obj/item/flint
			if(H.gender == FEMALE)
				armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
				shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
				pants = null
			backpack_contents = list(/obj/item/seeds/wheat=1,/obj/item/seeds/apple=1,/obj/item/ash=1)
			beltl = /obj/item/rogueweapon/sickle
			backr = /obj/item/rogueweapon/pitchfork
		if("Warrior")
			if(H.gender == FEMALE)
				H.underwear = "Femleotard"
				H.underwear_color = CLOTHING_BLACK
				H.update_body()
			shoes = /obj/item/clothing/shoes/roguetown/boots
			gloves = /obj/item/clothing/gloves/roguetown/leather
			belt = /obj/item/storage/belt/rogue/leather/assassin
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			pants = /obj/item/clothing/under/roguetown/tights/black
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/wood
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron //Loadout is the equivalent of the worst warrior rolls.
			beltl = /obj/item/rogueweapon/sword/iron
			neck = /obj/item/clothing/neck/roguetown/gorget
			head = /obj/item/clothing/head/roguetown/helmet/skullcap
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
			beltl = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/flint = 1)

	H.cure_blind("TRAIT_GENERIC")

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ASSASSIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)

	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	if(H.patron != /datum/patron/inhumen/graggar)
		H.patron = GLOB.patronlist[/datum/patron/inhumen/graggar] // Assassins are associated with the God of murder, Graggar
		to_chat(H, "<span class='danger'>I've memorized my list of targets, time to get to work. For [H.patron] has led me to who I am tonight.")
	if(H.dna.species.id == "human")
		if(H.gender == "male")
			H.dna.species.soundpack_m = new /datum/voicepack/male/assassin()
		else
			H.dna.species.soundpack_f = new /datum/voicepack/female/assassin()
