/datum/job/roguetown/inquisitor
	title = "Inquisitor"
	flag = INQUISITOR
	department_flag = TEMPLE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = list(
		"Humen"
	)

	tutorial = "The Inquisitor is a member of the secretive lodges that have held to the service of the Forgotten God since the Apotheosis War. They have formed an alliance with the local Priest against the increasing number of heretics and monsters infiltrating the town."
	whitelist_req = FALSE

	outfit = /datum/outfit/job/roguetown/inquisitor
	advclass_cat_rolls = list(CTAG_INQUISITOR = 20)	//Handles class selection.
	display_order = JDO_INQUISITOR
	min_pq = 4
	bypass_lastclass = TRUE

/datum/job/roguetown/inquisitor/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(!L.mind)
		return
	if(L.mind.has_antag_datum(/datum/antagonist))
		return
	var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
	L.mind.add_antag_datum(new_antag)

/datum/job/roguetown/inquisitor/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/inquisitor // Default equipment.
	name = "Inquisitor"
	jobtype = /datum/job/roguetown/inquisitor
	gloves = /obj/item/clothing/gloves/roguetown/angle
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/keyring/inquisitor = 1)
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/flashlight/flare/torch/lantern

/* ! ! ! INQUISITOR CLASSES ! ! !
- Grenzelhoft: Thief.
- Zybantine: Mage.
- Issan: Fighter.
*/

/datum/advclass/inquisitor/grenz
	name = "Grenzelhoft Lodge"
	tutorial = "The most traditional lodge and the one that defines the image of 'witch hunters' today, the Eastern Lodge allied itself with House Grenz early on in the Imperiate's founding, and provides assistance to their brutal campaigns."
	outfit = /datum/outfit/job/roguetown/inquisitor/grenz

	category_tags = list(CTAG_INQUISITOR)
	allowed_sexes = list(MALE)

/datum/outfit/job/roguetown/inquisitor/grenz/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	pants = /obj/item/clothing/under/roguetown/trou/leather
	cloak = /obj/item/clothing/cloak/cape/puritan
	head = /obj/item/clothing/head/roguetown/helmet/leather/inquisitor
	backl = /obj/item/rogueweapon/sword/long/forgotten
	neck = /obj/item/clothing/neck/roguetown/bevor
	armor = /obj/item/clothing/suit/roguetown/armor/leather/splint
	var/prev_real_name = H.real_name
	var/prev_name = H.name
	var/honorary = "Ritter"
	if(H.gender == FEMALE)
		honorary = "Ritterin"
	H.real_name = "[honorary] [prev_real_name]"
	H.name = "[honorary] [prev_name]"
	H.confession_points = 10 // Starting with 10 points
	H.purchase_history = list() // Initialize as an empty list to track purchases

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.change_stat("intelligence", 2)
		H.change_stat("perception", 2)
		H.change_stat("speed", 2)
		H.change_stat("endurance", 1)
		if(!H.has_language(/datum/language/oldpsydonic))
			H.grant_language(/datum/language/oldpsydonic)
			to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")
		if(H.mind.has_antag_datum(/datum/antagonist))
			return
		var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
		H.mind.add_antag_datum(new_antag)
		if(H.patron != /datum/patron/forgotten)
			H.set_patron(/datum/patron/forgotten)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/living/carbon/human/proc/torture_victim

/datum/advclass/inquisitor/zyba
	name = "Zybantine Lodge"
	tutorial = "The Western Lodge houses the sorcerous cabal of the Magi, who claim to draw their magic from a mythical Torch of Knowledge. Though they claim alliance with other Lodges, many remark that their piety is unorthodox at best."
	outfit = /datum/outfit/job/roguetown/inquisitor/zyba

	category_tags = list(CTAG_INQUISITOR)

