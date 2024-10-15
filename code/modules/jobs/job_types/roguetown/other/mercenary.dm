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
	tutorial = "<br>Blood stained hands, do you even see it when they line your palms with golden treasures?  <br><br>\
	You are a paid killer, redeemable only by fact that your loyalty can be bought,  \
	gold is the great hypocritical lubricant in life, founding empires, driving brothers to kill one another.  <br><br>\
	You care not. Another day, another mammon - your sponsor, the Merchant of the MGE guild should have work for you todae.<br>"
	display_order = JDO_MERCENARY
	bypass_lastclass = TRUE
	give_bank_account = 3
	min_pq = 2
	outfit = null
	outfit_female = null

/datum/job/roguetown/mercenary/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")
		H.Stun(100)
		if(!H.possibleclass)
			H.possibleclass = list()
		if(!H.special_classes)
			H.special_classes = list()
		var/list/classes = GLOB.adv_classes.Copy()

		for(var/I in classes)
			var/datum/advclass/mercenary/A = I

			if(!A.ismerc)
				continue

			if(!(H.dna.species.name in A.allowed_races))
				testing("[A.name] had a different required race")
				continue

			if(A.maxchosen > -1)
				if(A.amtchosen >= A.maxchosen)
					testing("[A.name] had max chosen classes")
					continue

/*			if(A.min_pq > get_playerquality(H.ckey))
				testing("player PQ was not high enough") */

			testing("[A.name] added to possible classes")
			H.possibleclass += A

/mob/living/carbon/human/proc/mercsetup()
	if(!advsetup)
		testing("MERC")
		return TRUE

	if(possibleclass.len)
		var/datum/advclass/C = input(src, "What is my class?", "Mercenary") as null|anything in sortNames(possibleclass)
		testing("class select started")
		if(C && advsetup)
			if(C.maxchosen > -1)
				for(var/datum/advclass/mercenary/A in GLOB.adv_classes)
					if(A.type == C.type)
						if(A.amtchosen >= A.maxchosen)
							possibleclass-= C
							to_chat(src, "<span class='warning'>Not enough slots for [C] left! Choose something different.</span>")
							return FALSE
						else
							A.amtchosen++
			if(alert(src, "[C.name]\n[C.tutorial]", "Are you sure?", "Yes", "No") != "Yes")
				return FALSE
			if(advsetup)
				advsetup = 0
				C.equipme(src)
				invisibility = 0
				cure_blind("advsetup")
				return TRUE
	else
		testing("MERC2")
		advsetup = 0
		invisibility = 0
		cure_blind("advsetup")
		return TRUE

// terribly sinful but here temporary so can push ahead since extended testmerge purgatory
/area/rogue/indoors/soilsons
	name = "soilsons"
