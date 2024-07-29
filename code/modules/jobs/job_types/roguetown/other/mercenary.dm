/datum/job/roguetown/mercenary
	title = "Mercenary"
	flag = GRAVEDIGGER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

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
	tutorial = "How much blood is on your hands? Do you even see it when they line your palms with golden treasures? Youre a paid killer, the only redeemable fact is that your loyalty is something purchasable, but even a whore has dignity compared to the likes of you. Another day, another mammon, youd say."
	display_order = JDO_MERCENARY
	bypass_lastclass = TRUE
	give_bank_account = 3
	min_pq = 0
	outfit = null
	outfit_female = null
	advclass_cat_rolls = list(CTAG_MERCENARY = 20)

/datum/job/roguetown/mercenary/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
