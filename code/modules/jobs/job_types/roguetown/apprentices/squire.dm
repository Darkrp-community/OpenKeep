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

	tutorial = "You've always had greater aspirations than the simple life of a peasant. You and your friends practiced the basics, swordfighting with sticks and loosing arrows into hay bale targets. The Royal Guard took notice of your potential, and recruited you as a personal ward. Learn from your protector and train hard... maybe one dae you will be honored with knighthood."

	display_order = JDO_SQUIRE
	bypass_lastclass = TRUE

	outfit = /datum/outfit/job/roguetown/squire	//Default outfit.
	advclass_cat_rolls = list(CTAG_SQUIRE = 20)	//Handles class selection.
	give_bank_account = TRUE
	min_pq = 0

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/squire
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	pants = /obj/item/clothing/under/roguetown/tights
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather

	H.virginity = TRUE
	if(H.gender == MALE && H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/squire()

/* ! ! ! Class Selection Section Below ! ! !
Design philosphy:
- Swords Training, specializes in handling swords. - Light armor
- Spear Training, specializes in handling a spear. - Light armor
- Flail Training, specializes in handling a flail. - Light armor
*/

/datum/advclass/squire/swordsman
	name = "Swordsman Squire"
	tutorial = "Your training has been singularly focused on the intricacies of the sword, a weapon whose versatility belies the difficulty of its use."
	outfit = /datum/outfit/job/roguetown/squire/swordsman
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/swordsman/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/clothing/neck/roguetown/chaincoif
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_INTRAINING, TRAIT_GENERIC) // An exception to the average combat skill cap on training dummies, since we are a combat role in training... we can get up to skilled! Hooray!

	var/weapontype = pickweight(list("Iron Sword" = 7, "Steel Sword" = 3)) // Rolls for either an iron or steel sword
	switch(weapontype)
		if("Iron Sword")
			beltr = /obj/item/rogueweapon/sword/iron
		if("Steel Sword")	
			beltr = /obj/item/rogueweapon/sword

/datum/advclass/squire/lancer
	name = "Lancer Squire"
	tutorial = "A hopeful for the next generation of knightly mounted lancers and infantry pike specialists, your training with polearms sets you apart from other squires."
	outfit = /datum/outfit/job/roguetown/squire/lancer
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/lancer/pre_equip(mob/living/carbon/human/H)
	r_hand = /obj/item/rogueweapon/spear
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/clothing/neck/roguetown/chaincoif
	)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_INTRAINING, TRAIT_GENERIC) // An exception to the average combat skill cap on training dummies, since we are a combat role in training... we can get up to skilled! Hooray!

/datum/advclass/squire/flail
	name = "Flailman of the Realm"
	tutorial = "Your training with a flail was an indication of a squires that was not mainstream at all. This weapon, beautiful in its chaotic grace, has a certain appeal and requires not only brawn, but as well as suppleness and accuracy that makes the path to mastery quite arduous."
	outfit = /datum/outfit/job/roguetown/squire/flail
		
	category_tags = list(CTAG_SQUIRE)

/datum/outfit/job/roguetown/squire/flail/pre_equip(mob/living/carbon/human/H)
	beltr = /obj/item/rogueweapon/flail/sflail
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/clothing/neck/roguetown/chaincoif,
		)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_INTRAINING, TRAIT_GENERIC) // An exception to the average combat skill cap on training dummies, since we are a combat role in training... we can get up to skilled! Hooray!
