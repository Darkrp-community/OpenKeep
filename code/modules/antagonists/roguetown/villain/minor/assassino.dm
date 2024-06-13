/datum/antagonist/assassino
	name = "Assassin"
	roundend_category = "Assassins"
	antagpanel_category = "Assassin"
	job_rank = ROLE_ASSASSIN
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "assassin"
	confess_lines = list("I am the terror that lurks in the night.", "I am the one who climbs the roof tops.", "I keep the children up at night, making them pray their throats don't get slit.") // i am the terror that faps in the night

/datum/antagonist/assassino/on_gain()
	owner.special_role = name
	var/yea = pick(/obj/item/clothing/wrists/roguetown/bracers/wristblade)
	owner.special_items["Poison"] = /obj/item/reagent_containers/glass/bottle/rogue/poison
	owner.special_items["Articulus Ferrum"] = yea
	greet()
	forge_objectives()
	owner.current.playsound_local(get_turf(owner.current), 'sound/music/traitor.ogg', 80, FALSE, pressure_affected = FALSE)
	ADD_TRAIT(owner.current, TRAIT_VILLAIN, TRAIT_GENERIC)
	ADD_TRAIT(owner.current, TRAIT_SILENTKILLER, TRAIT_GENERIC)
	ADD_TRAIT(owner.current, TRAIT_ZJUMP, TRAIT_GENERIC) // this might be OP or very irrelevant but we can't tell before we test merge
	var/mob/living/carbon/human/H = owner.current
	H.change_stat("strength", -4)
	H.change_stat("speed", 4)
	H.change_stat("intelligence", 2)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", -3)
	H.cmode_music = 'sound/music/combatsneaky.ogg'
	owner.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE) // Knows their way around the blade. Or so.
	owner.adjust_skillrank(/datum/skill/combat/unarmed, -1, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	owner.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	owner.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)

	owner.current.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/knock/nerfed)
	owner.current.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/switchplanes)
	return ..()

/datum/antagonist/assassino/greet()
	to_chat(owner.current, "<span class='userdanger'>They call me the Assassino, I am sent to places when some things just aren't right. And I have lots of correcting to do.</span>")
	to_chat(owner.current, "<b>Noble crow mailmen deliver me messages to use the <b>right-mind</b> on any bush, tree, clock or even statue to summon up a hidden compartment to reveal my 'Articulus Ferrum'. My wrist mounted blade.</b>")
	to_chat(owner.current, "<b>Even after my objectives are complete I was instructed not to leave before the week ends. I could pass the time by taking contracts from the localfolk.</b>")
	owner.announce_objectives()
	..()

/datum/antagonist/assassino/proc/forge_objectives()
	var/datum/objective/assassinate/killRuler = new
	//killRuler.target = SSticker.rulermob.mind
	killRuler.owner = owner
	objectives += killRuler

	var/datum/objective/assassinate/killNoble = new
	killNoble.target = killNoble.get_random_noble()
	killNoble.owner = owner
	objectives += killNoble

	// making sure we dont runtime if we start without ANY type of ruler. or noble.
	if(SSticker.rulermob == null)
		killRuler.target = owner.current
	else
		killRuler.target = SSticker.rulermob.mind
	if(killNoble.target == null)
		killNoble.target = owner.current

/datum/antagonist/assassino/proc/add_objective(datum/objective/O)
	var/datum/objective/V = new O
	objectives += V

/datum/antagonist/assassino/proc/remove_objective(datum/objective/O)
	objectives -= O

/datum/antagonist/assassino/on_removal()
	if(!silent && owner.current)
		to_chat(owner.current,"<span class='danger'>I am no longer a [job_rank]!</span>")
	owner.special_role = null
	return ..()

// WRIST BLADE

/obj/item/clothing/wrists/roguetown/bracers/wristblade // TODO: make this bring up the blade in the dominant hand
	desc = "Engrained into the metal, skillfully crafted a message reads: 'Articulus Ferrum, the article of iron. The Wrist Blade.' Curious."
	var/obj/item/blade = null
	var/deployed = FALSE

/obj/item/clothing/wrists/roguetown/bracers/wristblade/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	to_chat(user, "The article of iron binds to your wrists, it now refuses to be taken off. Not like you planned to do anything but murder anyway. Right?")

/obj/item/clothing/wrists/roguetown/bracers/wristblade/MiddleClick(mob/user, params)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(!can_use(user))
			return
		if(deployed && blade)
			REMOVE_TRAIT(blade, TRAIT_NODROP, TRAIT_GENERIC)
			user.playsound_local(get_turf(user), 'sound/combat/hiddenbladeretract.ogg', 80, FALSE, pressure_affected = FALSE)
			qdel(blade)
			blade = null
			deployed = FALSE
		else
			user.playsound_local(get_turf(user), 'sound/combat/hiddenbladedraw.ogg', 80, FALSE, pressure_affected = FALSE)
			var/obj/item/rogueweapon/huntingknife/wristblade/thing = new
			blade = thing
			deployed = TRUE
			ADD_TRAIT(blade, TRAIT_NODROP, TRAIT_GENERIC)
			H.put_in_r_hand(thing)

/obj/item/clothing/wrists/roguetown/bracers/wristblade/examine(mob/user)
	. = ..()
	if(user.mind.special_role == "Assassin")
		to_chat(user, "The noble crow mailmen tell me of a middle mind to bring the blade to stab. It will only raise if the right hand is unoccupied.")
