///uhhh temporarily makes bandits into a drifter class for now
///this just exists for giving them the status of bandit, they will pick their actual bandit class in a bit.

/datum/advclass/combat/bandit
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
	maximum_possible_slots = 4
	category_tags = list(CTAG_ADVENTURER, CTAG_BANDIT)
	pickprob = 100

/datum/outfit/job/roguetown/adventurer/bandit/pre_equip(mob/living/carbon/human/H)
	..()

/datum/outfit/job/roguetown/adventurer/bandit/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	if(!HAS_TRAIT(H, TRAIT_VILLAIN)) //just incase a vampirelord gets this...
		var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
		H.mind.add_antag_datum(new_antag)
	else
		H.equipOutfit(/datum/outfit/job/roguetown/adventurer/sfighter)

