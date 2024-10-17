/datum/advclass/combat/abyssariad/mastersohei
	name = "Jushoku Sohei"
	tutorial = "High-ranking Sohei who hold authority within multiple temples and Soheis retainers within their influence. \
	Often in charge of militant activities, these senior soheis are in search of demonic corruption to dismantle - \
	or involve themselves in spiritual matters with a iron fist."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Kitsune",
		"Tengu",
		"Oni",
		"Kappa"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/mastersohei
	maximum_possible_slots = 1
	pickprob = 100
	category_tags = list(CTAG_ADVENTURER)
	vampcompat = FALSE

/datum/outfit/job/roguetown/adventurer/abyssariad/mastersohei/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon
	wrists = /obj/item/clothing/neck/roguetown/psicross/abyssor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	id = /obj/item/clothing/ring/silver
	cloak = /obj/item/clothing/cloak/odoshisohei
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	gloves = /obj/item/clothing/gloves/roguetown/chain/kikko
	backl = /obj/item/rogueweapon/halberd/bisento
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("speed", -2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	//Paladins, while devout warriors spent WAY too much time studying the blade. No more acolyte+
	C.update_devotion(50, 50)
	C.holder_mob = H
	C.grant_spells_templar(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/churn)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)