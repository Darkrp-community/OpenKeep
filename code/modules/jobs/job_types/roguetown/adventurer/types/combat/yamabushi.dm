/datum/advclass/combat/yamabushi
	name = "Yamabushi"
	tutorial = "The Yamabushi are battle ready religious figures of the Abyssanctum faith, one with the Curator Branch. They safeguard knowledge and take care of the living, focused on betterment of society as a whole."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/yamabushi
	ispilgrim = FALSE

/datum/outfit/job/roguetown/adventurer/yamabushi/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.PATRON != /datum/patrongods/abyssor)
		H.PATRON = GLOB.patronlist["Abyssor"]
		to_chat(H, "<span class='warning'>I am a Abyssanctum, loyal to The World Whale. May the tides of fate guide me to honor.")
	neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
	if(prob(40))
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/plate
	else if(prob(20))
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/plate/cuirass/steel
	else
		armor =	/obj/item/clothing/suit/roguetown/armor/kaizoku/chainmail
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/hakama
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/kaizoku/big/tengai/yamabushi
	else if(prob(40))
		head = /obj/item/clothing/head/roguetown/kaizoku/big/sandogasa/yamabushi
	else
		head = /obj/item/clothing/head/roguetown/kaizoku/helmet/hachigane
	if(prob(40))
		beltr = /obj/item/rogueweapon/mace/cudgel/ararebo
		beltl = /obj/item/rogueweapon/thrown/ono
	else if(prob(20))
		backr = /obj/item/rogueweapon/mace/goden/kanabo
	else
		backr = /obj/item/rogueweapon/mace/warhammer/otsuchi
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("perception", -2)
		H.change_stat("intelligence", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 3)
		H.change_stat("speed", -1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/lesser_healz)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/healz)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/attach_bodypartz)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/revivez)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.PATRON)
	C.holder_mob = H
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
