// This mode will become the main basis for the typical roguetown round. Based off of chaos mode.
var/global/list/roguegamemodes = list("Rebellion", "Vampire Lord", "Extended", "Bandits", "CANCEL") // This is mainly used for forcemgamemodes

/datum/game_mode/chaosmode
	name = "roguemode"
	config_tag = "roguemode"
	report_type = "roguemode"
	false_report_weight = 0
	required_players = 0
	required_enemies = 0
	recommended_enemies = 0
	enemy_minimum_age = 0

	announce_span = "danger"
	announce_text = "The"

	var/allmig = FALSE
	var/roguefight = FALSE
	var/redscore = 0
	var/greenscore = 0

	var/list/allantags = list()

// DEBUG
	var/list/forcedmodes = list()
	var/mob/living/carbon/human/vlord = null

// GAMEMODE SPECIFIC
	var/banditcontrib = 0
	var/banditgoal = 1
	var/delfcontrib = 0
	var/delfgoal = 1

	var/skeletons = FALSE
	var/lesser_vampires = FALSE

	var/headrebdecree = FALSE

	var/check_for_lord = TRUE
	var/next_check_lord = 0
	var/missing_lord_time = FALSE
	var/roundvoteend = FALSE
	var/ttime

	var/kingsubmit = FALSE
	var/deathknightspawn = FALSE
	var/ascended = FALSE
	var/cultascended = FALSE
	var/list/datum/mind/deathknights = list()

/datum/game_mode/chaosmode/proc/reset_skeletons()
	skeletons = FALSE

/datum/game_mode/chaosmode/check_finished(force_ending)
	ttime = world.time - SSticker.round_start_time
	if(roguefight)
		if(ttime >= 30 MINUTES)
			return TRUE
		if((redscore >= 100) || (greenscore >= 100))
			return TRUE
		return FALSE

	if(allmig)
		return FALSE
	
	if(force_ending)
		for(var/mob/living/carbon/human/H in GLOB.human_list)
			if(H.stat != DEAD)
				if(H.allmig_reward)
					H.adjust_triumphs(H.allmig_reward)
					H.allmig_reward = 0
		return TRUE

	if(ttime >= GLOB.round_timer)
		if(!roundvoteend)
			if(!SSvote.mode)
				SSvote.initiate_vote("endround", pick("Zlod", "Sun King", "Gaia", "Moon Queen", "Aeon", "Gemini", "Aries"))
	
	if(SSticker.roundendtime)
		if(roundvoteend)
			ttime =  world.time - SSticker.roundendtime
			if(!(SSevents.running.len))
				var/datum/round_event/rogue/skellysiege/E = new /datum/round_event/rogue/skellysiege/
				E.New()
			if(ttime >= 15 MINUTES )
				for(var/mob/living/carbon/human/H in GLOB.human_list)
					if(H.stat != DEAD)
						if(H.allmig_reward)
							H.adjust_triumphs(H.allmig_reward)
							H.allmig_reward = 0
				return TRUE

	if(headrebdecree)
		for(var/mob/living/carbon/human/H in GLOB.human_list)
			if(H.stat != DEAD)
				if(H.allmig_reward)
					H.adjust_triumphs(H.allmig_reward)
					H.allmig_reward = 0
		return TRUE

	check_for_lord()

	if(ttime > 280 MINUTES) //3 hour cutoff
		for(var/mob/living/carbon/human/H in GLOB.human_list)
			if(H.stat != DEAD)
				if(H.allmig_reward)
					H.adjust_triumphs(H.allmig_reward)
					H.allmig_reward = 0
		return TRUE

/datum/game_mode/chaosmode/proc/check_for_lord()
	if(world.time < next_check_lord)
		return
	next_check_lord = world.time + 1 MINUTES
	var/lord_found = FALSE
	var/lord_dead = FALSE
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(H.mind)
			if(H.job == "Lord" || H.job == "Lady" || SSticker.forcedwithoutruler)
				lord_found = TRUE
				if(H.stat == DEAD)
					lord_dead = TRUE
				else
					if(lord_dead)
						lord_dead = FALSE
					break
	if(lord_dead || !lord_found)
		if(!missing_lord_time)
			missing_lord_time = world.time
		if(world.time > missing_lord_time + 10 MINUTES)
			missing_lord_time = world.time
			addomen("nolord")
		return FALSE
	else
		return TRUE

