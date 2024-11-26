/datum/job/roguetown/lord
	title = "King"
	flag = LORD
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 1

	f_title = "Queen"
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf"
	)
	outfit = /datum/outfit/job/roguetown/lord
	display_order = JDO_LORD
	tutorial = "Elevated to your throne by a web of intrigue, you are the absolute authority of this island and at the center of every plot within it. All are envious of your position and would replace you in less than a heartbeat; show them the error of their ways."
	bypass_lastclass = TRUE
	whitelist_req = FALSE
	min_pq = 4
	give_bank_account = 500
	selection_color = "#7851A9"

	cmode_music = 'sound/music/combat_noble.ogg'

/datum/job/roguetown/lord/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		SSticker.select_ruler()
		to_chat(world, "<b><span class='notice'><span class='big'>[L.real_name] is Ruler of Rockhill.</span></span></b>")
		to_chat(world, "<br>")
		addtimer(CALLBACK(L, TYPE_PROC_REF(/mob, lord_color_choice)), 50)
	if(L.gender == MALE)
		SSfamilytree.AddRoyal(L, FAMILY_FATHER)
	else
		SSfamilytree.AddRoyal(L, FAMILY_MOTHER)

/datum/outfit/job/roguetown/lord/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/crown/serpcrown
	cloak = /obj/item/clothing/cloak/lordcloak
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/plaquegold
	backpack_contents = list(/obj/item/rogueweapon/knife/dagger/steel/special = 1)
	id = /obj/item/clothing/ring/active/nomag
	l_hand = /obj/item/rogueweapon/lordscepter
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("intelligence", 3)
		H.change_stat("endurance", 3)
		H.change_stat("speed", 1)
		H.change_stat("perception", 2)
		H.change_stat("fortune", 5)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/arming
		shoes = /obj/item/clothing/shoes/roguetown/boots
		if(H.dna?.species)
			if(H.dna.species.id == "human")
				H.dna.species.soundpack_m = new /datum/voicepack/male/evil()
	else
		pants = /obj/item/clothing/under/roguetown/tights/stockings/silk/random
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt
		shoes = /obj/item/clothing/shoes/roguetown/shortboots

		if(H.wear_mask)
			if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/mask/rogue/lordmask
			if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/eyepatch/left))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/mask/rogue/lordmask/l

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
//	SSticker.rulermob = H
