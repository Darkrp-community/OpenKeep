/*
	It'd prob be a good idea to fill out a entire roster of bandits
	For now tho you got this cause I don't feel like reworking the shit ass gamemode yet
	The antag would also have to be touched as it loads out all the gear attached to the datum lol
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	yeah it's unused it broke lol haha oooooooooo haha
*/
/datum/advclass/bandit
	name = "Bandit"
	tutorial = "A person living in service of the god Matthios, through theft and social woes can ones suffering be alleviated."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/bandit
	category_tags = list(CTAG_ANTAG, CTAG_BANDIT, CTAG_ADVENTURER)
	maximum_possible_slots = 1

/datum/outfit/job/roguetown/adventurer/bandit/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/roguetown/adventurer/bandit/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
	H.mind.add_antag_datum(new_antag)

