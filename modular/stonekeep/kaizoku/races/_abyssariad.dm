GLOBAL_LIST_INIT(abyssal_readme, world.file2list("strings/rt/abyssaltide.json"))

/mob/living/carbon/human/species/abyssariad
	race = /datum/species/abyssariad

/datum/species/abyssariad
	name = "foglander"
	id = "abyssariad"
	max_age = 1250 //The year Abyssariads have been created by Abyssor.
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT

/datum/species/abyssariad/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/abyssal)

/datum/species/abyssariad/get_accent_list()
	return strings("abyssal_replacement.json", "abyssal")

///mob/proc/banzai() //Don't have female 'Banzai' yells for that.
//	set name = "Banzai"
//	set category = "Noises"
//	emote("banzai")

/datum/species/abyssariad/check_roundstart_eligible()
	return FALSE

/datum/species/abyssariad/after_creation(mob/living/carbon/C)
	..()
//	if(!C.has_language(/datum/language/abyssal))
	C.grant_language(/datum/language/abyssal)
	to_chat(C, "<span class='info'>I can speak Abyssal with ,a before my speech.</span>")

/datum/species/abyssariad/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/abyssal)

/datum/species/abyssariad/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/abyssariad/get_skin_list()
	return sortList(list(
	"skin1" = "ffe0d1",
	"skin2" = "fcccb3"
	))


/datum/species/abyssariad/get_hairc_list()
	return sortList(list(
	"black - nightsky" = "0a0707",
	"brown - treebark" = "362e25",
	"blonde - moonlight" = "dfc999",
	"red - autumn" = "a34332"
	))


////////////////////////////////////////////////////////////////////////
// 	 Below this line, there is a bunch of wild assets. Be warned. 	  //
////////////////////////////////////////////////////////////////////////

/proc/clanfication(mob/living/carbon/human/H)
	var/index = findtext(H.real_name, " Clanless") //Find 'Clanless' where an 'Clanless' makes no sense to  exist.
	if(index)
		var/original_first_name = copytext(H.real_name, 1, index) //First name extraction.
		var/new_surname = H.dna.species.random_surname() //Generation of a generic clan surname for RP purposes.
		var/new_full_name = "[original_first_name][new_surname]" //Creates a new full name. "Firstname of Surname clan"
		H.change_name(new_full_name) //Applies the name.
		testing("[H.real_name] has been reassigned a surname: [new_full_name]") //Debuglog for information. Sometimes "(name) the of (surname) happens and I'M FUGGING GOING INSANE."

////////////////////////////////////
// 	 Fog Islands General Perks 	  //
//   Heartfelt characters have it. //
//   This is more to portray      //
// 	 Islander Culture itself.     //
////////////////////////////////////

/mob/proc/yoo()
	set name = "Yoo"
	set category = "Noises"
	emote("yoo")

/mob/proc/throatsing()
	set name = "Throatsing"
	set category = "Noises"
	emote("throatsing")

/mob/living/carbon/human/proc/abyssalcombat()
	set name = "Define War-Anthem"
	set category = "ABYSSAL"
	var/list/music_options = list(
		"Changeling" = 'modular/stonekeep/kaizoku/sound/combat/combat_changeling.ogg',
		"Storm Warrior" = 'modular/stonekeep/kaizoku/sound/combat/combat_stormwarrior.ogg',
		"Sea Raider" = 'modular/stonekeep/kaizoku/sound/combat/combat_searaider.ogg',
		"Old Tides" = 'modular/stonekeep/kaizoku/sound/combat/combat_oldtides.ogg',
		"Decapitator" = 'modular/stonekeep/kaizoku/sound/combat/combat_decapitator.ogg',
		"Emperor" = 'modular/stonekeep/kaizoku/sound/combat/combat_emperor.ogg',
		"Traditional" = 'modular/stonekeep/kaizoku/sound/combat/combat_traditional.ogg',
		"Naval Retainers" = 'modular/stonekeep/kaizoku/sound/combat/combat_navalretainers.ogg',
		"Kyudo" = 'modular/stonekeep/kaizoku/sound/combat/combat_kyudo.ogg'
	)
	var/battlesong = input(src, "Choose your War-Anthem", "Abyssal Combat") as null|anything in music_options
	if(!battlesong)
		return
	src.cmode_music = list(music_options[battlesong])
	to_chat(src, "<span class='greentext'>Your War-Anthem is now: [battlesong]</span>")


