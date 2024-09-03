/datum/advclass/combat/swordmaster
	name = "Swordmaster"
	tutorial = "You spent years serving the eastern Grenzelhoftian lords, and now you spend your days as a travelling hedge knight. Upon this island, you like to increase the fame of your sword skills, as well as your honor."
	allowed_sexes = list(MALE)
	allowed_races = list("Humen")
	outfit = /datum/outfit/job/roguetown/adventurer/swordmaster
	maximum_possible_slots = 1
	min_pq = 2
	pickprob = 15
	category_tags = list(CTAG_ADVENTURER)


/datum/outfit/job/roguetown/adventurer/swordmaster/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 2)
		H.change_stat("speed", -1)
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Retter"
		if(H.gender == FEMALE)
			honorary = "Retterin"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

	pants = /obj/item/clothing/under/roguetown/tights/black
	backr = /obj/item/rogueweapon/greatsword/flamberge
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/roguetown/boots/rare/grenzelplate
	gloves = /obj/item/clothing/gloves/roguetown/rare/grenzelplate
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/rare/grenzelplate
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/rare/grenzelplate
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(!H.has_language(/datum/language/oldpsydonic))
		H.grant_language(/datum/language/oldpsydonic)
		to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.patron = GLOB.patronlist[/datum/patron/forgotten] // SCREAM IF YOU LOVE THE FORGOTTEN GOD
