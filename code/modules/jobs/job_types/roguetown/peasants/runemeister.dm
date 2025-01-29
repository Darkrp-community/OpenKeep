/datum/job/roguetown/runemeister
	title = "Runemeister"
	flag = RUNEMEISTER
	department_flag = MAKERS_GUILD
	faction = "Station"
	total_positions = 0
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "Dwarven technology is finicky, fragile and incredibly complex to the average denizen of Rockhill - thankfully, the Runemeister has dedicated their livelihood to its study. Construction of new SCOMs and installations of other logistical devices are costly but otherwise worthwhile for expansion sakes. Furthermore, maintenance and enchanting modification on equipment is a specialty for this master-rune maker." // changed to reduce dictation of character. Nikov.

	outfit = /datum/outfit/job/roguetown/runemeister
	display_order = JDO_PRISONER
	give_bank_account = 173
	min_pq = -100
	can_random = FALSE
	bypass_lastclass = TRUE

	cmode_music = 'sound/music/combat_bum.ogg'

/datum/outfit/job/roguetown/runemeister/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	mask = /obj/item/clothing/mask/rogue/facemask/prisoner
	if(H.wear_mask)
		var/obj/I = H.wear_mask
		H.dropItemToGround(H.wear_mask, TRUE)
		qdel(I)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE) // given Noble trait. N.
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE) // given Noble trait. N.
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE) // per suggestion. N.
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE) // given Noble trait it makes no sense they were illiterate. N.
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE) // per suggestion. N.
		H.change_stat("strength", -1) // Malnutrition. N.
		H.change_stat("perception", 2) // Few distractions, idle mind, focused senses. N.
		H.change_stat("intelligence", 2) // Given Noble trait it makes no sense they are idiots. N.
		H.change_stat("speed", -1)
		H.change_stat("constitution", -1)
		H.change_stat("endurance", -1)
