//elf spear mounted

/datum/advclass/combat/rare/sentinel
	name = "Sentinel"
	tutorial = "Your elvish overseers have sent you to this distant island as a forward scout for future expansion. Ensure the prosperity of your people and warden over them with justice and firm rulings. Your steed will carry you through any challenges ahead."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Elf",
		"Half-Elf",
		"Dark Elf"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/sentinel
	maxchosen = 1
	israre = TRUE
	plevel_req = 1
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled

/datum/advclass/combat/vaquero/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()


/datum/outfit/job/roguetown/adventurer/sentinel/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 5, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", 4)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
	else
		pants = /obj/item/clothing/under/roguetown/tights
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long
	beltl = /obj/item/quiver/arrows
	shoes = /obj/item/clothing/shoes/roguetown/ridingboots
	gloves = /obj/item/clothing/gloves/roguetown/angle
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	backl = /obj/item/rogueweapon/spear
	head = /obj/item/clothing/head/roguetown/helmet/leather
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(prob(23))
		if(!H.has_language(/datum/language/elvish))
			H.grant_language(/datum/language/elvish)
			to_chat(H, "<span class='info'>I can speak Elfish with ,e before my speech.</span>")

	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
