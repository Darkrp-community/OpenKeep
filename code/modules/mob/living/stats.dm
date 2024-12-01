
/mob/living
	var/STASTR = 10
	var/STAPER = 10
	var/STAEND = 10
	var/STACON = 10
	var/STAINT = 10
	var/STASPD = 10
	var/STALUC = 10
	var/datum/patron/patron = /datum/patron/godless

/mob/living/proc/init_faith()
	patron = GLOB.patronlist[/datum/patron/godless]

/mob/living/proc/set_patron(datum/patron/new_patron)
	if(!new_patron)
		return TRUE
	if(ispath(new_patron))
		new_patron = GLOB.patronlist[new_patron]
	if(!istype(new_patron))
		return TRUE
	if(patron && !ispath(patron))
		patron.on_remove(src)
	patron = new_patron
	patron.on_gain(src)
	return TRUE

/datum/species
	///Statkey = bonus stat, - for malice.
	var/list/specstats = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_END = 0,STATKEY_CON = 0, STATKEY_INT = 0, STATKEY_SPD = 0, STATKEY_LCK = 0)
	///Statkey = bonus stat, - for malice.
	var/list/specstats_f = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_END = 0,STATKEY_CON = 0, STATKEY_INT = 0, STATKEY_SPD = 0, STATKEY_LCK = 0)

/mob/living/proc/roll_stats()
	for(var/stat in MOBSTATS)
		if(prob(33))
			change_stat(stat,rand(-2,2))
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		if(H.dna.species)
			if(gender == FEMALE)
				for(var/S in H.dna.species.specstats_f)
					change_stat(S, H.dna.species.specstats_f[S])
			else
				for(var/S in H.dna.species.specstats)
					change_stat(S, H.dna.species.specstats[S])
		switch(H.age)
			if(AGE_MIDDLEAGED)
				change_stat(STATKEY_SPD, -1)
				change_stat(STATKEY_END, 1)
			if(AGE_OLD)
				change_stat(STATKEY_STR, -2)
				change_stat(STATKEY_SPD, -1)
				change_stat(STATKEY_PER, 2)
				change_stat(STATKEY_CON, -1)
				change_stat(STATKEY_INT, 2)
				change_stat(STATKEY_END, -1)
				change_stat(STATKEY_LCK, 1)
		if(key)
			if(check_blacklist(ckey(key))) //You're boutta have a reaaaal bad dae....
				change_stat(STATKEY_STR, 1,TRUE)
				change_stat(STATKEY_PER, 1,TRUE)
				change_stat(STATKEY_END, 1,TRUE)
				change_stat(STATKEY_CON, 1,TRUE)
				change_stat(STATKEY_INT, 1,TRUE)
				change_stat(STATKEY_SPD, 1,TRUE)
				change_stat(STATKEY_LCK, 1,TRUE)
			if(check_psychokiller(ckey(key)))
				testing("foundpsych")
				H.eye_color = "ff0000"
				H.voice_color = "ff0000"
/// Adjusts stat values of mobs. set_stat == true to set directly and clampvals == false to ignore min stat 1 max stat 20
/mob/living/proc/change_stat(stat_key, adjust_amount, set_stat = FALSE, clampvals = TRUE)
	if(!stat_key || !adjust_amount)
		return
	switch(stat_key)
		if(STATKEY_STR)
			if(set_stat)
				STASTR = adjust_amount
			else
				STASTR += adjust_amount
			if(clampvals)
				STASTR = clamp(STASTR,1,20)
		if(STATKEY_PER)
			if(set_stat)
				STAPER = adjust_amount
			else
				STAPER += adjust_amount
			if(clampvals)
				STAPER = clamp(STAPER,1,20)
		if(STATKEY_END)
			if(set_stat)
				STAEND = adjust_amount
			else
				STAEND += adjust_amount
			if(clampvals)
				STAEND = clamp(STAEND,1,20)
		if(STATKEY_CON)
			if(set_stat)
				STACON = adjust_amount
			else
				STACON += adjust_amount
			if(clampvals)
				STACON = clamp(STACON,1,20)
		if(STATKEY_INT)
			if(set_stat)
				STAINT = adjust_amount
			else
				STAINT += adjust_amount
			if(clampvals)
				STAINT = clamp(STAINT,1,20)
		if(STATKEY_SPD)
			if(set_stat)
				STASPD = adjust_amount
			else
				STASPD += adjust_amount
			if(clampvals)
				STASPD = clamp(STASPD,1,20)
		if(STATKEY_LCK)
			if(set_stat)
				STALUC = adjust_amount
			else
				STALUC += adjust_amount
			if(clampvals)
				STALUC = clamp(STALUC,1,20)
	return