/datum/game_mode/chaosmode/pre_setup()
	if(allmig || roguefight)
		return TRUE
	for(var/A in GLOB.special_roles_rogue)
		allantags |= get_players_for_role(A)

	return TRUE

/datum/game_mode/proc/after_DO()
	return

/datum/game_mode/chaosmode/after_DO()
	if(allmig || roguefight)
		return TRUE
	if(SSticker.manualmodes)
		forcedmodes |= SSticker.manualmodes
	var/list/major_modes = list()
	var/list/minor_modes = list()
	if(forcedmodes.len)
		message_admins("Manual gamemodes selected.")
		for(var/G in forcedmodes)
			switch(G)
				if("Rebellion")
					pick_rebels()
					log_game("Major Antagonist: Rebellion")
				if("Vampire Lord")
					pick_vampires()
					log_game("Major Antagonist: Vampire Lord")
				if("Bandits")
					pick_bandits()
					log_game("Minor Antagonist: Bandit")
				if("Extended")
					log_game("Major Antagonist: Extended")
		return TRUE
	var/playersready = num_players()
	if(get_players_for_role(ROLE_PREBEL).len > 1)
		major_modes |= 1
	if(get_players_for_role(ROLE_WEREWOLF).len > 0)
		major_modes |= 2
	if(get_players_for_role(ROLE_NBEAST).len > 0)		
		major_modes |= 3
	if(get_players_for_role(ROLE_ZIZOIDCULTIST).len > 0)		
		major_modes |= 4
	if(!major_modes.len)
		major_modes |= 0
	var/majorpicked = pick(major_modes)
	if(playersready <= 10)
		majorpicked = 0

	switch(majorpicked)
		if(0)
			log_game("Major Antagonist: Extended")
		if(1)
			pick_rebels()
			log_game("Major Antagonist: Rebellion")
		if(2)
			pick_werewolves()
			log_game("Major Antagonist: Werewolf")
		if(3)
			pick_vampires()
			log_game("Major Antagonist: Vampire Lord")
		if(4)
			pick_cultist()
			log_game("Major Antagonist: Zizoid Cultists")

	var/list/rogues = get_players_for_role(ROLE_BANDIT)
	if(rogues.len > 0)
		minor_modes |= 1
	
	var/list/licks = get_players_for_role(ROLE_NBEAST)
	if(licks.len > 0 && majorpicked != 3)
		minor_modes |= 2

	minor_modes = shuffle(minor_modes)
	for(var/m in minor_modes)
		switch(m)
			if(1)
				pick_bandits()
				log_game("Minor Antagonist: Bandit")
			if(2)
				pick_lesser_vampires()
				log_game("Minor Antagonist: Lesser vampire")
		if(GetTownPower() - GetAntagPower() <= 1)
			break
	return TRUE

