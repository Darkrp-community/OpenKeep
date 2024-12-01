
/mob/living
	var/STASTR = 10
	var/STAPER = 10
	var/STAINT = 10
	var/STACON = 10
	var/STAEND = 10
	var/STASPD = 10
	var/STALUC = 10
	//buffers, the 'true' amount of each stat
	var/BUFSTR = 0
	var/BUFPER = 0
	var/BUFINT = 0
	var/BUFCON = 0
	var/BUFEND = 0
	var/BUFSPE = 0
	var/BUFLUC = 0
	var/statbuf = FALSE
	var/list/statindex = list()
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
	var/list/specstats = list("strength" = 0, "perception" = 0, "intelligence" = 0, "constitution" = 0, "endurance" = 0, "speed" = 0, "fortune" = 0)
	var/list/specstats_f = list("strength" = 0, "perception" = 0, "intelligence" = 0, "constitution" = 0, "endurance" = 0, "speed" = 0, "fortune" = 0)

/mob/living/proc/roll_stats()
	STASTR = 10
	STAPER = 10
	STAINT = 10
	STACON = 10
	STAEND = 10
	STASPD = 10
	STALUC = 10
	for(var/S in MOBSTATS)
		if(prob(33))
			switch(pick(1,2))
				if(1)
					change_stat(S, 1)
				if(2)
					change_stat(S, -1)
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
				change_stat("speed", -1)
				change_stat("endurance", 1)
			if(AGE_OLD)
				change_stat("strength", -2)
				change_stat("speed", -1)
				change_stat("perception", 2)
				change_stat("constitution", -1)
				change_stat("intelligence", 2)
				change_stat("endurance", -1)
				change_stat("fortune", 1)
		if(key)
			if(check_blacklist(ckey(key)))
				change_stat("strength", -5)
				change_stat("speed", -20)
				change_stat("endurance", -2)
				change_stat("constitution", -2)
				change_stat("intelligence", -20)
				change_stat("fortune", -20)
			if(check_psychokiller(ckey(key)))
				testing("foundpsych")
				H.eye_color = "ff0000"
				H.voice_color = "ff0000"

/mob/living/proc/change_stat(stat, amt, index)
	if(!stat)
		return
	if(amt == 0 && index)
		if(statindex[index])
			change_stat(statindex[index]["stat"], -1*statindex[index]["amt"])
			statindex[index] = null
			return
	if(!amt)
		return
	if(index)
		if(statindex[index])
			return //we cannot make a new index
		else
			statindex[index] = list("stat" = stat, "amt" = amt)