/mob/proc/abyssaltide()
	set name = "The Nautical Oath"
	set category = "ABYSSAL"

	var/json_data = list(
		"Loyalty to the Tide" = list(
			"quote" = "To betray is to forever sever the lifeblood of the Abyssariad soul. Loyalty is the shield of essence, what gives love, hierarchy, and duty meaning. But from others, betrayal comes easy - that's where the whalers falter.",
			"description" = "Explanation: It is paramount to cherist loyalty to the lord, spouse and duty. Among abyssariads, betrayal is rare due to collectivistic and monogamic nature. However, with the belief that other races are prone to betrayal, they hold distrust, but that's no law. Betrayal of one's crew or mission strips an Abyssariad of their honor.",
			"sin" =  "Sin of pride, the delusion of standing above the collective, divine justice and law, denying the balance of tides. It is the sin of oath breakers who rejects the natural order and retribution.",
			"nonperson" = "Desecrant: Ronins, Tower-Yakkos, Kabuki-marus, deserters, corrupt bureaucrats."
		),
		"Dignity in Victory and Defeat" = list(
			"quote" = "Victory and Defeat are two respectful sides of the same blade, but only those who yield allow the blade to turn inward to themselves.",
			"description" = "Explanation: Abyssariads respect fallen enemies unless those demonic in nature. In defeat, they prioritize retreat or dealing with consequences over surrender, as it is the ultimate disgrace warranting of self-disembowelment. In sparring, competitos are always equal, regardless of victory or defeat.",
			"sin" =  "Sloth, the decay of a warrior's spirit, becoming dead weight that leeches off others' work, abandoning duty, neglecting training and responsibilities.",
			"nonperson" = "Desecrant: Beggars without monastic oath, vagrants, anyone unwilling to work at anything- no tilling the field, no carpetry, nor battling, sucking from the governmental aid while not having disability. The latter rarely saw anywhere outside of Fog Islands."
		),
		"Spurn the Corrupt and Wicked" = list(
			"quote" = "Stay vigilant against the twisted mockeries of demonic taint. One must purge the defilers and their ilk as warriors of purity.",
			"description" = "Explanation: Abyssariads are dedicated to maintaining purity through vigilance against demonic corruption. They are often at odds with Tieflings and in direct conflict with goblins, orcs, demons, and zizo cultists, who are considered distortions of nature within their religious fold and culture.",
			"sin" =  "the Sin of Gluttony, in which excess leads to moral degradation and weakens discipline. Feasting while others hunger, and overindulging in intoxicants, makes one unfit for war.",
			"nonperson" = "Desecrant: Corrupt wealth-hoarders, warriors whom overindulges in alcohol to the point of becoming vulnerable, sycophantic leaders that let their warriors fight without reward."
		),
		"Resist Graggarious Temptations" = list(
			"quote" = "Reject demonic lure, as their corruption leads only to ruin. They may promise many, but all that is delivered is nothing but a noose that tightens each sin. The Whales fell from grace, so pure souls should not have their minds touched by their unworthiness.",
			"description" = "Explanation: One must resist the ultimate degradation of spirit- sin, disguised as desires, whispers and intrusive thoughts. Demonic wiles abuses the frail-minded. Discipline and meditation anchors one into light. Hence, prostitution is illegal in Fog Islands, and relationships with 'whaler' non-foglanders considered corrupting.",
			"sin" =  "Sin of Lust: Lust leads to corruption, weakens discipline and makes one vulnerable to demonic temptation. Hedonism brings decadence, prioritizing pleasure over morals, corrupting marriage and loyalty and seducing others to follow suit. Living for the thrill instead of duty, succubus corruption taints the soul of their victims that way.",
			"nonperson" = "Desecrant: Prostitutes, from high(Oiran) to low society(Tea girls)."
		),
		"Respect the Tools of Labor" = list(
			"quote" = "A weapon might defend a life, but the plow is what sustains it. You must not withdraw what your victims require for survival-if they meet death, it will be one less to supply the kin.",
			"description" = "Explanation: Excessive raiding is a grave offence, since sustainability is vital. Sacred tools that sustains life should not be taken as it will lead to indirect murder. Armor, weapons and luxuries are the focus for raids.",
			"sin" =  "Greed is the hoarding of excess, as without purpose, leads to barren lands and corruption, forsaking loyalty for coin. Avarice disrupt the natural cycle of sustenance, turning warriors into nothing but thieves.",
			"nonperson" = "Desecrant: loot-hungry wokous that pillages indiscriminately to the point of complete annihilation. Any thief."
		),
		"Combatants Weigh Their Choices" = list(
			"quote" = "Enemies who hold their blade with killing intention have chosen their path. Enemies who have chosen their path will be dispatched and exposed in failure. Enemies who yield shall receive mercy. Make them fear, make the men reward the Abyssariads at their doorstep as tamed animals. For the day as iron is sacrificed on their sandy beaches will be the day the raided will suffer no more.",
			"description" = "Explanation: In battles, combatants must be annihilated. Unarmed civilians and those who yield must be spared, as fear tames the men into submission. Visible signs of Abyssor worship on the coastline are signals of successful proselytization.",
			"sin" =  "Envy is the anchor of weak men. Taking over or sabotaging fellow men binds the soul to envy. One must seek wisdom from the past rather than expect the downfall of the present.",
			"nonperson" = "Desecrant: The Abyssanctum Traditionalists after their defeat in the Abyssanctum's Schism."
		),
		"Preservation of Wisdom" = list(
			"quote" = "Culture is not merely an inheritance; it is a flame that must be kept alive. Through them, what is lost to them becomes the light that guides the future as long it is uncorrupted. Seeing the errors of their ways allows us to learn on their behalf.",
			"description" = "Explanation: Preserving knowledge is sacred and long it is not demon-sourced, as empires rises and fall, the duty becomes to preserve their wisdom and integrate ancient texts, technology and arts to current day life. This mentality has kept Abyssal's Blood-Apotheosis foundations even after millennia, when bronze long became obsolete.",
			"sin" =  "The sin of ignorance, willfully neglecting growth and truth for misinformation and stagnation. It further eroses the world's unity and invites demonic influence to the world.",
			"nonperson" = "Desecrant: Book burners, artifact-destroyers, zealots that rejects knowledge in favor of dogma."
		),
		"The Path of the Blade" = list(
			"quote" = "A blade guided by justice cuts cleanly; justified in war and law. Yet personal vendettas are the realm of cowards, where the heart invites ruin as a demonic gateway of Wraith.",
			"description" = "Assassinations should be for warfare and justice alone, never personal revenge. lawful duel is what settle matters. Unlawful assassinations taints the soul and leads to Graggar alure.",
			"sin" =  "The sin of wrath is the loss of discipline, when emotions dictates actions over abyssal ways. Giving in to rage leads to mindless killing, unlawful duels outside natural oath, unnecessary torture and cruelty. Death or cultural absorption must be prefered over slavery.",
			"nonperson" = "Desecrant: Mindless killers who praise the acts of Graggar, slavers and zapists. This oath ensured lack of slavery on Fog islands. (Foglanders executors, the Kaishakunin, are considered holy and untouched by Graggar's ways.)"
		)
	)

	var/text = ""
	for (var/section in json_data)
		var/quote = json_data[section]["quote"]
		var/description = json_data[section]["description"]
		var/sin = json_data[section]["sin"]
		var/nonperson = json_data[section]["nonperson"]

		text += "<h2>[section]</h2>"
		text += "<p><strong style='color:white;'>[quote]</strong></p>"  // Bold white for quotes
		text += "<p><em style='color:white;'>[description]</em></p>"  // Italic white for description
		text += "<p><span style='color:red;'>[sin]</span></p>"  // Red for sin
		text += "<p><span style='color:yellow;'>[nonperson]</span></p>"  // Yellow for non-person
		text += "<hr>"

	var/html_content = "<html>\
		<head>\
			<style>\
				body { font-family: Arial, sans-serif; background-color: #101820; color: #F2AA4C; padding: 10px; }\
				h1 { color: #FFD700; text-align: center; }\
				h2 { color: #F2AA4C; margin-top: 15px; }\
				p { color: #EEE; }\
				.important { color: #E63946; font-weight: bold; }\
				.center { text-align: center; }\
			</style>\
		</head>\
		<body>\
			<h1>The Nautical Oath</h1>\
			<p class='center'><i>The Abyssariads are the living extensions of Abyssor, and to break one's honor is to insult both Him and the Championage. Such a transgression condemns one to become a Burakumin, cast from the grace. The eyes of the Abyss finds lies deeper than itself, and this fate is worse than death. The soul no longer belongs to itself, stripped of immortality, bound to become a demonic Dai. The unhonor mask is nothing but a final mercy in case one transforms. To obtain salvation, one must repent and be purified.</i></p>\
			<hr>\
			[text]\
		</body>\
	</html>"

	var/datum/browser/popup = new(src, "Nautical Oath", "Warning. This is a RP tool, not a guideline or forced directions.", 460, 550)
	popup.set_content(html_content)
	popup.open()

