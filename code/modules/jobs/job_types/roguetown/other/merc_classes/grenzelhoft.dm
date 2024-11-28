/datum/advclass/mercenary/grenzelhoft
	name = "Grenzelhoftter Greatswordsman"
	tutorial = "A mercenary from the Grenzelhoft Empire's Mercenary Guild. Their only care is coin, and the procurement of coin, they use a heavy iron zweihander as a main weapon, aim well... every devastating hit with this heavy weapon."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Dwarf"
	)
	outfit = /datum/outfit/job/roguetown/mercenary/grenzelhoft
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 4

	cmode_music = 'sound/music/combat_grenzelhoft.ogg'

/datum/outfit/job/roguetown/mercenary/grenzelhoft/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)//big weapon user that can interchange for a mace/shield, 4 weapon skills, warrior has 7 skills
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)	//Big sword user so - really helps them.
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE) // Equal chance between skilled and average, can use a cudgel to beat less dangerous targets into submission
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)//so they can heal themselves, after all they didn't survived the mercenary life without know how to sew their wounds

	if(H.gender == FEMALE)
		H.underwear = "Femleotard"
		H.underwear_color = CLOTHING_SOOT_BLACK
		H.update_body()

	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
	pants = /obj/item/clothing/under/roguetown/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzel
	belt = /obj/item/storage/belt/rogue/leather/mercenary
	beltl = /obj/item/rogueweapon/mace/cudgel
	shirt = /obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	head = /obj/item/clothing/head/roguetown/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/suit/roguetown/armor/cuirass/grenzelhoft
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/sword/long/greatsword/zwei
	if(!H.has_language(/datum/language/oldpsydonic))
		H.grant_language(/datum/language/oldpsydonic)
		to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")

	H.change_stat("strength", 2) // They need this to roll at least min STR for the Zwei.
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.set_patron(/datum/patron/forgotten) // SCREAM IF YOU LOVE THE FORGOTTEN GOD