/datum/game_mode/chaosmode/proc/pick_bandits()
	//BANDITS
	banditgoal = rand(200,400)
	restricted_jobs = list("Lord",
	"Lady",
	"Merchant",
	"Priest")
	var/num_bandits = 0
	var/banditcap = GetTownPower() - 2 //GLOB.joined_player_list.len / 10
	if(num_players() >= 6)
		num_bandits = banditcap
		banditgoal += (num_bandits * rand(200,400))
	if(num_bandits)
		//antag_candidates = get_players_for_role(ROLE_BANDIT, pre_do=TRUE) //pre_do checks for their preferences since they don't have a job yet
		/*
			Lets go over some things here to whomever sees this from my observations (which may be incorrect).

			The other modes (that aren't this) choose antags in () which makes the restricted_jobs list work as its checked in DivideOccupations()
			DivideOccupations() occurs and checks it right after the current mode pre_setup() call on SSticker
			Then we call this brand new after_DO() proc AFTER the jobs have been assigned to the mind/checks occur on SSticker via DivideOccupations()
			In after_DO() we go through all the mode/antag selection instructions linking into these pick_antag() procs
			All the characters are made and equipped in the instruction sets between now and post_setup()
			Then the post_setup() proc which is called on SSticker doles out the antag datums from anything stuck into the pre_antag lists here
			Both pre_setup() and post_setup() get called within the Setup() proc in SSticker at earlier and later timings.

			Also the pre_do param only checks to see if a job preference is set to HIGH,
			so if it was working a medium priority king would still get shunted into a bandit.
			Along with that every person who has a restricted job set to HIGH would also just get rejected from it.

			Also to note, we check the restricted jobs list on the mind in get_players_for_role() too
			Except all these pick procs also set the list after the assignment/use of it too.
			And the get_players_for_role in pre_setup to put them into the allantags list to be sorted in the pick procs also has no restricted_jobs list on mind at that point also

		*/
		antag_candidates = get_players_for_role(ROLE_BANDIT)
		if(antag_candidates.len)
			for(var/i = 0, i < num_bandits, ++i)
				var/datum/mind/bandaids = pick_n_take(antag_candidates)
				if(!bandaids) // no candidates left as it cuts the list and sends something back
					break
				if(!(bandaids in allantags)) // We don't want to double dip... I guess? Two birds one stone tho, A already bandit check would check pre_bandits
					continue
				if(bandaids.assigned_role in GLOB.noble_positions) // Job cat string stoppers
					continue
				if(bandaids.assigned_role in GLOB.church_positions) // Many of these guys vanishing would suck
					continue
				if(bandaids.assigned_role in GLOB.serf_positions) // Many of these guys vanishing would suck
					continue

				allantags -= bandaids
				pre_bandits += bandaids

				bandaids.assigned_role = "Bandit"
				bandaids.special_role = ROLE_BANDIT

				bandaids.restricted_roles = restricted_jobs.Copy() // For posterities sake
				testing("[key_name(bandaids)] has been selected as a bandit")
				log_game("[key_name(bandaids)] has been selected as a bandit")
			for(var/antag in pre_bandits)
				GLOB.pre_setup_antags |= antag
			restricted_jobs = list() // We empty it here, but its also getting a new list on every relevant other pick proc rn so lol

