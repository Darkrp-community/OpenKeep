
/mob/living/carbon/human
	var/datum/charflaw/charflaw

/mob/proc/sate_addiction()
	return

/mob/living/carbon/human/sate_addiction()
	if(istype(charflaw, /datum/charflaw/addiction))
		var/datum/charflaw/addiction/A = charflaw
//		remove_stress(list(/datum/stressevent/vice1,/datum/stressevent/vice2,/datum/stressevent/vice3))
		A.sated = TRUE
		A.time = initial(A.time) //reset roundstart sate offset to standard
		A.next_sate = world.time + A.time

/datum/charflaw/addiction
	var/next_sate = 0
	var/sated = TRUE
	var/time = 5 MINUTES
//	var/debuff = /datum/status_effect/debuff/addiction
	var/debuff //so heroin junkies can have big problems
	var/needsate_text
	var/unsate_time


/datum/charflaw/addiction/New()
	..()
	time = rand(6 MINUTES, 30 MINUTES)
	next_sate = world.time + time

/datum/charflaw/addiction/flaw_on_life(mob/user)
	if(!ishuman(user))
		return
	if(user.mind.antag_datums)
		for(var/datum/antagonist/D in user.mind.antag_datums)
			if(istype(D, /datum/antagonist/vampirelord) || istype(D, /datum/antagonist/werewolf) || istype(D, /datum/antagonist/skeleton) || istype(D, /datum/antagonist/zombie))
				return
	var/mob/living/carbon/human/H = user
	var/oldsated = sated
	if(oldsated)
		if(next_sate)
			if(world.time > next_sate)
				sated = FALSE
	if(sated != oldsated)
		unsate_time = world.time
		if(needsate_text)
			to_chat(user, "<span class='warning'>[needsate_text]</span>")
	if(!sated)
		var/mob/living/carbon/V = user
		switch(world.time - unsate_time)
			if(0 to 5 MINUTES)
				V.add_stress(/datum/stressevent/vice1)
			if(5 MINUTES to 15 MINUTES)
				V.add_stress(/datum/stressevent/vice2)
			if(15 MINUTES to INFINITY)
				V.add_stress(/datum/stressevent/vice3)
		// V.add_stress(/datum/stressevent/vice)
		if(debuff)
			H.apply_status_effect(debuff)



/datum/status_effect/debuff/addiction
	id = "addiction"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/addiction
	effectedstats = list("endurance" = -1,"fortune" = -1)
	duration = 100


/atom/movable/screen/alert/status_effect/debuff/addiction
	name = "Addiction"
	desc = ""
	icon_state = "debuff"


/// ALCOHOLIC

/datum/charflaw/addiction/alcoholic
	name = "Alcoholic"
	desc = "Drinking alcohol is my favorite thing."
	time = 30 MINUTES
	needsate_text = "Time for a drink."


/// JUNKIE

/datum/charflaw/addiction/junkie
	name = "Junkie"
	desc = "I need a real high to take the pain of this rotten world away."
	time = 30 MINUTES
	needsate_text = "Time to reach a new high."

/// Smoker

/datum/charflaw/addiction/smoker
	name = "Smoker"
	desc = "I need to smoke something to take the edge off."
	time = 30 MINUTES
	needsate_text = "Time for a flavorful smoke."

/// GOD-FEARING

/datum/charflaw/addiction/godfearing
	name = "Devout Follower"
	desc = "I need to pray to my Patron, their blessings are stronger."
	time = 25 MINUTES
	needsate_text = "Time to pray."

/datum/charflaw/addiction/godfearing/on_mob_creation(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser) || H.mind.has_antag_datum(/datum/antagonist/vampirelord)) // dont stunlock
		return
	if(!H.wear_neck)
		var/obj/item/clothing/neck/roguetown/psicross/crosstype
		switch(H.patron)
			if(/datum/patron/divine/astrata)
				crosstype = /obj/item/clothing/neck/roguetown/psicross/astrata
			if(/datum/patron/divine/noc)
				crosstype = /obj/item/clothing/neck/roguetown/psicross/noc
			if(/datum/patron/divine/dendor)
				crosstype = /obj/item/clothing/neck/roguetown/psicross/dendor
			if(/datum/patron/divine/necra)
				crosstype = /obj/item/clothing/neck/roguetown/psicross/necra
			if(/datum/patron/divine/ravox)
				crosstype = /obj/item/clothing/neck/roguetown/psicross/ravox
			else
				if(prob(1))
					crosstype = /obj/item/clothing/neck/roguetown/psicross/g
				else
					crosstype = /obj/item/clothing/neck/roguetown/psicross
		H.equip_to_slot_or_del(new crosstype(H), SLOT_NECK)

/// ALCOHOLIC

/datum/charflaw/addiction/lovefiend
	name = "Love-Fiend"
	desc = "I must make love!"
	time = 30 MINUTES
	needsate_text = "Time to get happy."
