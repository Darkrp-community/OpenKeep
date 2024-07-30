/datum/job/roguetown/puritan
	title = "Inquisitor"
	flag = PURITAN
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen"
	)
	allowed_sexes = list(MALE)

	tutorial = "A recent arrival to Rockhill, the Inquisitor is a member the secretive lodges that have held to the service of the Forgotten God since the Apotheosis War. They have formed a fragile alliance with the local Priest against the increasing number of heretics and monsters infiltrating the town."
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/puritan
	display_order = JDO_PURITAN
//	give_bank_account = 36 // Inquisitors are recent arrivals to Rockhill and do not have a bank account.
	min_pq = 0
	bypass_lastclass = TRUE

/datum/job/roguetown/puritan/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(!L.mind)
		return
	if(L.mind.has_antag_datum(/datum/antagonist))
		return
	var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
	L.mind.add_antag_datum(new_antag)

/datum/outfit/job/roguetown/puritan
	name = "Puritan"
	jobtype = /datum/job/roguetown/puritan

/datum/outfit/job/roguetown/puritan/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/cape/puritan
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/helmet/leather/inquisitor
	gloves = /obj/item/clothing/gloves/roguetown/angle
	wrists = /obj/item/clothing/neck/roguetown/psicross/silver
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/sword/long/forgotten
	beltl = /obj/item/flashlight/flare/torch/lantern
	neck = /obj/item/clothing/neck/roguetown/bevor
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	backpack_contents = list(/obj/item/keyring/puritan = 1, /obj/item/needle = 1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("strength", 1)
		H.change_stat("perception", 2)
		H.change_stat("speed", 2)
		H.change_stat("endurance", 1)
		H.change_stat("constitution", 1)
		if(H.mind.has_antag_datum(/datum/antagonist))
			return
		var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_TORTURER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	H.verbs |= /mob/living/carbon/human/proc/faith_test
	H.verbs |= /mob/living/carbon/human/proc/torture_victim

/mob/living/carbon/human/proc/torture_victim()
	set name = "ExtractConfession"
	set category = "Inquisition"

	var/obj/item/grabbing/I = get_active_held_item()
	var/mob/living/carbon/human/H
	if(istype(I))
		if(ishuman(I.grabbed))
			H = I.grabbed
			/*if(H == src)
				to_chat(src, "<span class='warning'>I already torture myself.</span>")
				return
			*/
			var/painpercent = H.get_complex_pain() / (H.STAEND * 10)
			painpercent = painpercent * 100
			var/mob/living/carbon/C = H
			if(C.add_stress(/datum/stressevent/tortured))
				if(!H.stat)
					say(pick("CONFESS!",
								"TELL ME YOUR SECRETS!",
								"SPEAK!",
								"YOU WILL SPEAK!",
								"TELL ME!",
								"THE PAIN HAS ONLY BEGUN, CONFESS!"), spans = list("torture"))
					if((painpercent > 90) || (!H.cmode))
						H.emote("painscream")
						H.confession_time(src)
						return
			to_chat(src, "<span class='warning'>Not ready to speak yet.</span>")

/mob/living/carbon/human/proc/confession_time(mob/living/carbon/human/user)
	var/timerid = addtimer(CALLBACK(src, PROC_REF(confess_sins)), 6 SECONDS, TIMER_STOPPABLE)
	var/responsey = alert("Resist torture? (1 TRI)","Yes","No")
	if(!responsey)
		responsey = "No"
	if(SStimer.timer_id_dict[timerid])
		deltimer(timerid)
	else
		to_chat(src, "<span class='warning'>Too late...</span>")
		return
	if(responsey == "Yes")
		adjust_triumphs(-1)
		confess_sins(TRUE, user)
	else
		confess_sins(user)

/mob/living/carbon/human/proc/confess_sins(resist, mob/living/carbon/human/user, torture=TRUE)
	var/static/list/innocent_lines = list(
		"I DON'T KNOW!",
		"STOP THE PAIN!!",
		"I DON'T DESERVE THIS!",
		"THE PAIN!",
		"I HAVE NOTHING TO SAY...!",
		"WHY ME?!",
	)
	if(!resist)
		var/list/confessions = list()
		var/antag_type = null
		for(var/datum/antagonist/antag in mind?.antag_datums)
			if(length(antag.confess_lines))
				confessions = antag.confess_lines
				antag_type = antag.name
				break // Only need one antag type
		if(length(patron.confess_lines) && !length(confessions)) // The antag confession lines take precedence over the heretic lines. If there are antag lines, the heretic ones will not show.
			confessions = patron.confess_lines
			antag_type = patron.name
		if(length(confessions))
			if(torture == TRUE) // Only scream your confession if it's due to torture.
				say(pick(confessions), spans = list("torture"))
			if(user.is_holding_item_of_type(/obj/item/paper/confession)) // This code is to process gettin a signed confession through torture.
				var/obj/item/paper/confession/held_confession = user.is_holding_item_of_type(/obj/item/paper/confession)
				if(!held_confession.signed) // Check to see if the confession is already signed.
					held_confession.signed = real_name
					held_confession.bad_type = "AN EVILDOER" // In case new antags are added with confession lines but have yet to be added here.
					switch(antag_type)
						if("Bandit")
							held_confession.bad_type = "AN OUTLAW OF THE THIEF-LORD"
						if("Matthios")
							held_confession.bad_type = "AN OUTLAW OF THE THIEF-LORD"
						if("Maniac")
							held_confession.bad_type = "A MANIAC IMMUNE TO PAIN"
						if("Assassin")
							held_confession.bad_type = "A DEATH CULTIST"
						if("Zizoid Lackey")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
						if("Zizoid Cultist")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
						if("Zizo")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
						if("Werewolf")
							held_confession.bad_type = "A BEARER OF DENDOR'S CURSE"
						if("Vampire")
							held_confession.bad_type = "A SCION OF KAINE"
						if("Vampire Lord")
							held_confession.bad_type = "THE BLOOD-LORD OF ENIGMA"
						if("Graggar")
							held_confession.bad_type = "A FOLLOWER OF THE DARK SUN"
						if("Peasant Rebel")
							return // Inquisitors don't care about peasant revolts targeting the King of Rockhill'
						if("Science")
							held_confession.bad_type = "DAMNED ANTI-THEIST"
					held_confession.info = "THE GUILTY PARTY ADMITS THEIR SINFUL NATURE AS [held_confession.bad_type]. THEY WILL SERVE ANY PUNISHMENT OR SERVICE AS REQUIRED BY THE ORDER OF THE HOLY PSYCROSS UNDER PENALTY OF DEATH.<br/><br/>SIGNED,<br/><font color='red'>[held_confession.signed]</font>"
					return
	say(pick(innocent_lines), spans = list("torture"))
	return

/mob/living/carbon/human/proc/faith_test()
	set name = "FaithTest"
	set category = "Inquisition"
	set hidden = 1
	//same as above, but CRY TO YOUR GOD! BEG TO YOUR CREATOR! WHO DO YOU WORSHIP? WHO IS YOUR MASTER?
