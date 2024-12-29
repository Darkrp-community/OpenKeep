/datum/advclass/mercenary/steppesman
	name = "Steppesman Archer"
	tutorial = "A mercenary from hailing from the wild frontier steppes. There are three things you value most; saigas, freedom, and coin they use a bow for quick attacks alongside a sabre for close encounters"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/mercenary/steppesman
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 5

	cmode_music = 'sound/music/combat_steppe.ogg'

/datum/outfit/job/roguetown/mercenary/steppesman/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	head = /obj/item/clothing/head/roguetown/papakha
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather/mercenary/black
	armor = /obj/item/clothing/suit/roguetown/armor/leather/splint
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/rogueweapon/sword/sabre
	beltl= /obj/item/quiver/arrows
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	pants = /obj/item/clothing/under/roguetown/tights/red
	neck = /obj/item/clothing/neck/roguetown/coif//some light neck and head armor
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/knife/hunting = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)
	if(H.mind)//quick fighter that has Dodge Expert and a bow for ranged attacks, 4 weapon skills
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.change_stat("perception", 1)
	H.change_stat("constitution", 1)
	H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
