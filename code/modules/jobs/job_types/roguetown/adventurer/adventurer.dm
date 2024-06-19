GLOBAL_LIST_EMPTY(billagerspawns)

/datum/job/roguetown/adventurer
	title = "Adventurer"
	flag = ADVENTURER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 0
	spawn_positions = 5
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "Hero of Nothing, Adventurer by trade. Whatever led you to this fate is up to the wind to decide, and youve never fancied yourself for much other than the thrill. Someday your pride is going to catch up to you, and youre going to find out why most men dont end up in the annals of history."


	outfit = null
	outfit_female = null

	var/isvillager = FALSE
	var/ispilgrim = FALSE
	var/israre = FALSE
	display_order = JDO_ADVENTURER
	show_in_credits = FALSE
	min_pq = -4

/datum/job/roguetown/adventurer/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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
		if(isvillager)
			GLOB.billagerspawns |= H

		for(var/I in classes)
			var/datum/advclass/A = I
					
			if(A.ismerc)
				continue

			if(isvillager) //towner
				if(!A.isvillager)
					continue

			if(!isvillager && !ispilgrim) //adventurer
				if(A.ispilgrim || A.isvillager)
					continue

			if(!(H.gender in A.allowed_sexes))
				testing("[A.name] had a different required sex")
				continue
				
			if(!(H.dna.species.name in A.allowed_races))
				testing("[A.name] had a different required race")
				continue

			if(!(H.age in A.allowed_ages))
				testing("[A.name] had a different required age")
				continue

			if(A.maxchosen > -1)
				if(A.amtchosen >= A.maxchosen)
					testing("[A.name] had max chosen classes")
					continue

			if(A.min_pq > get_playerquality(H.ckey))
				continue
			
			if(A.israre)
				testing("[A.name] added to rare class list")
				/*#ifdef TESTING
				H.possibleclass += A
				#endif*/
				H.special_classes += A
				continue
				
			testing("[A.name] added to possible classes")
			H.possibleclass += A

/client
	var/whitelisted = 2
	var/blacklisted = 2

/client/proc/whitelisted()
	if(whitelisted != 2)
		return whitelisted
	else
		if(check_whitelist(ckey))
			whitelisted = 1
		else
			whitelisted = 0
		return whitelisted

/client/proc/blacklisted()
	if(blacklisted != 2)
		return blacklisted
	else
		if(check_blacklist(ckey))
			blacklisted = 1
		else
			blacklisted = 0
		return blacklisted

/mob/living/carbon/human/proc/advsetup()
	if(!advsetup)
		testing("RETARD")
		return TRUE
	var/blacklisted = check_blacklist(ckey)

	if(special_classes.len && !shuffle_special.len)
		if(src.job == "Pilgrim")
			for(var/datum/advclass/pilgrim/p in special_classes)
				shuffle_special += p
			shuffle_special = shuffle(shuffle_special)
		else
			shuffle_special = shuffle(special_classes)
		if(shuffle_special.len)
			possibleclass += shuffle_special[1]
			testing("special class [shuffle_special[1]] added to possible classes")


	for(var/datum/advclass/R in possibleclass)
		if(!R.name)
			possibleclass -= R
			testing("removed base class [R]")

	if(possibleclass.len && !blacklisted)
		testing("possibleclass has length")
		var/list/pickableclasses = list()
		if(src.job == "Pilgrim" && !classesunlocked)
			testing("is pilgrim")
			if(alert(src, "What type of class are you?", "Pilgrim", "Combat", "Town",) != "Combat")
				for(var/datum/advclass/pilgrim/p in possibleclass)
					pickableclasses += p
					testing("added [p] to pickable classes")
			else
				if(!shuffle_combat.len)
					shuffle_combat = shuffle(possibleclass)
				for(var/datum/advclass/combat/p in shuffle_combat)
					if(pickableclasses.len >= 7 && !classesunlocked)
						continue
					pickableclasses += p
					testing("added [p] to pickable classes")
		else
			pickableclasses = possibleclass
			testing("pickable classes equals possibleclass")
		
		testing("[pickableclasses.len]")
		if(pickableclasses.len == 7 && !classesunlocked)
			testing("pickable class length is 7")
			if(get_triumphs() > 3)
				testing("triumphs greater than 3")
				if(alert(src, "Would you like to spend THREE TRIUMPHS to access all combat classes?. You will no longer be able to access Town classes. (Keep in mind, if your PQ is too low, you will not have access to rare classes. )", "Adventurous Pilgrim", "Yes", "No") != "No")
					adjust_triumphs(-3)
					for(var/datum/advclass/pilgrim/p in special_classes)
						special_classes -= p
					for(var/datum/advclass/pilgrim/p in possibleclass)
						possibleclass -= p	
					shuffle_special = shuffle(special_classes)
					if(shuffle_special.len)
						possibleclass += shuffle_special[1]
						testing("special class [shuffle_special[1]] added to possible classes")
					pickableclasses = possibleclass
					testing("all classes accessed as pilgrim")
					classesunlocked = TRUE

		for(var/datum/advclass/M in pickableclasses)
			testing("Checking if [M] is rare")
			if(M.israre && special_classes.len > 1 && get_triumphs() > 3)
				testing("[M] is rare")
				if(alert(src, "Would you like to spend THREE TRIUMPHS to reroll [M.name] into another rare class?", "Triumphant Individual", "Yes", "No") != "No")
					adjust_triumphs(-3)
					if(M.ispilgrim)
						shuffle_special -= M
						special_classes -= M
						shuffle_special = shuffle(shuffle_special)
						possibleclass -= M
					else
						special_classes -= M
						shuffle_special = shuffle(special_classes)
					pickableclasses -= M
					pickableclasses += shuffle_special[1]
					testing("rerolled [M] into [shuffle_special[1]]")
					if(special_classes.len)
						to_chat(src, "Rerolled [M] into [shuffle_special[1]]. [(special_classes.len) -1] rare classes remain.")
					else
						to_chat(src, "Rerolled [M] into [shuffle_special[1]]. No rare classes remain.")
					
		var/datum/advclass/C = input(src, "What is my class?", "Adventure") as null|anything in sortNames(pickableclasses)
		testing("class select started")
		if(C && advsetup)
			if(C.maxchosen > -1)
				for(var/datum/advclass/A in GLOB.adv_classes)
					if(A.type == C.type)
						if(A.amtchosen >= A.maxchosen)
							if(C.israre)
								var/list/shuffle_special
								special_classes -= C
								shuffle_special = shuffle(special_classes)
								pickableclasses += shuffle_special[1]
							pickableclasses -= C
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
