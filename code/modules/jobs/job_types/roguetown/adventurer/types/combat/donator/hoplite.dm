/datum/advclass/combat/hoplite
	name = "Immortal Bulwark"
	tutorial = "You have marched and fought in formations since the ancient war that nearly destroyed Grimoria. There are few in the world who can match your expertise in a shield wall, but all you have ever known is battle and obedience..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Aasimar")
	outfit = /datum/outfit/job/roguetown/adventurer/hoplite
	maximum_possible_slots = 1
	pickprob = 10 // Very, very rare and limited to one
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 5 // It's a pretty powerful class. Given bladesinger requires pq of 2, this seems reasonable


/datum/outfit/job/roguetown/adventurer/hoplite/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/shields, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 2)
		H.change_stat("intelligence", -2) // No thinking, good soldiers follow orders
		H.change_stat("speed", -1) // In for the long march... not a sprinter

	// Despite extensive combat experience, this class is exceptionally destitute. The only luxury besides combat gear that it possesses is a lantern for a source of light
	// Beneath the arms and armor is a simple loincloth, and it doesn't start with any money. This should encourage them to find someone to serve or work alongside with very quickly
	pants = /obj/item/clothing/under/roguetown/loincloth/brown
	beltl = /obj/item/rogueweapon/sword/khopesh
	beltr = /obj/item/flashlight/flare/torch/lantern
	shoes = /obj/item/clothing/shoes/roguetown/hoplite
	belt = /obj/item/storage/belt/rogue/leather/rope
	armor = /obj/item/clothing/suit/roguetown/armor/rare/hoplite
	head = /obj/item/clothing/head/roguetown/rare/hoplite
	wrists = /obj/item/clothing/wrists/roguetown/bracers/hoplite
	neck = /obj/item/clothing/neck/roguetown/gorget/hoplite

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