/datum/outfit/job/roguetown/inquisitor/zyba/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/neck/roguetown/keffiyeh/red
	neck = /obj/item/clothing/neck/roguetown/bevor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/red
	armor = /obj/item/clothing/suit/roguetown/armor/leather/splint
	shoes = /obj/item/clothing/shoes/roguetown/shalal
	pants = /obj/item/clothing/under/roguetown/tights/red
	wrists = /obj/item/clothing/neck/roguetown/psycross/silver
	var/prev_real_name = H.real_name
	var/prev_name = H.name
	var/honorary = "Pir"
	if(H.gender == FEMALE)
		honorary = "Pirani"
	H.real_name = "[honorary] [prev_real_name]"
	H.name = "[honorary] [prev_name]"
	H.confession_points = 10 // Starting with 10 points
	H.purchase_history = list() // Initialize as an empty list to track purchases

	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.change_stat("intelligence", 3)
	H.change_stat("perception", 2)
	H.change_stat("speed", 2)
	H.change_stat("endurance", 1)
	H.mind.adjust_spellpoints(4)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/learnspell)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	if(!H.has_language(/datum/language/zybantine))
		H.grant_language(/datum/language/zybantine)
		to_chat(H, "<span class='info'>I can speak Zybean with ,z before my speech.</span>")
	if(H.mind.has_antag_datum(/datum/antagonist))
		return
	var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
	H.mind.add_antag_datum(new_antag)
	if(H.patron != /datum/patron/forgotten)
		H.set_patron(/datum/patron/forgotten)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/living/carbon/human/proc/torture_victim

/datum/advclass/inquisitor/amz
	name = "Issan Lodge"
	tutorial = "A lodge on the mysterious isle of Issa, home of the humen warrior-women known as Amazons. Curiously, they worship the Forgotten God alongside the Divine Pantheon, and the lodge focuses on travelling Grimoria in search of holy artifacts."
	outfit = /datum/outfit/job/roguetown/inquisitor/amz

	category_tags = list(CTAG_INQUISITOR)
	allowed_sexes = list(FEMALE)

/datum/outfit/job/roguetown/inquisitor/amz/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/winged // dun dun da da daaa dah, dun dun DAAA da
	neck = /obj/item/clothing/neck/roguetown/psycross/silver
	armor = /obj/item/clothing/suit/roguetown/armor/amazon_chainkini
	backl = /obj/item/rogueweapon/polearm/spear
	shoes = /obj/item/clothing/shoes/roguetown/boots
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	var/prev_real_name = H.real_name
	var/prev_name = H.name
	var/honorary = "Mino" // Derived from the Minon regiment of the historical kingdom of Dahomey (now Benin).
	H.real_name = "[honorary] [prev_real_name]"
	H.name = "[honorary] [prev_name]"
	H.confession_points = 10 // Starting with 10 points
	H.purchase_history = list() // Initialize as an empty list to track purchases

	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
	H.change_stat("intelligence", 2)
	H.change_stat("strength", 3)
	H.change_stat("perception", 1)
	H.change_stat("speed", 1)
	H.change_stat("endurance", 1)
	if(!H.has_language(/datum/language/oldpsydonic))
		H.grant_language(/datum/language/oldpsydonic)
		to_chat(H, "<span class='info'>I can speak Old Psydonic with ,m before my speech.</span>")
	if(H.mind.has_antag_datum(/datum/antagonist))
		return
	var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
	H.mind.add_antag_datum(new_antag)
	if(H.patron != /datum/patron/forgotten)
		H.set_patron(/datum/patron/forgotten)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
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
					testing(painpercent)
					if((painpercent > 40) || (!H.cmode))
						H.emote("painscream")
						testing("Confession time, [painpercent] pain.")
						H.confession_time(src)
						return
			to_chat(src, "<span class='warning'>Not ready to speak yet.</span>")