/datum/species/abyssariad/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		var/list/accent_words = strings("spellcheck.json", "spellcheck")

		//var/failed = FALSE
		var/mob/living/carbon/human/H
		if(ismob(source))
			H = source
		for(var/key in accent_words)
			var/value = accent_words[key]
			if(islist(value))
				value = pick(value)

			if(findtextEx(message,key))
				if(H)
					to_chat(H, "<span class='warning'>[key] -> [value]</span>")
				amtfail++
				//failed = TRUE

			message = replacetextEx(message, "[key]", "[value]")

	if(message)
		if(message[1])
			if(message[1] != "*")
				message = " [message]"
				var/list/accent_words = strings("abyssal_replacement.json", "abyssal")

				for(var/key in accent_words)
					var/value = accent_words[key]
					if(islist(value))
						value = pick(value)

					message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
					message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
					message = replacetextEx(message, " [key]", " [value]")

		var/list/species_accent = get_accent_list()
		var/mob/living/carbon/human/human
		if(ismob(source))
			human = source
			if((human.accent != ACCENT_DEFAULT))
				species_accent = human.return_accent_list()

		if(species_accent)
			if(message[1] != "*")
				message = " [message]"
				for(var/key in species_accent)
					var/value = species_accent[key]
					if(islist(value))
						value = pick(value)

					message = replacetextEx(message, " [uppertext(key)]", " [uppertext(value)]")
					message = replacetextEx(message, " [capitalize(key)]", " [capitalize(value)]")
					message = replacetextEx(message, " [key]", " [value]")

	speech_args[SPEECH_MESSAGE] = trim(message)