/datum/game_mode/chaosmode/proc/pick_rebels()
	restricted_jobs = list() //handled after picking
	var/num_rebels = 0
	if(num_players() >= 7)
		num_rebels = CLAMP(round(num_players() / 3), 2, 3)
	if(num_rebels)
		antag_candidates = get_players_for_role(ROLE_PREBEL)
		if(antag_candidates.len)
			for(var/i = 0, i < num_rebels, ++i)
				var/datum/mind/rebelguy = pick_n_take(antag_candidates)
				if(!rebelguy)
					continue
				var/blockme = FALSE
				if(!(rebelguy in allantags))
					blockme = TRUE
				if(rebelguy.assigned_role in GLOB.garrison_positions)
					blockme = TRUE
				if(rebelguy.assigned_role in GLOB.noble_positions)
					blockme = TRUE
				if(rebelguy.assigned_role in GLOB.apprentices_positions)
					blockme = TRUE
				if(rebelguy.assigned_role in GLOB.church_positions)
					blockme = TRUE
				if(rebelguy.assigned_role in GLOB.serf_positions)
					blockme = TRUE
				if(blockme)
					continue
				allantags -= rebelguy
				pre_rebels += rebelguy
				rebelguy.special_role = "Peasant Rebel"
				testing("[key_name(rebelguy)] has been selected as a Peasant Rebel")
				log_game("[key_name(rebelguy)] has been selected as a Peasant Rebel")
	for(var/antag in pre_rebels)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/proc/pick_maniac()
	restricted_jobs = list("Lord",
	"Lady",
	"Merchant",
	"Priest")
	antag_candidates = get_players_for_role(ROLE_NBEAST)
	var/datum/mind/villain = pick_n_take(antag_candidates)
	if(villain)
		var/blockme = FALSE
		if(!(villain in allantags))
			blockme = TRUE
		if(villain.assigned_role in GLOB.apprentices_positions)
			blockme = TRUE
		if(villain.current)
			if(villain.current.gender == FEMALE)
				blockme = TRUE
		if(blockme)
			return
		allantags -= villain
		pre_villains += villain
		villain.special_role = "maniac"
		villain.restricted_roles = restricted_jobs.Copy()
		testing("[key_name(villain)] has been selected as the [villain.special_role]")
		log_game("[key_name(villain)] has been selected as the [villain.special_role]")
	for(var/antag in pre_villains)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/proc/pick_cultist()
	restricted_jobs = list("King",
	"Queen",
	"Merchant",
	"Priest")
	antag_candidates = get_players_for_role(ROLE_ZIZOIDCULTIST)
	var/datum/mind/villain = pick_n_take(antag_candidates)
	if(villain)
		var/blockme = FALSE
		if(!(villain in allantags))
			blockme = TRUE
		if(villain.assigned_role in GLOB.apprentices_positions)
			blockme = TRUE
		if(blockme)
			return
		allantags -= villain
		pre_cultists += villain
		villain.special_role = "cultist"
		villain.restricted_roles = restricted_jobs.Copy()
		testing("[key_name(villain)] has been selected as the [villain.special_role]")
		log_game("[key_name(villain)] has been selected as the [villain.special_role]")
	for(var/antag in pre_cultists)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/proc/pick_vampires()
	var/vampsremaining = 1
	restricted_jobs = list("Lord",
	"Lady",
	"Merchant",
	"Priest")
	antag_candidates = get_players_for_role(ROLE_NBEAST)
	antag_candidates = shuffle(antag_candidates)
	for(var/datum/mind/vampire in antag_candidates)
		if(!vampsremaining)
			break
		var/blockme = FALSE
		if(!(vampire in allantags))
			blockme = TRUE
		if(vampire.assigned_role in GLOB.noble_positions)
			blockme = TRUE
		if(vampire.assigned_role in GLOB.apprentices_positions)
			blockme = TRUE
		if(vampire.assigned_role in restricted_jobs)
			blockme = TRUE
		if(blockme)
			continue
		allantags -= vampire
		pre_vampires += vampire
		vampire.special_role = "vampire"
		vampire.assigned_role = "vampire" // This is a tricky way to prevent double-spawning for the spawn as multiple jobs.
		vampire.restricted_roles = restricted_jobs.Copy()
		testing("[key_name(vampire)] has been selected as a VAMPIRE")
		log_game("[key_name(vampire)] has been selected as a [vampire.special_role]")
		antag_candidates.Remove(vampire)
		vampsremaining -= 1
	for(var/antag in pre_vampires)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/proc/pick_lesser_vampires()
	var/vampsremaining = 1
	restricted_jobs = list("Lord",
	"Lady",
	"Merchant",
	"Priest")
	antag_candidates = get_players_for_role(ROLE_NBEAST)
	antag_candidates = shuffle(antag_candidates)
	for(var/datum/mind/vampire in antag_candidates)
		if(!vampsremaining)
			break
		var/blockme = FALSE
		if(!(vampire in allantags))
			blockme = TRUE
		if(vampire.assigned_role in GLOB.noble_positions)
			blockme = TRUE
		if(vampire.assigned_role in restricted_jobs)
			blockme = TRUE
		if(blockme)
			continue
		allantags -= vampire
		pre_vampires += vampire
		vampire.special_role = "vampire"
		vampire.assigned_role = "vampire" // This is a tricky way to prevent double-spawning for the spawn as multiple jobs.
		vampire.restricted_roles = restricted_jobs.Copy()
		testing("[key_name(vampire)] has been selected as a VAMPIRE")
		log_game("[key_name(vampire)] has been selected as a [vampire.special_role]")
		antag_candidates.Remove(vampire)
		vampsremaining -= 1
		lesser_vampires = TRUE
	for(var/antag in pre_vampires)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/proc/pick_werewolves()
	restricted_jobs = list("Acolyte","Priest","Adventurer","Confessor","Garrison Guard","Veteran","Royal Guard","Captain")
	var/werewolfsremaining = 1
	antag_candidates = get_players_for_role(ROLE_WEREWOLF)
	antag_candidates = shuffle(antag_candidates)
	for(var/datum/mind/werewolf in antag_candidates)
		if(!werewolfsremaining)
			break
		var/blockme = FALSE
		if(!(werewolf in allantags))
			blockme = TRUE
		if(werewolf.assigned_role in GLOB.noble_positions)
			blockme = TRUE
		if(werewolf.assigned_role in GLOB.apprentices_positions)
			blockme = TRUE
		if(werewolf.assigned_role in restricted_jobs)
			blockme = TRUE
		if(blockme)
			continue
		allantags -= werewolf
		pre_werewolves += werewolf
		werewolf.special_role = "werewolf"
		werewolf.restricted_roles = restricted_jobs.Copy()
		testing("[key_name(werewolf)] has been selected as a WEREWOLF")
		log_game("[key_name(werewolf)] has been selected as a [werewolf.special_role]")
		antag_candidates.Remove(werewolf)
		werewolfsremaining -= 1
	for(var/antag in pre_werewolves)
		GLOB.pre_setup_antags |= antag
	restricted_jobs = list()

