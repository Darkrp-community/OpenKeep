/datum/job/roguetown/armorsmith
	title = "Armorer"
	flag = BLACKSMITH
	department_flag = MAKERS_GUILD
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)

	tutorial = "You studied for many decades under your master with a few other apprentices to become an Armorer, a trade that certainly has seen a boom in revenue in recent times with many a bannerlord seeing the importance in maintaining a well-equipped army."

	outfit = /datum/outfit/job/roguetown/armorsmith
	display_order = JDO_ARMORER
	bypass_lastclass = TRUE
	give_bank_account = 30
	min_pq = 0
	selection_color = "#d68e08"

/datum/outfit/job/roguetown/armorsmith/pre_equip(mob/living/carbon/human/H)
	..()
	id = /obj/item/clothing/ring/silver/makers_guild
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE) // For craftable beartraps
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, pick(1,2), TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, pick(1,2), TRUE)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/shortboots//shortboots for worker roles
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/keyring/armorsmith
		cloak = /obj/item/clothing/cloak/apron/brown
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	else
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/brown
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/keyring/armorsmith
		backl =	/obj/item/rogueweapon/hammer/sledgehammer
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)

/datum/job/roguetown/weaponsmith
	title = "Weaponsmith"
	flag = BLACKSMITH
	department_flag = MAKERS_GUILD
	faction = "Station"
	total_positions = 0
	spawn_positions = 0

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Aasimar"
	)

	tutorial = "You studied for many decades under your master with a few other apprentices to become a Weaponsmith, a trade that is as ancient as the secrets of steel itself! You've repaired the blades of cooks, the cracked hoes of peasants and greased the spears of many soldiers into war."

	outfit = /datum/outfit/job/roguetown/weaponsmith
	display_order = JDO_WSMITH
	give_bank_account = 30
	min_pq = 0
	selection_color = "#d68e08"

/datum/outfit/job/roguetown/weaponsmith/pre_equip(mob/living/carbon/human/H)
	..()
	id = /obj/item/clothing/ring/silver/makers_guild
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE) // For craftable beartraps
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, pick(1,2), TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, pick(1,2), TRUE)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/keyring/weaponsmith
		cloak = /obj/item/clothing/cloak/apron/brown
		backl =	/obj/item/rogueweapon/hammer/sledgehammer
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
	else
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/brown
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/keyring/weaponsmith
		H.change_stat("strength", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)


/datum/job/roguetown/blacksmith
	title = "Blacksmith"
	flag = BLACKSMITH
	department_flag = MAKERS_GUILD
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = ALL_PLAYER_RACES_BY_NAME

	tutorial = "You can smith armor and weapons alike with ease, but do not forget your apprentices. If nothing else, they can be used for errands or thrown out if bumbling fools. The masons next door are also part of the Makers Guild."

	outfit = /datum/outfit/job/roguetown/blacksmith
	display_order = JDO_ARMORER
	bypass_lastclass = TRUE
	give_bank_account = 30
	min_pq = 0
	selection_color = "#d68e08"

/datum/outfit/job/roguetown/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	id = /obj/item/clothing/ring/silver/makers_guild
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/smelting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE) // For craftable beartraps
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		ADD_TRAIT(H, TRAIT_MALUMFIRE, TRAIT_GENERIC)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather
	cloak = /obj/item/clothing/cloak/apron/brown
	backl =	/obj/item/rogueweapon/hammer/sledgehammer
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/keyring/blacksmith
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
	if(H.dna.species.id == "dwarf")
		H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE)
		H.cmode_music = 'sound/music/combat_dwarf.ogg'
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", -1)