////////////////////////////////////
// 	 Skylancer Unique Perks 	  //
//   Bird sounds                  //
//   General Sound Mimicry        //
//	 Flying                       //
// 	 Soundeffects for RP here     //
////////////////////////////////////

/mob/proc/birdcall()
	set name = "Birdcall"
	set category = "Noises"
	emote("birdcall")

/mob/living/carbon/human/proc/fly() //Updated version of the Skylancer's flight, without 'wing-hand' spawning. Empty hands will only be required in changing Z-levels.
	set name = "Stretch Wings"
	set category = "ABYSSAL"

	if(movement_type & FLYING) //If you are already flying, you will simply cease flying after clicking twice.
		stop_flight()
		return
	if(!check_light_armor()) //checks for armor weight.
		to_chat(src, "<span class='warning'>This armor weights you down far too much.</span>")
		return
	if((max_energy - stamina) <= 40)
		to_chat(src, "<span class='warning'>Too exhausted... to fly...</span>")
		return
	visible_message("<span class='warning'>[src] spreads their wings and starts to take flight.</span>")
	if(do_after(src, 20, target = src))
		start_flight() //Proc to start the flight. Check below.

/mob/living/carbon/human/proc/check_light_armor() //More compact version of the Dodge perk.
	if(istype(src.wear_armor, /obj/item/clothing))
		var/obj/item/clothing/CL = src.wear_armor
		if(CL.armor_class == AC_HEAVY || CL.armor_class == AC_MEDIUM)
			return FALSE
	if(istype(src.wear_shirt, /obj/item/clothing))
		var/obj/item/clothing/CL = src.wear_shirt
		if(CL.armor_class == AC_HEAVY || CL.armor_class == AC_MEDIUM)
			return FALSE
	if(istype(src.wear_pants, /obj/item/clothing))
		var/obj/item/clothing/CL = src.wear_pants
		if(CL.armor_class == AC_HEAVY || CL.armor_class == AC_MEDIUM)
			return FALSE
	return TRUE

/mob/living/carbon/human/proc/start_flight()
	if(movement_type & FLYING) // Anti-looping measure.
		return
	movement_type |= FLYING
	playsound(src, 'sound/vo/mobs/bird/birdfly.ogg', 100, TRUE)
	visible_message("<span class='warning'>[src]'s body rises from the ground.</span>")
	src.add_movespeed_modifier(MOVESPEED_ID_LEGCUFF_SLOWDOWN, multiplicative_slowdown = 3) //Makes you slow. Not putting this as processing. That would surely lag to hell.

	if(!flight_processing)
		flight_processing = TRUE
		process_flight()

/mob/living/carbon/human/proc/process_flight()
	if(!(movement_type & FLYING)) // Just stops flight if no longer flying. Another anti-looping measure.
		flight_processing = FALSE
		return
	if(!adjust_stamina(5, "tired", TRUE, FALSE)) //Changed to correct stamina logic: the more exhausted, the less this will succeed.
		to_chat(src, "<span class='danger'>You're too exhausted to stay airborne!</span>")
		playsound(src, 'sound/vo/mobs/bird/birdfly.ogg', 100, TRUE)
		stop_flight() //Got exhausted? claps you down automatically. You deserved it you little bugger.
		return TRUE
	addtimer(CALLBACK(src, .proc/process_flight), 10) //Stamina drainage loop system.