/datum/game_mode/chaosmode/post_setup()
	set waitfor = FALSE
///////////////// VILLAINS
	for(var/datum/mind/traitor in pre_villains)
		var/datum/antagonist/new_antag = new /datum/antagonist/villain()
		addtimer(CALLBACK(traitor, TYPE_PROC_REF(/datum/mind, add_antag_datum), new_antag), rand(10,100))
		GLOB.pre_setup_antags -= traitor
		villains += traitor

///////////////// CULTIST

	for(var/datum/mind/cultist in pre_cultists)
		var/datum/antagonist/new_antag = new /datum/antagonist/zizocultist/leader()
		addtimer(CALLBACK(cultist, TYPE_PROC_REF(/datum/mind, add_antag_datum), new_antag), rand(10,100))
		GLOB.pre_setup_antags -= cultist
		cultists += cultist

///////////////// WWOLF
	for(var/datum/mind/werewolf in pre_werewolves)
		var/datum/antagonist/new_antag = new /datum/antagonist/werewolf()
		addtimer(CALLBACK(werewolf, TYPE_PROC_REF(/datum/mind, add_antag_datum), new_antag), rand(10,100))
		GLOB.pre_setup_antags -= werewolf
		werewolves += werewolf

///////////////// VAMPIRES
	pre_vampires = shuffle(pre_vampires)
	var/vamplordpicked = FALSE
	for(var/datum/mind/vampire in pre_vampires)
		if(!vamplordpicked && !lesser_vampires)
			var/datum/antagonist/new_antag = new /datum/antagonist/vampirelord()
			addtimer(CALLBACK(vampire, TYPE_PROC_REF(/datum/mind, add_antag_datum), new_antag), rand(10,100))
			GLOB.pre_setup_antags -= vampire
			vampires += vampire
			vamplordpicked = TRUE
		else
			var/datum/antagonist/new_antag = new /datum/antagonist/vampirelord/lesser()
			addtimer(CALLBACK(vampire, TYPE_PROC_REF(/datum/mind, add_antag_datum), new_antag), rand(10,100))
			GLOB.pre_setup_antags -= vampire
			vampires += vampire
///////////////// BANDIT
	for(var/datum/mind/bandito in pre_bandits)
		var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
		bandito.add_antag_datum(new_antag)
		GLOB.pre_setup_antags -= bandito
		bandits += bandito
		SSrole_class_handler.bandits_in_round = TRUE

///////////////// REBELS
	for(var/datum/mind/rebelguy in pre_rebels)
		var/datum/antagonist/new_antag = new /datum/antagonist/prebel/head()
		rebelguy.add_antag_datum(new_antag)
		GLOB.pre_setup_antags -= rebelguy

	..()
	//We're not actually ready until all traitors are assigned.
	gamemode_ready = FALSE
	addtimer(VARSET_CALLBACK(src, gamemode_ready, TRUE), 101)
	return TRUE

/datum/game_mode/chaosmode/proc/GetTownPower()
	var/townpower = 1
	var/list/towndefenders = list()
	towndefenders = GLOB.garrison_positions
	var/list/majordefenders = list("Captain")
	majordefenders |= "Court Magician"
	majordefenders |= "Priest"
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(H.mind?.assigned_role)
			if(H.mind.assigned_role in towndefenders)
				townpower += 1
			if(H.mind.assigned_role in majordefenders)
				townpower += 2
	return townpower

