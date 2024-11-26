/datum/job/roguetown/consort
	title = "Consort"
	flag = CONSORT
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf"
	)
	tutorial = "Yours was a marriage of political convenience rather than love, yet you have remained the ruling monarch's good friend and confidant throughout your marriage. But your love and loyalty will be tested, for daggers are equally pointed at your throat."

	outfit = /datum/outfit/job/roguetown/consort
	advclass_cat_rolls = list(CTAG_CONSORT = 20)

	display_order = JDO_CONSORT
	bypass_lastclass = TRUE
	min_pq = 4
	give_bank_account = 500

	cmode_music = 'sound/music/combat_noble.ogg'

/datum/job/roguetown/consort/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	H.advsetup = 1
	H.invisibility = INVISIBILITY_MAXIMUM
	H.become_blind("advsetup")
	if(L.gender == FEMALE)
		SSfamilytree.AddRoyal(L, FAMILY_MOTHER)
	else
		SSfamilytree.AddRoyal(L, FAMILY_FATHER)

/datum/outfit/job/roguetown/consort // Default equipment regardless of class.
	head = /obj/item/clothing/head/roguetown/crown/nyle
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	id = /obj/item/clothing/ring/silver
	beltl = /obj/item/keyring/consort
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich

/* ! ! ! CONSORT CLASSES ! ! !
- Highborn: The "default" class, a typical Enigman noble. Decent with swords and a knife. Can sew and read pretty good. A little squishy.
- Courtesan: Ex-classy or not-so-classy prostitute. Concerningly good with that knife and sneaking around. A little dumb.
- Peasant: A good wholesome peasant spouse. Can cook and swing a pitchfork good. Not so smart or perceptive.
- Zybantine: Mostly the same as the Highborn with bow skill instead of wrestling and unarmed.
*/

/datum/advclass/consort/highborn
	name = "Highborn"
	tutorial = "Of a minor noble house, yours is a rather typical tale; you were trained in manners, literature, and intrigue, all to be married off to the next ruler of this backwater island."
	outfit = /datum/outfit/job/roguetown/consort/highborn

/datum/outfit/job/roguetown/consort/highborn/pre_equip(mob/living/carbon/human/H)
	. = ..()
		if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/arming
		belt = /obj/item/storage/belt/rogue/leather
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		armor = pick(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress, /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt)
		belt = /obj/item/storage/belt/rogue/leather

	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 3)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 5)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/advclass/consort/courtesan
	name = "Courtesan"
	tutorial = "Though initially none envied your lot in life, it's certain that your midnight talents haven't gone to waste. Your honeyed words and charm have brought you right to being a ruler's beloved consort."
	outfit = /datum/outfit/job/roguetown/consort/courtesan

/datum/outfit/job/roguetown/consort/courtesan/pre_equip(mob/living/carbon/human/H)
	. = ..()
		if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/sea // this is kind of stupid but i love it anyway
		belt = /obj/item/storage/belt/rogue/leather
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		armor = pick(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress, /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt)
		belt = /obj/item/storage/belt/rogue/leather

	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE) // oh you know
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("intelligence", -1)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 3)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/advclass/consort/peasant
	name = "Peasant"
	tutorial = "You never could have dreamed your life would be like this. Though your origins are humble, something special about you - whether it was your good looks, your kind heart, or your bravery - has brought you into Rockhill Keep."
	outfit = /datum/outfit/job/roguetown/consort/peasant

/datum/outfit/job/roguetown/consort/peasant/pre_equip(mob/living/carbon/human/H)
	. = ..()
		if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/green
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/green
		belt = /obj/item/storage/belt/rogue/leather
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
		armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat
		belt = /obj/item/storage/belt/rogue/leather

	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("constitution", 2) // good old peasant constitution. in exchange for making them dumb, they will be STRONG.
	H.change_stat("intelligence", -2) // either a hapless dumbass, or just not educated
	H.change_stat("endurance", 3)
	H.change_stat("speed", -1)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/advclass/consort/zybantine
	name = "Zybantine Noble"
	tutorial = "Your family yearns to peruse the secrets of Enigma's magicks, and so you were wed to build an alliance between your Zybantine kingdom and the isle. Just like your family, you intend to make the most of this opportunity for learning, despite the circumstances."
	outfit = /datum/outfit/job/roguetown/consort/zybantine

/datum/outfit/job/roguetown/consort/zybantine/pre_equip(mob/living/carbon/human/H)
	. = ..()
		if(H.gender == MALE)
		neck = /obj/item/clothing/neck/roguetown/horus
		pants = /obj/item/clothing/under/roguetown/tights/red
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/arming
		belt = /obj/item/storage/belt/rogue/leather/shalal
	else
		neck = /obj/item/clothing/neck/roguetown/horus
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress
		belt = /obj/item/storage/belt/rogue/leather/shalal

	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
	if(H.age == AGE_OLD)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("endurance", 1)
	H.change_stat("perception", 3)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 5)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