/mob/living/carbon/human/proc/stop_flight()
	if(!(movement_type & FLYING)) //If you're already on the ground, you're fine. This exists mostly to avoid runtimes.
		return
	movement_type &= ~FLYING
	flight_processing = FALSE // Ensures that stamina processing stops COMPLETELY to ENSURE no additional lag.
	visible_message("<span class='warning'>[src] flutters down and lands gracefully.</span>")
	playsound(src, 'sound/vo/mobs/bird/birdfly.ogg', 100, TRUE)
	src.remove_movespeed_modifier(MOVESPEED_ID_LEGCUFF_SLOWDOWN) //It is okay. You can walk away with respect now.

	var/turf/T = get_turf(src) //falldown check. I hope you are going to break your hollow bones.
	if(istype(T, /turf/open/transparent/openspace)) //checks if the Skylancer is on an openspace. This is to avoid 'floating' while not flying.
		to_chat(src, "<span class='warning'>With no solid ground beneath, you plummet.</span>")
		var/turf/target = get_step_multiz(src, DOWN)
		if(target)
			var/levels = 1 // Assumes that the person is on one level. Otherwise, get clapped twice. HAHA
			ZImpactDamage(target, levels)
			if(ismob(pulling))
				src.pulling.forceMove(target)
			src.forceMove(target)
			src.start_pulling(pulling,supress_message = TRUE) // Teleport the silly person. If they are on another Z-level above, then that's their fault. Get clapped ONCE MORE.

/mob/living/carbon/human/proc/fly_up() //The code is not working on Stonelin port. But it was working on Stonekeep.
	set name = "Fly Up"
	set category = "ABYSSAL"
	var/obj/item/mainhand = get_active_held_item()
	var/obj/item/offhand = get_inactive_held_item()
	var/turf/target = get_step_multiz(src, UP)
	var/turf/ceiling = get_step_multiz(src, UP)
	if(!(movement_type & FLYING)) //First off, ensure that the player is not flying.
		to_chat(src, "<span class='warning'>I need to be airborne first.</span>")
		return
	if(stamina > 50) //Correct stamina logic: The lower your stamina, the closer to exhaustion you are.
		to_chat(src, "<span class='warning'>Too exhausted to fly up...</span>")
		return
	else if(!istransparentturf(ceiling)) //Third off, you cannot invade other people's home by sticking out your head from the floorboard.
		to_chat(src, "<span class='warning'>A ceiling above my head prevents me from flying up.</span>")
		return
	if(mainhand && istype(mainhand, /obj/item))
		to_chat(src, "<span class='warning'>I need empty hands to achieve further heights!</span>") //Debuff; You must have nothing in your hands.
		return
	if(offhand && istype(offhand, /obj/item))
		to_chat(src, "<span class='warning'>I need empty hands to achieve further heights!</span>")
		return
	adjust_stamina(10, "tired", TRUE, FALSE) //High fatigue cost for moving in the vertical. You're using your own body weight against yourself here.
	visible_message("<span class='info'>[src] flies upward.</span>")
	playsound(src, 'sound/combat/hits/whip.ogg', 100, TRUE)
	if(do_after(src, 30, target = src))
		var/pulling = src.pulling
		if(ismob(pulling))
			src.pulling.forceMove(target)
		src.forceMove(target)
		src.start_pulling(pulling, supress_message = TRUE)

////////////////////////////////////
// 	 Ogrun Unique Perks      	  //
//   Mostly just the Warcry       //
//   Most proper for savagery     //
// 	 Give me idea for RP tools.   //
////////////////////////////////////

