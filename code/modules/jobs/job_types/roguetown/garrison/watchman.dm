/datum/job/roguetown/watchman
	title = "Gatekeeper"
	flag = WATCHMAN
	department_flag = GARRISON
	display_order = JDO_WATCHMAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	tutorial = "Like a hound on a leash, you stand vigilant for your masters. You live better than the rest of the taffers in this shithole -\
	infact, you take shifts keeping the savages out next to your only friend.It will be a cold day in hell when your better half is slain, and\
	nobody in this town will care. The nobility needs good men, and they only come in pairs."
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	allowed_sexes = list(MALE, FEMALE)

	outfit = /datum/outfit/job/roguetown/watchman
	cmode_music = 'sound/music/cmode/garrison/CombatGarrison.ogg'
	give_bank_account = 15
	min_pq = 2

/datum/outfit/job/roguetown/watchman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/kettle
	cloak = /obj/item/clothing/cloak/stabard/guard
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/manorguard
	beltr = /obj/item/rogueweapon/mace/cudgel
	backpack_contents = list(/obj/item/rogueweapon/knife/dagger/steel/special)
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", 2)
		H.change_stat("endurance", -3)
		H.change_stat("speed", -1)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
