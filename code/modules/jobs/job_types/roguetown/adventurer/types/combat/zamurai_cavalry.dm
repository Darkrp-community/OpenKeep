/datum/advclass/combat/zamurai
	name = "Zamurai Cavalry"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/zamurai
	maxchosen = 2
	isvillager = FALSE
	tutorial = "The aristocratic zamurai serving the Warrior caste that became adrift during a expedition, losing some equipments but keeping their trusty steed. They must uphold their oficial duties and following the strict martial code of the Abyssal Tide."
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled

/datum/advclass/combat/zamurai/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()

/datum/outfit/job/roguetown/adventurer/zamurai/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	pants = /obj/item/clothing/under/roguetown/kaizoku/haidate_tatami
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/plate/oyoroi
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	neck = /obj/item/clothing/neck/roguetown/kaizoku/inodowa
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/quiver/arrows
	beltl = /obj/item/rogueweapon/sword/uchigatana
	head = /obj/item/clothing/head/roguetown/kaizoku/big/tosei_kabuto
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/mid=1)
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/fingerless

	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE) //You are used to be shooting bows on horseback. You ARE supposed to better at it than the average ranger.
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("perception", 3)
	H.change_stat("constitution", 2)
	H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

