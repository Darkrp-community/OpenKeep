/datum/advclass/pilgrim/briar
	name = "Briar"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen",
	"Elf",
	"Dwarf",

	)
	outfit = /datum/outfit/job/roguetown/adventurer/briar
	category_tags = list(CTAG_PILGRIM)
	allowed_patrons = list(/datum/patron/divine/dendor)


/datum/outfit/job/roguetown/adventurer/briar/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/rogue/leather/rope
	head = /obj/item/clothing/head/roguetown/dendormask
	neck = /obj/item/clothing/neck/roguetown/psycross/silver/dendor
	shirt = /obj/item/clothing/suit/roguetown/armor/leather/vest
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltl = /obj/item/rogueweapon/huntingknife/stoneknife

	var/obj/item/rogueweapon/mace/goden/shillelagh/P = new()
	H.put_in_hands(P, forced = TRUE)

	H.change_stat("strength", 1)
	H.change_stat("intelligence", -1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/taming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 4, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)


	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)


