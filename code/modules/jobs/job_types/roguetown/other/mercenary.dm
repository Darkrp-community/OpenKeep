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
		"Half-Elf",
		"Elf",
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

/datum/job/roguetown/mercenary/after_spawn(mob/living/L, mob/M)
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
		testing("RETARD")
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
		testing("RETARD2")
		advsetup = 0
		invisibility = 0
		cure_blind("advsetup")
		return TRUE