/mob/living/carbon/human/proc/warcry()
	set name = "Orcish Heritage"
	set category = "ABYSSAL"

	adjust_stamina(-50, "tired", TRUE, FALSE) // Costs a lot of stamina.
	adjust_energy(-15) // also takes from the blue bar

	if(src.cmode) //if NOT combat mode, heal.
		visible_message("<span class='danger'>[src] shakes the area with an intense scream.</span>")
		src.emote("rage", forced = TRUE)
		var/list/affected = hearers(6, src) // Targets all mobs in a 6-tile radius
		for(var/mob/living/A in affected)
			if(A == src)
				continue // Avoid affecting the user.
			if(A.stat >= DEAD)
				continue // The dead cannot hear you. I will find a way later to make the deaf Immune to 'shaken', or throw an Int check.
			if(!A.has_status_effect(/datum/status_effect/debuff/shaken))
				A.apply_status_effect(/datum/status_effect/debuff/shaken)
	else
		if(!has_status_effect(/datum/status_effect/debuff/withdrawal)) //NOT meant to recover from WOUNDS. It is a tug-of-war of your hemorrhage vs blood recovery.
			apply_status_effect(/datum/status_effect/debuff/withdrawal)
			apply_status_effect(/datum/status_effect/buff/recovery) //Recovery is meant to allow you to survive after intense fights, after losing too much blood.
			to_chat(src, "<span class='warning'>Your body starts to repair muscle tissue by breaking itself down and regenerating anew.</span>")
		else
			to_chat(src, "<span class='warning'>Due to recent physical stress, your body is unable to recover now.</span>")
			return

////////////////////////////////////
// 	 Changeling Special Trait 	  //
//   Kitsune/Humiko/Doppelganger  //
//   The options are broader so   //
//   it fits their reference.     //
////////////////////////////////////

/mob/living/carbon/human/var/shapeshifted = FALSE
/mob/living/carbon/human/var/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/shapeshifted_form = null

/mob/living/carbon/human/proc/toggle_shapeshift()
	set name = "Shapeshift"
	set category = "ABYSSAL"

	if(shapeshifted) //If the Changeling is manifestating Shapeshifting, reverts to normal.
		revert_shapeshift()
		return

	var/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/fox_shaped = new /mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest(loc) //This code specifically creates a new animal.
	if(!fox_shaped)
		return

	fox_shaped.mind = src.mind //This code specifically transfers the user mind to the new body.
	fox_shaped.real_name = src.real_name //This preserves the user's name.
	fox_shaped.health = src.health //This is supposed to sync health, but it is not really working.
	fox_shaped.shapeshifted = TRUE //Ensures the player will come back as a non-shifter later.
	fox_shaped.shapeshift_owner = src //Just a rather unimportant tracking.

	src.loc = fox_shaped //This area of the code keeps the player 'on' the fox, and make the original body invisible.
	src.invisibility = 101
	src.anchored = TRUE
	src.shapeshifted = TRUE
	src.shapeshifted_form = fox_shaped

	fox_shaped.verbs |= /mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/proc/revert_shapeshift //So the player can come back as a normal player.
	visible_message("<span class='warning'>[src] contorts and shifts into a monstrous spider!</span>") //People will now know.
	src.mind.transfer_to(fox_shaped)

/mob/living/carbon/human/proc/revert_shapeshift() //Autism part of the code.
	if(!shapeshifted || !shapeshifted_form)
		return

	var/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/spider_form = shapeshifted_form
	if(!spider_form || !spider_form.mind)
		return

	src.loc = spider_form.loc //Changeling body? Go to Kitsunebi.
	invisibility = 0 //Makes the Changeling body visible again.
	anchored = FALSE //No longer anchored to the Kitsunebi.

	if(spider_form.mind)
		spider_form.mind.transfer_to(src) //Kitsunebi-To-Person interaction.
	visible_message("<span class='warning'>[spider_form] writhes and returns to their original form.</span>")
	qdel(spider_form)
	shapeshifted = FALSE
	shapeshifted_form = null

/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/var/shapeshifted = FALSE
/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/var/mob/living/carbon/human/shapeshift_owner = null

/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/proc/revert_shapeshift_on_death()
	if (!shapeshifted || !shapeshift_owner)
		return

	var/mob/living/carbon/human/original = shapeshift_owner
	if (!original || !src.mind) // Ensure the original body and mind exist
		return

	// Transfer mind back
	src.mind.transfer_to(original)

	// Reveal the human form
	original.invisibility = 0
	original.anchored = FALSE

	// Notify reversion
	visible_message("<span class='warning'>[src] collapses, twisting back into their original form.</span>")

	// Remove spider body
	qdel(src)

/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/New()
	..()
	verbs |= /mob/living/carbon/human/proc/toggle_shapeshift

/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/death(gibbed)
	revert_shapeshift()

	. = ..()

/mob/living/simple_animal/hostile/retaliate/rogue/spider/changelingtest/proc/revert_shapeshift()
	if(!shapeshifted || !shapeshift_owner)
		return

	var/mob/living/carbon/human/human_form = shapeshift_owner
	if(!human_form)
		return

	// Move the player back to their human body
	human_form.loc = src.loc
	human_form.invisibility = 0
	human_form.anchored = FALSE

	// Restore mind if present
	if(src.mind)
		src.mind.transfer_to(human_form)

	// Notify reversion
	visible_message("<span class='warning'>[src] writhes and returns to their original form.</span>")

	// Destroy the spider form
	qdel(src)

	// Reset human variables
	human_form.shapeshifted = FALSE
	human_form.shapeshifted_form = null

