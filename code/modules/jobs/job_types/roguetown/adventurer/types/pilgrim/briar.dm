/datum/advclass/pilgrim/briar
	name = "Briar"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen",
	"Elf",
	"Dwarf",
	"Half-Elf",
	)
	outfit = /datum/outfit/job/roguetown/adventurer/briar
	category_tags = list(CTAG_PILGRIM)
//	allowed_patrons = list(/datum/patron/divine/dendor)		this doesn't work so long its a subclass type

/datum/outfit/job/roguetown/adventurer/briar/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)

	belt = /obj/item/storage/belt/rogue/leather/rope
	head = /obj/item/clothing/head/roguetown/padded/briarthorns
	neck = /obj/item/clothing/neck/roguetown/psycross/silver/dendor
	shirt = /obj/item/clothing/suit/roguetown/armor/leather/vest
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltl = /obj/item/rogueweapon/huntingknife/stoneknife
	backl = /obj/item/rogueweapon/mace/goden/shillelagh

	H.change_stat("strength", 1)
	H.change_stat("intelligence", -1)

	if(H.mind)
		if(H.patron != /datum/patron/divine/dendor)
			H.patron = GLOB.patronlist[/datum/patron/divine/dendor]

		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/taming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)

		// the unique Dendor crafting recipes. Dendor shrines (pantheon cross) and alt cosmetic helmet
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/dendor_visage)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/dendor_shrine)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/dendor_shrine/volf)

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	C.holder_mob = H
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)

/datum/outfit/job/roguetown/adventurer/briar
	var/tutorial = "<br><br><font color='#44720e'><span class='bold'>Stoic gardeners or flesh-eating predators all can follow Dendors path. <br>His Briars scorn civilized living, many embracing their animal nature, being fickle and temperamental.</span></font><br><br>"

/datum/outfit/job/roguetown/adventurer/briar/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, tutorial)


/*	.................   Unique Dendor recipes   ................... */
/datum/crafting_recipe/dendor_visage
	name = "Dendor Visage"
	time = 7 SECONDS
	reqs = list(/obj/item/grown/log/tree/small = 1)
	result = /obj/item/clothing/head/roguetown/padded/briarvisage
	craftdiff = 0
	category = CAT_NONE

/datum/crafting_recipe/dendor_shrine
	name = "Shrine to Dendor"
	time = 7 SECONDS
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/saiga = 1)
	result = /obj/structure/fluff/psycross/crafted/dendor_saiga
	verbage = "consecrate"
	verbage_tp = "consecrates"
	craftsound = 'sound/foley/Building-01.ogg'
	craftdiff = 0
	category = CAT_NONE

/datum/crafting_recipe/dendor_shrine/volf
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/thorn = 3,
				/obj/item/natural/head/volf = 1)
	result = /obj/structure/fluff/psycross/crafted/dendor_volf

