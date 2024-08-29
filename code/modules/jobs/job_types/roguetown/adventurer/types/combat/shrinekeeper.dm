//Call this bloat as you want, but I'm not going to allow the Abyssariad's identity to break away with the Ravoxian type. 
//Yes. This is the Abyssariad version of the Monk. Praise Abyssor.

/datum/advclass/combat/abyssariad/shrinekeepers
	name = "Shrinekeeper"
	allowed_sexes = list(MALE, FEMALE)
	tutorial = "The shrines needs to be cared of, and there is no one most suitable for such duty than the purifier branch. They perform rituals to submit demonic spirits just as much they submit mortals with martial arts."
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/shrinekeepers
	category_tags = list(CTAG_ADVENTURER)
	vampcompat = FALSE

/datum/outfit/job/roguetown/adventurer/abyssariad/shrinekeepers
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/adventurer/monk/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/takuhatsugasa
	neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/geta
	cloak = /obj/item/clothing/cloak/raincloak/mino
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/rogueweapon/woodstaff/bostaff
    shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/monkgarb

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(1,1,2), TRUE) // Wood staff
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/carpentry, 1, TRUE) //They lose 'Medicine' to have 'Carpetry', because Shrinekeepers... make shrines.
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(2,2,3), TRUE)

		H.change_stat("strength", 3)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("perception", -1)
		H.change_stat("speed", 1)
		
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		
	if(H.patron != /datum/patron/divine/abyssor)
		H.patron = GLOB.patronlist[/datum/patron/divine/abyssor]
		to_chat(H, "<span class='warning'>I am a Abyssanctum, loyal to The World Whale. May the tides of fate guide me to honor.")