/mob/living/carbon/human/proc/toggle_changeling_maw()
	set name = "Expose Illusion"
	set category = "ABYSSAL"
	var/icon_path = (gender == FEMALE) ? 'modular/stonekeep/kaizoku/icons/abyssariad_bodies/female/ft_kit.dmi' : 'modular/stonekeep/kaizoku/icons/abyssariad_bodies/male/mt_kit.dmi'

	var/image/open_maw = image(icon_path, "eldritch_maw")
	var/image/closed_maw = image(icon_path, "eldritch_maw_closed")

	overlay_eldritchjaw = !overlay_eldritchjaw // Toggle state

	if(overlay_eldritchjaw)
		cut_overlay(closed_maw)
		remove_overlay(closed_maw)
		add_overlay(open_maw)
		visible_message("<span class='warning'>[src]'s face splits into a deadly maw.</span>")
		to_chat(src, "<span class='warning'>With your maw exposed, your teeth becomes deadlier.</span>")
		playsound(src.loc, 'sound/combat/fracture/fracturewet (2).ogg', 50, 1)
		ADD_TRAIT(src, TRAIT_STRONGBITE, TRAIT_GENERIC)

		if("tail_human" in dna.features)
			dna.features["tail_human"] = "Threetails"
		if("ears" in dna.features)
			dna.features["ears"] = "Lying"
	else
		cut_overlay(open_maw)
		remove_overlay(open_maw)
		add_overlay(closed_maw)
		visible_message("<span class='warning'>[src]'s face knits together.</span>")
		playsound(src.loc, 'sound/combat/fracture/fracturewet (2).ogg', 50, 1)

		if("tail_human" in dna.features)
			dna.features["tail_human"] = "Onetail"
		if("ears" in dna.features)
			dna.features["ears"] = "Upright"
		to_chat(src, "<span class='warning'>Your teeth becomes hidden under the lips.</span>")
		REMOVE_TRAIT(src, TRAIT_STRONGBITE, TRAIT_GENERIC)

	// Apply Changes
	update_mutant_bodyparts()
	update_icon()
	update_body()

/mob/living/proc/changeling_devour_target(var/mob/living/L)
	if(!L || !ismob(L) || L.stat < UNCONSCIOUS)
		return

	var/devour_delay
	if(L.stat == DEAD)
		devour_delay = 60 //The muscle of the dead does not struggle. So it will be fast.
	else if(L.stat == UNCONSCIOUS)
		devour_delay = 360 //Their body will put a fight. The true reason is, if the target is sleeping - does not quickly eat them.
	changeNext_move(mmb_intent.clickcd)
	face_atom(L)
	visible_message(span_danger("[src] begins grotesquely devouring [L]'s flesh"))
	playsound(src.loc, 'sound/gore/flesh_eat_03.ogg', 50, 1)
	if(!do_after(src, devour_delay, target = L))
		return
	var/selected = check_zone(src.zone_selected)
	var/obj/item/bodypart/part = L.get_bodypart(selected)

	if(part)
		if(selected in list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)) //Any limb can be easily devoured.
			part.dismember()
			to_chat(src, span_bloody("You've feasted upon the creature's limb, the muscles nourish you."))
			playsound(src.loc, 'sound/combat/dismemberment/dismem (1).ogg', 50, 1)
			qdel(part)
			src.reagents.add_reagent(/datum/reagent/consumable/nutriment, SNACK_DECENT)
			return
		if(selected == BODY_ZONE_HEAD) //The head is the good part.
			part.dismember()
			to_chat(src, span_bloody("You've relished on the gray matter. Fatty, tender, and juicy. All your body needs."))
			playsound(src.loc, 'sound/combat/dismemberment/dismem (1).ogg', 50, 1)
			qdel(part)
			src.reagents.add_reagent(/datum/reagent/consumable/nutriment, SNACK_NUTRITIOUS)
			src.apply_status_effect(/datum/status_effect/buff/foodbuff)
			return
		if(selected == BODY_ZONE_CHEST) //Dangerous. I can't fix GIB.
			var/list/remaining = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_HEAD)
			for(var/z in remaining)
				if(L.get_bodypart(z))
					to_chat(src, "<span class='warning'>You must devour all limbs and the head before reaching the torso.</span>")
					return
			if(!part.dismember())
				L.gib()
			to_chat(src, span_bloody("You relish upon what remains, collapsing the corpse into nothing but organs."))
			playsound(src.loc, 'sound/combat/dismemberment/dismem (1).ogg', 50, 1)
			src.reagents.add_reagent(/datum/reagent/consumable/nutriment, SNACK_DECENT)
			return

	// Final fallback for simple mobs or unrecognized forms
	to_chat(src, span_bloody("You tear into [L]'s flesh!"))
	playsound(src.loc, 'sound/gore/flesh_eat_03.ogg', 50, 1)
	L.gib()
	to_chat(src, span_bloody("You devour such a simple creature, the flesh of no proper quality."))
	playsound(src.loc, 'sound/combat/dismemberment/dismem (1).ogg', 50, 1)
	src.reagents.add_reagent(/datum/reagent/consumable/nutriment, SNACK_DECENT)

