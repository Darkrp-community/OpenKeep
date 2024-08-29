/datum/advclass/combat/zamuraimelee
	name = "Zamurai Vanguard"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/zamuraimelee
	maxchosen = 2
	isvillager = FALSE
	tutorial = "The aristocratic zamurai serving the Warrior caste, now reaching the outskirts during expeditions. Focused in invading strongholds, they no longer use their steed for sieges. They must uphold their oficial duties and following the strict martial code of the Abyssal Tide."

/datum/outfit/job/roguetown/adventurer/zamuraimelee/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	pants = /obj/item/clothing/under/roguetown/kaizoku/haidate_tatami
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/suneate
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/plate/oyoroi
	wrists = /obj/item/clothing/wrists/roguetown/kaizoku/kote
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	face = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	backr = 
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword/short/wakizashi
	beltl = /obj/item/rogueweapon/sword/uchigatana
	head = /obj/item/clothing/head/roguetown/kaizoku/zunari
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/fingerless

	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 2)
	H.change_stat("constitution", 1) 
	H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)