/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You've always had greater aspirations than the simple life of a peasant. You and your friends practiced the basics, swordfighting with sticks and loosing arrows into hay bale targets. The Captain took notice of your potential, and recruited you as a personal ward. Learn from the garrison and train hard... maybe one dae you will be honored with knighthood."

	display_order = JDO_SQUIRE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/squire	//Default outfit.
	advclass_cat_rolls = list(CTAG_SQUIRE = 20)	//Handles class selection.
	give_bank_account = TRUE
	min_pq = 0

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/squire
	pants = /obj/item/clothing/under/roguetown/tights
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	switch(pick(1,2,3))
		if (1)
			beltr = /obj/item/rogueweapon/mace/wsword
		if (2)
			beltr = /obj/item/rogueweapon/mace/copperbludgeon
		if (3)
			beltr = /obj/item/rogueweapon/copperdagger

	neck = /obj/item/storage/belt/rogue/pouch
	backr = /obj/item/storage/backpack/rogue/satchel
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard

/* ! ! ! Class Selection Section Below ! ! !
Design philosphy:
- Swords Training, specializes in handling swords. - Medium armor
- Spear Training, specializes in handling a spear. - Medium armor
- Flail Training, specializes in handling a flail. - Medium armor
*/

	ADD_TRAIT(H, TRAIT_INTRAINING, TRAIT_GENERIC) // An exception to the average combat skill cap on training dummies, since we are a combat role in training... we can get up to skilled! Hooray!
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	H.virginity = TRUE

	H.change_stat("perception", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)

	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()

/datum/advclass/squire/sword
	name = "Sword Training"
	tutorial = "You are a footman in the garrison levy. You are well versed in holding the line with a shield while wielding a trusty sword, axe, or mace in the other hand."
	outfit = /datum/outfit/job/roguetown/squire/sword

	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/sword/pre_equip(mob/living/carbon/human/H)
	..()
	//Gets a steel cuirass over chain, a gorget, and a nasal helmet
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/gorget
	head = /obj/item/clothing/head/roguetown/helmet
	backr = /obj/item/rogueweapon/shield/wood
	beltr = /obj/item/rogueweapon/sword/iron/messer
	beltl = /obj/item/rogueweapon/mace
	backpack_contents = list(/obj/item/keyring/guard)

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/datum/advclass/squire/spear
	name = "Spear Training"
	tutorial = "You are a pikeman in the garrison levy. You are less fleet of foot compared to the rest, but you are burly and well practiced with spears, pikes, billhooks - all the various polearms for striking enemies from a distance."
	outfit = /datum/outfit/job/roguetown/squire/spear

	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/spear/pre_equip(mob/living/carbon/human/H)
	..()
	//Gets chain over a gambeson, a gorget, and a kettle helmet
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	neck = /obj/item/clothing/neck/roguetown/gorget
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	beltr = /obj/item/rogueweapon/sword/iron/messer
	backpack_contents = list(/obj/item/keyring/guard)

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", -1) // Stronk and gets training in hard hitting polearms, but slower
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

	var/weapontype = pickweight(list("Spear" = 6, "Bardiche" = 4)) // Rolls for either a spear or a bardiche
	switch(weapontype)
		if("Spear")
			backr = /obj/item/rogueweapon/spear
		if("Bardiche")
			backr = /obj/item/rogueweapon/halberd/bardiche

/datum/advclass/squire/flail
	name = "Flail Training"
	tutorial = "You are an archer in the garrison levy. Your training with bows and crossbows makes you a formidable threat when perched atop the walls or rooftops, raining arrows or bolts down upon foes with impunity."
	outfit = /datum/outfit/job/roguetown/squire/flail

	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/flail/pre_equip(mob/living/carbon/human/H)
	..()
	//Gets a padded gambeson, leather bracers, and a chain coif
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	head = /obj/item/clothing/head/roguetown/roguehood/red
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/quiver/arrows
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/special
	backpack_contents = list(/obj/item/keyring/guard)

	//Stats for class
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("perception", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")
