/datum/advclass/combat/zamurai //Not going to give this a PQ minimum since all Abyssariad races have min_pq
	name = "Zamurai"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/zamurai
	maximum_possible_slots = 1 
	pickprob = 15 
	tutorial = "The aristocratic zamurai serving the Warrior caste that became adrift during a expedition, losing some equipments but keeping their trusty steed. They must uphold their oficial duties and following the strict martial code of the Abyssal Tide."
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled

/datum/outfit/job/roguetown/adventurer/zamurai/pre_equip(mob/living/carbon/human/H)
	H.become_blind("TRAIT_GENERIC")
	var/zamuraitype = list("Odashibushi(Melee)","Yumibushi(Ranged)")
	var/specialization = input("Choose your Specialization", "Available Specialization") as anything in zamuraitype
	switch(specialization)
		if("Odashibushi(Melee)") //Not as sword-specialized as Swordmaster, but have better armor.
			H.set_blindness(0)
			pants = /obj/item/clothing/under/roguetown/tobi/random //Fully intended to give them Haidate Tatami, but the armor is strong enough already.
			backr = /obj/item/rogueweapon/greatsword/odachi //Less durable than the Swordmaster's weapon. But can be crafted.
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/suneate
			gloves = /obj/item/clothing/gloves/roguetown/leather/abyssal //kote already protects the hands.
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare //weaker gambeson. Has way more DRIP. (Doesn't matter for balance, shutup)
			armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi //Paying off for 4 swordskill instead of 5.
			head = /obj/item/clothing/head/roguetown/helmet/visored/knight/zunari //fucking-shit-up knight helmet tier. Sacrificed some to keep that one.
			wrists = /obj/item/clothing/wrists/roguetown/bracers/kote //Cooler Bracer that protects the hands.
			neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
			to_chat(H, span_warning( "<span class='info'>I am a Storm-hardened warrior in lacquered armor. If Abyssor wills it, I will become a Champion once more as the old times.</span>"))

			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE) //4 instead of 5. Abyssariads with 5 are champions only.
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
				H.change_stat("strength", 2)
				H.change_stat("endurance", 2)
				H.change_stat("constitution", 2)
				H.change_stat("speed", -1)

		if("Yumibushi(Ranged)") // Ranged Focus. Somewhat balanced over Sentinel.
			H.set_blindness(0)
			pants = /obj/item/clothing/under/roguetown/tobi/random
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/long/yumi
			beltl = /obj/item/quiver/arrows
			shoes = /obj/item/clothing/shoes/roguetown/nobleboot/gutal
			gloves = /obj/item/clothing/gloves/roguetown/angle
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/random
			shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare //weaker gambeson. Has way more DRIP. (Doesn't matter for balance, shutup)
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
			beltr = /obj/item/rogueweapon/sword/uchigatana
			head = /obj/item/clothing/head/roguetown/helmet/kettle/jingasa
			mask = /obj/item/clothing/mask/rogue/kaizoku/menpo/steel
			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/riding, 5, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
				H.change_stat("perception", 2)
				H.change_stat("speed", 2)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.cure_blind("TRAIT_GENERIC")


/*
/datum/advclass/combat/zamurai/equipme(mob/living/carbon/human/H)
	if(mounted == 1)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	else 
		return ..()
	return ..()
*/