/mob/living/carbon/human/proc/confession_time(mob/living/carbon/human/user)
	if(istype(src.buckled, /obj/structure/fluff/walldeco/chains)) // If the victim is on hanging chains, they cannot resist.
		confess_sins(resist=FALSE, user=user)
		return
	var/timerid = addtimer(CALLBACK(src, PROC_REF(confess_sins), FALSE, user), 6 SECONDS, TIMER_STOPPABLE)
	var/responsey = alert(src, "Resist torture? (1 TRI)","Time for Pain","Yes","No")
	testing("Sent resist request to [src].")
	testing(" User is [user]. confession_time")
	if(SStimer.timer_id_dict[timerid])
		deltimer(timerid)
	else
		to_chat(src, "<span class='warning'>Too late...</span>")
		testing("Torture timer ran out.")
		return
	if(responsey == "No")
		testing("[src] gave into torture.")
		confess_sins(resist=FALSE, user=user)
	if(responsey == "Yes")
		adjust_triumphs(-1)
		testing("[src] resisted torture.")
		confess_sins(resist=TRUE, user=user)

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
		testing(" User is [user]. confess_sins")
		for(var/datum/antagonist/antag in mind?.antag_datums)
			if(length(antag.confess_lines))
				confessions = antag.confess_lines
				antag_type = antag.name
				testing("Antag type: [antag_type]")
				break // Only need one antag type
		if(length(patron.confess_lines) && !length(confessions)) // The antag confession lines take precedence over the heretic lines. If there are antag lines, the heretic ones will not show.
			confessions = patron.confess_lines
			testing("Patron type: [patron.name]")
			antag_type = patron.name
		if(length(confessions))
			if(torture == TRUE) // Only scream your confession if it's due to torture.
				say(pick(confessions), spans = list("torture"))
			if(user.is_holding_item_of_type(/obj/item/paper/confession)) // This code is to process gettin a signed confession through torture.
				testing("User is holding a confession.")
				var/obj/item/paper/confession/held_confession = user.is_holding_item_of_type(/obj/item/paper/confession)
				if(!held_confession.signed) // Check to see if the confession is already signed.
					held_confession.signed = real_name
					held_confession.bad_type = "AN EVILDOER" // In case new antags are added with confession lines but have yet to be added here.
					switch(antag_type)
						if("Bandit")
							held_confession.bad_type = "AN OUTLAW OF THE THIEF-LORD"
							held_confession.antag = antag_type
						if("Matthios")
							held_confession.bad_type = "AN OUTLAW OF THE THIEF-LORD"
							held_confession.antag = "worshiper of" + antag_type
						if("Maniac")
							held_confession.bad_type = "A MANIAC IMMUNE TO PAIN"
							held_confession.antag = antag_type
						if("Assassin")
							held_confession.bad_type = "A DEATH CULTIST"
							held_confession.antag = antag_type
						if("Zizoid Lackey")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
							held_confession.antag = antag_type
						if("Zizoid Cultist")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
							held_confession.antag = antag_type
						if("Zizo")
							held_confession.bad_type = "A SERVANT OF THE FORBIDDEN ONE"
							held_confession.antag = "worshiper of" + antag_type
						if("Werewolf")
							held_confession.bad_type = "A BEARER OF DENDOR'S CURSE"
							held_confession.antag = antag_type
						if("Vampire")
							held_confession.bad_type = "A SCION OF KAINE"
							held_confession.antag = antag_type
						if("Vampire Lord")
							held_confession.bad_type = "THE BLOOD-LORD OF ENIGMA"
						if("Graggar")
							held_confession.bad_type = "A FOLLOWER OF THE DARK SUN"
							held_confession.antag = "worshiper of" + antag_type
						if("Peasant Rebel")
							return // Inquisitors don't care about peasant revolts targeting the King of Rockhill.
						if("Science")
							held_confession.bad_type = "A DAMNED ANTI-THEIST"
							held_confession.antag = "worshiper of nothing"
					held_confession.info = "THE GUILTY PARTY ADMITS THEIR SINFUL NATURE AS <font color='red'>[held_confession.bad_type]</font>. THEY WILL SERVE ANY PUNISHMENT OR SERVICE AS REQUIRED BY THE ORDER OF THE PSYCROSS UNDER PENALTY OF DEATH.<br/><br/>SIGNED,<br/><font color='red'><i>[held_confession.signed]</i></font>"
					held_confession.update_icon_state()
					return
	say(pick(innocent_lines), spans = list("torture"))
	return