/datum/game_mode/chaosmode/proc/GetAntagPower()
	var/antagpower = 1
	for(var/mob/living/carbon/human/H in GLOB.human_list)
		if(H.mind?.special_role)
			antagpower += 2
	return antagpower

/datum/game_mode/chaosmode/make_antag_chance(mob/living/carbon/human/character) //klatejoin
	var/banditcap = GetTownPower() - GetAntagPower() //GLOB.joined_player_list.len / 10
	var/vampirecap = GetTownPower() - GetAntagPower()
	var/vampirelordalive = FALSE
	for(var/mob/living/carbon/human/i in vampires)
		var/datum/antagonist/vampirelord/lord = i.mind.has_antag_datum(/datum/antagonist/vampirelord)
		if(!lord.isspawn)
			vampirelordalive = TRUE
	var/list/possibleroles = list()
	if(ROLE_BANDIT in character.client.prefs.be_special)
		possibleroles |= ROLE_BANDIT
	if(ROLE_NBEAST in character.client.prefs.be_special)
		possibleroles |= ROLE_NBEAST
	if(possibleroles.len == 0)
		possibleroles |= "Nothing"
	var/pickedantag = pick(possibleroles)
	if((bandits.len + vampires.len) >= 4) //Caps number of latejoin antagonists
		return
	if(bandits.len <= banditcap)
		if(pickedantag == ROLE_BANDIT)
			if(character.client.whitelisted())
				if(age_check(character.client))
					if(!(character.job in restricted_jobs))
						var/datum/antagonist/new_antag = new /datum/antagonist/bandit()
						character.mind.add_antag_datum(new_antag)
						bandits += character.mind
						SSrole_class_handler.bandits_in_round = TRUE
						banditgoal += rand(200,400)
						return
	if(vampires.len <= vampirecap)
		if(pickedantag == ROLE_NBEAST && !vampirelordalive)
			if(character.client.whitelisted())
				if(age_check(character.client))
					if(!(character.job in restricted_jobs))
						lesser_vampires = TRUE
						character.mind.special_role = "vampire"
						character.mind.assigned_role = "vampire"
						testing("[key_name(character)] has been selected as a VAMPIRE")
						log_game("[key_name(character)] has been selected as a [character.mind.special_role]")
						var/datum/antagonist/new_antag = new /datum/antagonist/vampirelord/lesser()
						character.mind.add_antag_datum(new_antag)
						vampires += character.mind
						return
	return
//******** VILLAINS
	var/num_villains = round((num_players() * 0.30)+1, 1)
	if((villains.len + pre_villains.len) >= num_villains) //Upper cap for number of latejoin antagonists
		return
	if(ROLE_VILLAIN in character.client.prefs.be_special)
		if(!is_banned_from(character.ckey, list(ROLE_VILLAIN)) && !QDELETED(character))
			if(age_check(character.client))
				if(!(character.job in restricted_jobs))
					if(prob(66))
						add_latejoin_villain(character.mind)

/datum/game_mode/chaosmode/proc/add_latejoin_villain(datum/mind/character)
	var/datum/antagonist/villain/new_antag = new /datum/antagonist/villain()
	character.add_antag_datum(new_antag)

/datum/game_mode/chaosmode/proc/vampire_werewolf()
	var/vampyr = 0
	var/wwoelf = 0
	for(var/mob/living/carbon/human/player in GLOB.human_list)
		if(player.mind)
			if(player.stat != DEAD)
				if(isbrain(player)) //also technically dead
					continue
				if(is_in_roguetown(player))
					var/datum/antagonist/D = player.mind.has_antag_datum(/datum/antagonist/werewolf)
					if(D && D.increase_votepwr)
						wwoelf++
						continue
					D = player.mind.has_antag_datum(/datum/antagonist/vampire)
					if(D && D.increase_votepwr)
						vampyr++
						continue
	if(vampyr)
		if(!wwoelf)
			return "vampire"
	if(wwoelf)
		if(!vampyr)
			return "werewolf"