///Returns: STR,PER,END,CON,INT,SPD,LCK in a list, in that order
/mob/living/proc/get_stats()
	return list(STASTR,STAPER,STAEND,STACON,STAINT,STASPD,STALUC)

///Returns: the difference in value between the opponents stat key and ours.
///EG: Our endurace - opp endurance.
/mob/living/proc/stat_difference_to(mob/living/opponent,stat_key)
	if(!opponent || !stat_key)
		return
	switch(stat_key)
		if(STATKEY_STR)
			return STASTR - opponent.STASTR
		if(STATKEY_PER)
			return STAPER - opponent.STAPER
		if(STATKEY_END)
			return STAEND - opponent.STAEND
		if(STATKEY_CON)
			return STACON - opponent.STACON
		if(STATKEY_INT)
			return STAINT - opponent.STAINT
		if(STATKEY_SPD)
			return STASPD - opponent.STASPD
		if(STATKEY_LCK)
			return STALUC - opponent.STALUC
	return
///Returns: Difference betwen our_stat and opponents opp_stat.
///EG: Our STR - opp CON
/mob/living/proc/stat_fight(mob/living/opponent, opp_stat_key, our_stat_key)
	if(!opponent || !opp_stat_key || !our_stat_key)
		return
	var/opponent_stat
	var/our_stat
	switch(opp_stat_key)
		if(STATKEY_STR)
			opponent_stat = opponent.STASTR
		if(STATKEY_PER)
			opponent_stat = opponent.STAPER
		if(STATKEY_END)
			opponent_stat = opponent.STAEND
		if(STATKEY_CON)
			opponent_stat = opponent.STACON
		if(STATKEY_INT)
			opponent_stat = opponent.STAINT
		if(STATKEY_SPD)
			opponent_stat = opponent.STASPD
		if(STATKEY_LCK)
			opponent_stat = opponent.STALUC
	switch(our_stat_key)
		if(STATKEY_STR)
			our_stat = STASTR
		if(STATKEY_PER)
			our_stat = STAPER
		if(STATKEY_END)
			our_stat = STAEND
		if(STATKEY_CON)
			our_stat = STACON
		if(STATKEY_INT)
			our_stat = STAINT
		if(STATKEY_SPD)
			our_stat = STASPD
		if(STATKEY_LCK)
			our_stat = STALUC
	return our_stat - opponent_stat

///Effectively rolls a d20, with each point in the stat being a chance_per_point% chance to succeed per point in the stat. If no stat is provided, just returns 0.
///dee_cee is a difficulty mod, a positive value makes the check harder, a negative value makes it easier.
///invert_dc changes it from stat - dc to dc - stat, for inverted checks.
///EG: A person with 10 luck and a dc of -10 effectively has a 100% chance of success. Or an inverted DC with 10 means 0% chance of success.
/mob/living/proc/stat_roll(stat_key,chance_per_point = 5, dee_cee = null, invert_dc = FALSE)
	if(!stat_key)
		return FALSE
	var/tocheck
	switch(stat_key)
		if(STATKEY_STR)
			tocheck = STASTR
		if(STATKEY_PER)
			tocheck = STAPER
		if(STATKEY_END)
			tocheck = STAEND
		if(STATKEY_CON)
			tocheck = STACON
		if(STATKEY_INT)
			tocheck = STAINT
		if(STATKEY_SPD)
			tocheck = STASPD
		if(STATKEY_LCK)
			tocheck = STALUC
	if(invert_dc)
		return isnull(dee_cee) ? prob(tocheck * chance_per_point) : prob(clamp((dee_cee - tocheck) * chance_per_point,0,100))
	else
		return isnull(dee_cee) ? prob(tocheck * chance_per_point) : prob(clamp((tocheck - dee_cee) * chance_per_point,0,100))
