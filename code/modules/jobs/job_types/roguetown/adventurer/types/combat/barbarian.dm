/datum/advclass/combat/barbarian
	name = "Barbarian"
	tutorial = "Wildmen and warriors all, Barbarians embody the fiercest and most primal aspect of Ravox. Raw strength and brutal cunning makes them excellent fighters but poorly adjusted to the civilized, docile lands of lords and ladies."
	allowed_sexes = list(MALE)
	allowed_races = list(
		"Humen",
		"Half-Elf",
		"Tiefling"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/barbarian
	min_pq = 0
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_barbarian.ogg'

/datum/outfit/job/roguetown/adventurer/barbarian/pre_equip(mob/living/carbon/human/H)
	..()

	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	var/armortype = pickweight(list("Cloak" = 5, "Hide" = 3, "Helmet" = 2))
	var/weapontype = pickweight(list("Sword" = 4, "Club" = 3, "Axe" = 2)) //clubs and axes share a weapon type
	switch(armortype)
		if("Cloak")
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
		if("Hide")
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
		if("Helmet")
			head = /obj/item/clothing/head/roguetown/helmet/horned
	switch(weapontype)
		if("Sword")
			beltr = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		if("Club")
			beltr = /obj/item/rogueweapon/mace/goden/shillelagh
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		if("Axe")
			beltr = /obj/item/rogueweapon/axe/iron
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)

	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)
	H.change_stat("intelligence", -2)

	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)

	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/barbrage)
	if(H.dna?.species)
		H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
	if(H.patron != /datum/patron/divine/ravox)
		H.set_patron(/datum/patron/divine/ravox)
