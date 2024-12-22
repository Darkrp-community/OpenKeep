/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = APPRENTICES
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf"
	)
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)

	tutorial = "You've always had greater aspirations than the simple life of a peasant. You and your friends practiced the basics, swordfighting with sticks and loosing arrows into hay bale targets. The Captain took notice of your potential, and recruited you as a personal ward. Learn from the garrison and train hard... maybe one dae you will be honored with knighthood."

	outfit = /datum/outfit/job/roguetown/squire
	display_order = JDO_SQUIRE
	give_bank_account = TRUE
	min_pq = 0
	bypass_lastclass = TRUE
	selection_color = "#6b8063"

/datum/outfit/job/roguetown/squire/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/rogue/pouch
	beltl = /obj/item/keyring/mguard
	backr = /obj/item/storage/backpack/rogue/satchel
	pants = /obj/item/clothing/under/roguetown/tights
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/sword/iron

/datum/outfit/job/roguetown/squire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

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
