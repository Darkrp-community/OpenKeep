
/datum/advclass/combat/vaquero
	name = "Vaquero"
	tutorial = "Vaquero are Tieberian swashbucklers who have their origins as skilled horse-tamers of Asturia. It's hard to find horses these days..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Tiefling")
	outfit = /datum/outfit/job/roguetown/adventurer/vaquero
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled
	cmode_music = 'sound/music/combat_vaquero.ogg'
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 1
	pickprob = 50
	maximum_possible_slots = 1

/datum/advclass/combat/vaquero/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()

/datum/outfit/job/roguetown/adventurer/vaquero/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/bardhat
	shoes = /obj/item/clothing/shoes/roguetown/boots
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/red
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/sword/rapier
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	H.change_stat("speed", 3)