//			statindex[index]["stat"] = stat
//			statindex[index]["amt"] = amt
	var/newamt = 0
	switch(stat)
		if("strength")
			newamt = STASTR + amt
			if(BUFSTR < 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR > 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			if(BUFSTR > 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR < 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			while(newamt < 1)
				newamt++
				BUFSTR--
			while(newamt > 20)
				newamt--
				BUFSTR++
			STASTR = newamt

		/*	var/obj/item/bodypart/armr = get_bodypart(BODY_ZONE_R_ARM)
			if(armr)
				if(STASTR <= 10)
					armr.sellprice = STASTR
				if(STASTR > 10)
					armr.sellprice = STASTR*2
					if(STASTR > 12)
						armr.sellprice = STASTR*4 //generally going to be harder to sell limbs off dead bodies, since prior bloodloss will tank stat and price
						if(STASTR > 14)
							armr.sellprice = STASTR*6
							if(STASTR > 16) //VL
								armr.sellprice = STASTR*10.

			var/obj/item/bodypart/arml = get_bodypart(BODY_ZONE_L_ARM)
			if(arml)
				if(STASTR <= 10)
					arml.sellprice = STASTR
				if(STASTR > 10)
					arml.sellprice = STASTR*2
					if(STASTR > 12)
						arml.sellprice = STASTR*4
						if(STASTR > 14)
							arml.sellprice = STASTR*6
							if(STASTR > 16)
								arml.sellprice = STASTR*10		Commented out since no gating to fix goblins etc being farmed for truly ludicrous amounts*/

		if("perception")
			newamt = STAPER + amt
			if(BUFPER < 0)
				BUFPER = BUFPER + amt
				if(BUFPER > 0)
					newamt = STAPER + BUFPER
					BUFPER = 0
			if(BUFPER > 0)
				BUFPER = BUFPER + amt
				if(BUFPER < 0)
					newamt = STAPER + BUFPER
					BUFPER = 0
			while(newamt < 1)
				newamt++
				BUFPER--
			while(newamt > 20)
				newamt--
				BUFPER++
			STAPER = newamt

		/*	var/obj/item/organ/eyes/eyes = getorganslot(ORGAN_SLOT_EYES)
			if(eyes)
				if(STAPER <= 10)
					eyes.sellprice = STAPER
				if(STAPER > 10)
					eyes.sellprice = STAPER*2
					if(STAPER > 12) //PER is harder to max out and buff
						eyes.sellprice = STAPER*4
						if(STAPER > 14) //tiefling boltslinger basically
							eyes.sellprice = STAPER*6	*/

			update_fov_angles()

		if("intelligence")
			newamt = STAINT + amt
			if(BUFINT < 0)
				BUFINT = BUFINT + amt
				if(BUFINT > 0)
					newamt = STAINT + BUFINT
					BUFINT = 0
			if(BUFINT > 0)
				BUFINT = BUFINT + amt
				if(BUFINT < 0)
					newamt = STAINT + BUFINT
					BUFINT = 0
			while(newamt < 1)
				newamt++
				BUFINT--
			while(newamt > 20)
				newamt--
				BUFINT++
			STAINT = newamt

		/*	var/obj/item/organ/brain/brain = getorganslot(ORGAN_SLOT_BRAIN)
			if(brain)
				if(STAINT <= 10)
					brain.sellprice = STAINT
				if(STAINT > 10)
					brain.sellprice = STAINT*2
					if(STAINT > 11)
						brain.sellprice = STAINT*4
						if(STAINT > 13)
							brain.sellprice = STAINT*6
							if(STAINT > 15) //15+ needs a special job - baseline old age elf is 14.
								brain.sellprice += STAINT*10  "smartest" human npcs rn are zizombies and orcs at 10 INT - galaxy brains are player-exclusive.	*/


		if("constitution")
			newamt = STACON + amt
			if(BUFCON < 0)
				BUFCON = BUFCON + amt
				if(BUFCON > 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			if(BUFCON > 0)
				BUFCON = BUFCON + amt
				if(BUFCON < 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			while(newamt < 1)
				newamt++
				BUFCON--
			while(newamt > 20)
				newamt--
				BUFCON++
			STACON = newamt

		/*	var/obj/item/organ/liver/liver = getorganslot(ORGAN_SLOT_LIVER)
			if(liver)
				if(STACON >= 10)
					liver.sellprice = STACON
				if(STACON < 10)
					liver.sellprice = STACON*2
					if(STACON > 11)
						liver.sellprice = STACON*3
						if(STACON > 13)
							liver.sellprice = STACON*4
							if(STACON > 15)
								liver.sellprice += STACON*5

			var/obj/item/organ/stomach = getorganslot(ORGAN_SLOT_STOMACH)
			if(stomach)
				if(STACON >= 10)
					stomach.sellprice = STACON
				if(STACON < 10)
					stomach.sellprice = STACON*2
					if(STACON > 11)
						stomach.sellprice = STACON*3
						if(STACON > 13)
							stomach.sellprice = STACON*4
							if(STACON > 15)
								stomach.sellprice += STACON*5

			var/obj/item/organ/guts/guts = getorganslot(ORGAN_SLOT_STOMACH_AID)
			if(guts)
				if(STACON >= 10)
					guts.sellprice = STACON
				if(STACON < 10)
					guts.sellprice = STACON*2
					if(STACON > 11)
						guts.sellprice = STACON*3
						if(STACON > 13)
							guts.sellprice = STACON*4
							if(STACON > 15)
								guts.sellprice += STACON*5	Commented out since no gating to fix goblins etc being farmed for truly ludicrous amounts*/


		if("endurance")
			newamt = STAEND + amt
			if(BUFEND < 0)
				BUFEND = BUFEND + amt
				if(BUFEND > 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			if(BUFEND > 0)
				BUFEND = BUFEND + amt
				if(BUFEND < 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			while(newamt < 1)
				newamt++
				BUFEND--
			while(newamt > 20)
				newamt--
				BUFEND++
			STAEND = newamt

		/*	var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
			if(heart)
				if(STAEND <= 10)
					heart.sellprice = STAEND
				if(STAEND > 10)
					heart.sellprice = STAEND*2
					if(STAEND > 12)
						heart.sellprice = STAEND*3
						if(STAEND > 14)
							heart.sellprice = STAEND*5
							if(STAEND > 16)
								heart.sellprice += STAEND*7

			var/obj/item/organ/lungs/lungs = getorganslot(ORGAN_SLOT_LUNGS)
			if(lungs)
				if(STAEND <= 10)
					lungs.sellprice = STAEND
				if(STAEND > 10)
					lungs.sellprice = STAEND*2
					if(STAEND > 12)
						lungs.sellprice = STAEND*3
						if(STAEND > 14)
							lungs.sellprice = STAEND*5
							if(STAEND > 16)
								lungs.sellprice += STAEND*7	Commented out since no gating to fix goblins etc being farmed for truly ludicrous amounts*/

		if("speed")
			newamt = STASPD + amt
			if(BUFSPE < 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE > 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			if(BUFSPE > 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE < 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			while(newamt < 1)
				newamt++
				BUFSPE--
			while(newamt > 20)
				newamt--
				BUFSPE++
			STASPD = newamt

		/*	var/obj/item/bodypart/legr = get_bodypart(BODY_ZONE_R_LEG)
			if(legr)
				if(STASPD <= 10)
					legr.sellprice = STASPD
				if(STASPD > 10)
					legr.sellprice = STASPD*2
					if(STASPD > 12)
						legr.sellprice = STASPD*4
						if(STASPD > 15)
							legr.sellprice = STASPD*6
							if(STASPD > 17)
								legr.sellprice += STASPD*8

			var/obj/item/bodypart/legl = get_bodypart(BODY_ZONE_L_LEG)
			if(legl)
				if(STASPD <= 10)
					legl.sellprice = STASPD
				if(STASPD > 10)
					legl.sellprice = STASPD*2
					if(STASPD > 12)
						legl.sellprice = STASPD*4
						if(STASPD > 15)
							legl.sellprice = STASPD*6
							if(STASPD > 17)
								legl.sellprice += STASPD*8	Commented out since no gating to fix goblins etc being farmed for truly ludicrous amounts*/

			update_move_intent_slowdown()

		if("fortune")
			newamt = STALUC + amt
			if(BUFLUC < 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC > 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			if(BUFLUC > 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC < 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			while(newamt < 1)
				newamt++
				BUFLUC--
			while(newamt > 20)
				newamt--
				BUFLUC++
			STALUC = newamt

		/*	var/obj/item/organ/tongue/tongue = getorganslot(ORGAN_SLOT_TONGUE) //Superstition? also only really beggars and jesters can be farmed for this
			if(tongue)
				if(STALUC <= 10)
					tongue.sellprice = STALUC
				if(STALUC > 10)
					tongue.sellprice = STALUC*2
					if(STALUC > 12)
						tongue.sellprice = STALUC*4
						if(STALUC > 14)
							tongue.sellprice = STALUC*6	Commented out since no gating to fix goblins etc being farmed for truly ludicrous amounts*/

/proc/generic_stat_comparison(userstat as num, targetstat as num)
	var/difference = userstat - targetstat
	if(difference > 1 || difference < -1)
		return difference * 10
	else
		return 0

/mob/living/proc/badluck(multi = 3)
	if(STALUC < 10)
		return prob((10 - STALUC) * multi)

/mob/living/proc/goodluck(multi = 3)
	if(STALUC > 10)
		return prob((STALUC - 10) * multi)
