// Lesser miracle
/obj/effect/proc_holder/spell/invoked/lesser_heal
	name = "Lesser Miracle"
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	devotion_cost = -25

/obj/effect/proc_holder/spell/invoked/lesser_heal/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(50)
			target.Paralyze(30)
			target.fire_act(1,5)
			return TRUE
		//this if chain is stupid, replace with variables on /datum/patron when possible?
		target.visible_message("<span class='info'>A wreath of gentle light passes over [target]!</span>", "<span class='notice'>I'm bathed in holy light!</span>")
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(20, 20))
					C.update_damage_overlays()
				if(affecting.heal_wounds(20))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-20)
			target.adjustFireLoss(-20)
		target.adjustToxLoss(-20)
		target.adjustOxyLoss(-20)
		target.blood_volume += BLOOD_VOLUME_SURVIVE/4
		return TRUE
	return FALSE

// Miracle
/obj/effect/proc_holder/spell/invoked/heal
	name = "Miracle"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = -45

/obj/effect/proc_holder/spell/invoked/heal/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(100)
			target.Paralyze(50)
			target.fire_act(1,5)
			return TRUE
		target.visible_message("<span class='info'>A wreath of gentle light passes over [target]!</span>", "<span class='notice'>I'm bathed in holy light!</span>")
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(50, 50))
					C.update_damage_overlays()
				if(affecting.heal_wounds(50))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-50)
			target.adjustFireLoss(-50)
		target.adjustToxLoss(-50)
		target.adjustOxyLoss(-50)
		target.blood_volume += BLOOD_VOLUME_SURVIVE
		return TRUE
	return FALSE

// RAVOX

/obj/effect/proc_holder/spell/self/barbrage
	name = "Rage"
	desc = "Enter a state of martial fervour, increasing offensive capabilities at the cost of making yourself vulnerable."
	overlay_state = "bcry"
	releasedrain = 30
	antimagic_allowed = TRUE
	invocation_type = "shout"
	charge_max = 1 MINUTES

/obj/effect/proc_holder/spell/self/barbrage/cast(list/targets,mob/living/user = usr)
	user.emote("rage", forced = TRUE)
	playsound(get_turf(user), 'sound/magic/barbroar.ogg', 50, TRUE)
	user.apply_status_effect(/datum/status_effect/buff/barbrage)

// XYLIX

/obj/effect/proc_holder/spell/invoked/mockery
	name = "Vicious Mockery"
	releasedrain = 50
	associated_skill = /datum/skill/misc/music
	charge_max = 10 MINUTES
	range = 7
	
/obj/effect/proc_holder/spell/invoked/mockery/cast(list/targets, mob/living/user)
	playsound(get_turf(user), 'sound/magic/mockery.ogg', 40, FALSE)
	for(var/mob/living/listener in hearers(7))
		if(listener.can_hear()) // Vicious mockery requires people to be able to hear you.
			if(listener?.mind?.has_antag_datum(/datum/antagonist))
				if(!listener?.mind?.isactuallygood())
					listener.apply_status_effect(/datum/status_effect/debuff/viciousmockery)
				else
					return // No debuff for good guys
			else 
				return // No debuff for good guys

/obj/effect/proc_holder/spell/invoked/mockery/invocation(mob/user = usr)
	if(ishuman(user))
		var/mob/living/carbon/human/B = user
		switch(B.dna.species.id)
			if("human") // Half elves too
				switch(pick(1,2,3,4,5))
					if(1)
						user.say("Your mother was a Rous, and your father smelled of jacksberries!", forced = "spell")
					if(2)
						user.say("What are you going to do for a face when the monkey wants his arse back?!", forced = "spell")
					if(3)
						user.say("Wandought thine blades stand, much like thine loving parts!", forced = "spell")
					if(4)
						user.say("That's a face not even Graggar could love!", forced = "spell")
					if(5)
						user.say("I shall ne'er desist from thee, nor shall I ever disappoint thee much~", forced = "spell")
			
			if("elf")
				switch(pick(1,2,3,4,5))
					if(1)
						user.say("As graceful as a drunken mole, I see!", forced = "spell")
					if(2)
						user.say("I've fought zads more fiercer than you!", forced = "spell")
					if(3)
						user.say("You're making this so easy, I'm losing confidence in myself... barely!", forced = "spell")
					if(4)
						user.say("OHH-HOH-HOH-HOH-HOH!", forced = "spell")
					if(5)
						user.say("Uncultured churls, barely worth my words!", forced = "spell")

			if("dwarf")
				switch(pick(1,2,3,4,5))
					if(1)
						user.say("If yer mind was as sharp as yer ears, we wouldn't be in this mess!", forced = "spell")
					if(2)
						user.say("Ye kick softer than a newborn saiga!", forced = "spell")
					if(3)
						user.say("Make it quick, dullards! T'is happy hour in the tavern!", forced = "spell")
					if(4)
						user.say("Ohh, is the milk drinker gonna cry?", forced = "spell")
					if(5)
						user.say("I will drink from yer skull!", forced = "spell")

			if("tiefling")
				switch(pick(1,2,3,4,5))
					if(1)
						user.say("Ay caramba, que mal baila la bamba!", forced = "spell")
					if(2)
						user.say("Aserejé, ja, deje, dejebetudejebe de seibi noua!", forced = "spell")
					if(3)
						user.say("Good job Slowpoke Rodriguez, you almost had me! Almost!", forced = "spell")
					if(4)
						user.say("Come on, entertain me a little longer!", forced = "spell")
					if(5)
						user.say("Dance with the devil and win a prize!", forced = "spell")

			if("aasimar")
				switch(pick(1,2,3,4,5))
					if(1)
						user.say("Your imperfect body could never match the fires I was forged on.", forced = "spell")
					if(2)
						user.say("You're in for a world of hurt, impudent one.", forced = "spell")
					if(3)
						user.say("Your name shall be stricken down from the annals of history.", forced = "spell")
					if(4)
						user.say("I wouldn't sing your praises even if you forged me to!", forced = "spell")
					if(5)
						user.say("What manner of blabbering creecher art thou?", forced = "spell")