//This entire code does not work, as misgendering is happening no matter what.
/*
/mob/living/carbon/human/proc/toggle_mimicry(mob/living/carbon/human/target)
	set name = "Mimicry"
	set category = "ABYSSAL"

	if (verbs.Find(/mob/living/carbon/human/proc/return_to_original_form))
		to_chat(src, "You are already transformed, dumbass.")
		return

	if (!target || target == src || !ishuman(target))
		to_chat(src, "This target cannot be used.")
		return

	visible_message("[src]'s form distorts and reshapes into [target].")

	// Store original form — only once
	if (!true_original_form)
		true_original_form = list(
			dna.uni_identity,                // 1
			dna.unique_enzymes,              // 2
			real_name,                       // 3
			name,                            // 4
			dna.species,                     // 5
			gender,                          // 6
			hairstyle,                       // 7
			hair_color,                      // 8
			eye_color,                       // 9
			facial_hairstyle,                // 10
			facial_hair_color,               // 11
			skin_tone,                       // 12
			dna.features["tail_human"],      // 13
			dna.features["ears"]             // 14
		)

	// Store original gender (separately, permanent)
	if (original_gender_mimicry == null)
		original_gender_mimicry = gender

	// Copy identity
	dna.uni_identity = target.dna.uni_identity
	dna.unique_enzymes = target.dna.unique_enzymes
	real_name = target.dna.real_name
	name = target.get_visible_name()

	// Copy visual appearance
	gender = target.gender
	hairstyle = target.hairstyle
	hair_color = target.hair_color
	eye_color = target.eye_color
	facial_hairstyle = target.facial_hairstyle
	facial_hair_color = target.facial_hair_color
	skin_tone = target.skin_tone
	dna.features["tail_human"] = target.dna.features["tail_human"]
	dna.features["ears"] = target.dna.features["ears"]

	updateappearance(mutcolor_update = TRUE)

	// Reassert target gender to be safe
	addtimer(CALLBACK(src, PROC_REF(force_gender_reapply), target.gender), 1)

	verbs |= /mob/living/carbon/human/proc/return_to_original_form
	verbs -= /mob/living/carbon/human/proc/toggle_mimicry

/mob/living/carbon/human/proc/return_to_original_form()
	set name = "Revert Mimicry"
	set category = "ABYSSAL"

	if (!true_original_form)
		to_chat(src, "No original form stored!")
		return

	visible_message("[src]'s skin ripples and shifts back to normal.")

	var/list/o = true_original_form

	dna.uni_identity = o[1]
	dna.unique_enzymes = o[2]
	real_name = o[3]
	name = o[4]
	dna.species = o[5]
	gender = o[6]
	hairstyle = o[7]
	hair_color = o[8]
	eye_color = o[9]
	facial_hairstyle = o[10]
	facial_hair_color = o[11]
	skin_tone = o[12]
	dna.features["tail_human"] = o[13]
	dna.features["ears"] = o[14]

	updateappearance(mutcolor_update = TRUE)

	// FULL force gender restoration (after visual update)
	addtimer(CALLBACK(src, PROC_REF(force_gender_reapply), original_gender_mimicry), 1)

	verbs -= /mob/living/carbon/human/proc/return_to_original_form
	verbs |= /mob/living/carbon/human/proc/toggle_mimicry
	src.transformed = null

/mob/living/carbon/human/proc/force_gender_reapply(desired_gender)
	if(desired_gender != MALE && desired_gender != FEMALE)
		return
	if(gender != desired_gender)
		gender = desired_gender
		updateappearance(mutcolor_update = TRUE)
*/
