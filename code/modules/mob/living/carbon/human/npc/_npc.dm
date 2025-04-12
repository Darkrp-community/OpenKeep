#define MAX_RANGE_FIND 32

/mob/living/carbon/human
	var/aggressive=0 //0= retaliate only
	var/frustration=0
	var/pickupTimer=0
	var/list/enemies = list()
	var/list/friends = list()
	var/mob/living/target
	var/obj/item/pickupTarget
	var/mode = AI_OFF
	var/list/myPath = list()
	var/list/blacklistItems = list()
	var/maxStepsTick = 6
	var/resisting = FALSE
	var/pickpocketing = FALSE
	var/del_on_deaggro = null
	var/last_aggro_loss = null
	var/wander = TRUE
	var/ai_when_client = FALSE
	var/next_idle = 0
	var/next_seek = 0
	var/next_stand = 0
	var/next_passive_detect = 0
	var/flee_in_pain = FALSE
	var/stand_attempts = 0
	var/resist_attempts = 0
	var/ai_currently_active = FALSE
	var/attack_speed = 0

	var/returning_home = FALSE

/mob/living/carbon/human/proc/IsStandingStill()
	return resisting || pickpocketing

/mob/living/carbon/human/proc/handle_ai()
	if(client)
		if(!ai_when_client)
			return
	START_PROCESSING(SShumannpc,src)

/mob/living/carbon/human/proc/process_ai()
	if(stat == DEAD)
		walk_to(src,0)
		return TRUE
	if(client)
		if(!ai_when_client)
			return TRUE //remove us from processing
//	if(world.time < next_ai_tick)
//		return
//	next_ai_tick = world.time + rand(10,20)
	cmode = 1
	if(stat == CONSCIOUS)
		if(on_fire || buckled || restrained(FALSE) || pulledby)
			if(resist_attempts < 1)
				resisting = TRUE
				walk_to(src,0)
				resist()
				resist_attempts += 1
				resisting = FALSE
		if((mobility_flags & MOBILITY_CANSTAND) && (stand_attempts < 3))
			npc_stand()
		else
			stand_attempts = 0
			resist_attempts = 0
			if(!handle_combat())
				if(mode == AI_IDLE && !pickupTarget)
					npc_idle()
					if(del_on_deaggro && last_aggro_loss && (world.time >= last_aggro_loss + del_on_deaggro))
						if(deaggrodel())
							return TRUE
	else
		walk_to(src,0)
		return TRUE

/mob/living/carbon/human/proc/npc_stand()
	// the sane way to do this would be to try and check if we can even realistically stand
	resisting = TRUE
	if(stand_up())
		stand_attempts = 0
		resisting = FALSE
		return TRUE
	else
		stand_attempts += rand(1,3)
		resisting = FALSE
		return FALSE

/mob/living/carbon/human/proc/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle + rand(30,50))
		return
	next_idle = world.time + rand(30,50)
	if ((world.time < next_stand + rand(50, 100)) && !npc_stand()) // attempt to stand up when idle, but only once every so often
		next_stand = world.time + rand(50, 100)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc))
		if(wander)
			if(prob(50))
				var/turf/T = get_step(loc,pick(GLOB.cardinals))
				if(!istype(T, /turf/open/transparent/openspace))
					Move(T)
			else
				setDir(turn(dir, pick(90,-90)))
		else
			setDir(turn(dir, pick(90,-90)))
	if(prob(3))
		emote("idle")

/mob/living/carbon/human/proc/deaggrodel()
	if(aggressive)
		for(var/mob/living/L in view(7)) // scan for enemies
			if( should_target(L) && (L != src))
				if(L.stat != DEAD)
					retaliate(L)
					return FALSE
	if(!target)
//		var/escape_path
//		for(var/obj/structure/flora/RT in view(6, src))
//			if(istype(RT,/obj/structure/table/wood/treestump))
//				continue
//			if(istype(RT,/obj/structure/flora/tree))
//				escape_path = RT
//				break
//			if(istype(RT,/obj/structure/flora/shroom_tree))
//				escape_path = RT
//				break
	//	if(escape_path)
		qdel(src)
		return TRUE

// blocks
// taken from /mob/living/carbon/human/interactive/
/mob/living/carbon/human/proc/walk2derpless(target)
	if(!target || IsStandingStill())
		back_to_idle()
		return 0

	var/dir_to_target = get_dir(src, target)
	var/turf/turf_of_target = get_turf(target)
	if(!turf_of_target)
		back_to_idle()
		return 0
	if(!(mobility_flags & MOBILITY_MOVE))
		return 0
	var/target_z = turf_of_target.z
	if(turf_of_target?.z == z)
		if(myPath.len <= 0)
			for(var/obj/structure/O in get_step(src,dir_to_target))
				if(O.density && O.climbable)
					O.climb_structure(src)
					myPath = list()
					break
			myPath = get_path_to(src, turf_of_target, /turf/proc/Distance, MAX_RANGE_FIND + 1, 250,1)

		if(myPath)
			if(myPath.len > 0)
				for(var/i = 0; i < maxStepsTick; ++i)
					if(!IsDeadOrIncap())
						if(myPath.len >= 1)
							walk_to(src,turf_of_target,0,update_movespeed())
							myPath -= myPath[1]
				return 1
	else
		if(turf_of_target?.z < z)
			turf_of_target = get_step_multiz(turf_of_target, DOWN)
		else
			turf_of_target = get_step_multiz(turf_of_target, UP)
		if(turf_of_target?.z != target_z) //too far away
			back_to_idle()
			return 0
	// failed to path correctly so just try to head straight for a bit
	walk_to(src,turf_of_target,0,update_movespeed())
	sleep(1)
	walk_to(src,0)

	return 0

// taken from /mob/living/carbon/human/interactive/
/mob/living/carbon/human/proc/IsDeadOrIncap(checkDead = TRUE)
	if(!(mobility_flags & MOBILITY_FLAGS_INTERACTION))
		return 1
	if(health <= 0 && checkDead)
		return 1
	if(IsUnconscious())
		return 1
	if(IsStun() || IsParalyzed())
		return 1
	if(stat)
		return 1
	return 0


/mob/living/carbon/human/proc/equip_item(obj/item/I)
	if(I.loc == src)
		return TRUE

	if(I.anchored)
		blacklistItems[I] ++
		return FALSE

	// WEAPONS
	if(istype(I, /obj/item))
		if(put_in_hands(I))
			return TRUE

	blacklistItems[I] ++
	return FALSE

/mob/living/carbon/human/proc/pickup_and_wear(obj/item/clothing/C)
	if(!equip_to_appropriate_slot(C))
		monkeyDrop(get_item_by_slot(C)) // remove the existing item if worn
		addtimer(CALLBACK(src, PROC_REF(equip_to_appropriate_slot), C), 5)

/mob/living/carbon/human/proc/monkeyDrop(obj/item/A)
	if(A)
		dropItemToGround(A, TRUE)

/mob/living/carbon/human/resist_restraints()
	var/obj/item/I = null
	if(handcuffed)
		I = handcuffed
	else if(legcuffed)
		I = legcuffed
	if(I)
		changeNext_move(CLICK_CD_BREAKOUT)
		last_special = world.time + CLICK_CD_BREAKOUT
		cuff_resist(I)

/mob/living/carbon/human/proc/should_target(mob/living/L)
	if(HAS_TRAIT(src, TRAIT_PACIFISM))
		return FALSE

	if(L == src)
		return FALSE

	if (L.alpha == 0 && L.rogue_sneaking)
		return FALSE

	if(!is_in_zweb(src.z,L.z))
		return FALSE

	if(L.stat == DEAD)
		return FALSE

	if(L.InFullCritical())
		return FALSE

	if(L.name in friends)
		return FALSE

	if(enemies[L])
		return TRUE

	if(aggressive && !faction_check_mob(L))
		return TRUE

	return FALSE

/mob/living/carbon/human/proc/handle_combat()
	switch(mode)
		if(AI_IDLE)		// idle
			if(world.time >= next_seek)
				next_seek = world.time + 3 SECONDS
				for(var/mob/living/L in view(7, src)) // scan for enemies
					if(should_target(L))
						retaliate(L)
					if (world.time >= next_passive_detect && L.alpha == 0 && L.rogue_sneaking && prob(STAPER / 2))
						if (!npc_detect_sneak(L, -20)) // attempt a passive detect with 20% increased difficulty
							next_passive_detect = world.time + STAPER SECONDS

		if(AI_HUNT)		// hunting for attacker
			if(target != null)
				if(!should_target(target))
					if (target.alpha == 0 && target.rogue_sneaking) // attempt one detect since we were just fighting them and have lost them
						if (npc_detect_sneak(target))
							retaliate(target)
					else
						back_to_idle()
						return TRUE
				m_intent = MOVE_INTENT_WALK
				INVOKE_ASYNC(src, PROC_REF(walk2derpless), target)

			if(!get_active_held_item() && !get_inactive_held_item() && !mind?.has_antag_datum(/datum/antagonist/zombie))
				// pickup any nearby weapon
				for(var/obj/item/I in view(1,src))
					if(!isturf(I.loc))
						continue
					if(blacklistItems[I])
						continue
					if(HAS_TRAIT(I, TRAIT_NODROP))
						continue
					if(I.force > 7)
						equip_item(I)

			// if can't reach target for long enough, go idle
			if(frustration >= 15)
				back_to_idle()
				return TRUE

			if(Adjacent(target) && isturf(target.loc) && !IsDeadOrIncap())	// if right next to perp
				frustration = 0
				face_atom(target)
				monkey_attack(target)
				if(flee_in_pain && (target.stat == CONSCIOUS))
					var/paine = get_complex_pain()
					if(paine >= ((STAEND * 10)*0.9))
//						mode = AI_FLEE
						update_mobility() // This is necessary for some reason. Man do I hate mob AI.
						if((mobility_flags & MOBILITY_MOVE) && !buckled && !restrained(FALSE))
							walk_away(src, target, 5, update_movespeed())
				return TRUE
			else								// not next to perp
				frustration++

		if(AI_FLEE)
			back_to_idle()
			return TRUE

	return IsStandingStill()


/mob/living/carbon/human/proc/back_to_idle()
	last_aggro_loss = world.time
	if(pulling)
		stop_pulling()
	myPath = list()
	mode = AI_IDLE
	target = null
	a_intent = INTENT_HELP
	frustration = 0
	walk_to(src,0)

// attack using a held weapon otherwise bite the enemy, then if we are angry there is a chance we might calm down a little
/mob/living/carbon/human/proc/monkey_attack(mob/living/L)
	if(next_move > world.time)
		return
	if(abyssariadraider) // Special attack logic for event-oriented 'traditionalist' Foglander enemies.
		if(prob(5))
			say(pick(GLOB.custodian_quotes))
		if(L.surrendering == 1) //If the target actually followed what the raider said...
			src.killyielder(target)//Fuck them up John.
			return
		if(world.time >= special_timer + special_cooldown) // Enforce proper cooldown.
			if(prob(20)) // 20% chance to execute special attack.
				src.special_attacks(src, L, null)
				special_timer = world.time + 15 SECONDS + rand(2, 5)
				return
	var/obj/item/Weapon = get_active_held_item()
	var/obj/item/OffWeapon = get_inactive_held_item()
	if(Weapon && OffWeapon)
		if(OffWeapon.force > Weapon.force)
			swap_hand()
			Weapon = get_active_held_item()
			OffWeapon = get_inactive_held_item()
	if(!Weapon)
		swap_hand()
		Weapon = get_active_held_item()
		OffWeapon = get_inactive_held_item()
	if(!(mobility_flags & MOBILITY_STAND))
		aimheight_change(rand(1,10))
	else
		aimheight_change(rand(10,19))

	// attack with weapon if we have one
	if(Weapon)
		if(!Weapon.wielded)
			if(Weapon.force_wielded > Weapon.force)
				if(!OffWeapon)
					Weapon.attack_self(src)
		rog_intent_change(1)
		used_intent = a_intent
		Weapon.melee_attack_chain(src, L)
	else
		rog_intent_change(4)
		used_intent = a_intent
		UnarmedAttack(L,1)

	var/adf = ((used_intent.clickcd + 8) - round((src.STASPD - 10) / 2) - attack_speed)
	if(istype(rmb_intent, /datum/rmb_intent/aimed))
		adf = round(adf * 1.4)
	if(istype(rmb_intent, /datum/rmb_intent/swift))
		adf = round(adf * 0.6)
	changeNext_move(adf)

	// no de-aggro
	if(aggressive)
		return

// get angry at a mob
/mob/living/carbon/human/proc/retaliate(mob/living/L)
	if(!wander)
		wander = TRUE
	if(L == src)
		return
	if(mode != AI_OFF)
		if(L.alpha == 0 && L.rogue_sneaking)
			// we just got hit by something hidden so try and find them
			if (prob(5))
				visible_message(span_notice("[src] begins searching around frantically..."))
			var/extra_chance = (health <= maxHealth * 50) ? 30 : 0 // if we're below half health, we're way more alert
			if (!npc_detect_sneak(L, extra_chance))
				return
		mode = AI_HUNT
		last_aggro_loss = null
		face_atom(L)
		if(!target)
			emote("aggro")
		target = L
		enemies |= L


/mob/living/carbon/human/attackby(obj/item/W, mob/user, params)
	. = ..()
	if((W.force) && (!target) && (W.damtype != STAMINA) )
		retaliate(user)


/mob/living/proc/npc_detect_sneak(mob/living/target, extra_prob = 0)
	if (target.alpha > 0 || !target.rogue_sneaking)
		return TRUE
	var/probby = 4 * STAPER //this is 10 by default - npcs get an easier time to detect to slightly thwart cheese
	probby += extra_prob
	var/sneak_bonus = 0
	if(target.mind)
		if(target.has_status_effect(/datum/status_effect/invisibility))
			// we're invisible as per the spell effect, so use the highest of our arcane magic (or holy) skill instead of our sneaking
			sneak_bonus = (max(target.mind?.get_skill_level(/datum/skill/magic/arcane), target.mind?.get_skill_level(/datum/skill/magic/holy)) * 10)
			probby -= 20 // also just a fat lump of extra difficulty for the npc since spells are hard, you know?
		else
			sneak_bonus = (target.mind?.get_skill_level(/datum/skill/misc/sneaking) * 5)
		probby -= sneak_bonus
	if(!target.check_armor_skill())
		probby += 85 //armor is loud as fuck
		if (sneak_bonus)
			probby += sneak_bonus // you don't get sneak bonus in heavy armor at all, on top of that
	if (target.stat_roll(STATKEY_LCK,5,10,TRUE))
		probby += (10 - target.STALUC) * 5 // drop 5% chance for every bit of fortune we're missing
	if (target.stat_roll(STATKEY_LCK,5,10))
		probby -= (10 - target.STALUC) * 5 // make it 5% harder for every bit of fortune over 10 that we do have

	if (prob(probby))
		// whoops it saw us
		MOBTIMER_SET(target, MT_FOUNDSNEAK)
		to_chat(target, span_danger("[src] sees me! I'm found!"))
		target.update_sneak_invis(TRUE)
		return TRUE
	else
		return FALSE

#undef MAX_RANGE_FIND

/mob/living/carbon/human/proc/killyielder(mob/living/target)
	var/obj/item/bodypart/head = target.get_bodypart(BODY_ZONE_HEAD)
	if(head)
		var/obj/item/I = target.get_item_by_slot(SLOT_HEAD) // First, this code selects the head.
		if(I) //Then proceeds to remove any head protection.
			target.doUnEquip(I)
			I.forceMove(get_turf(target))

		target.visible_message(
			span_danger("[src] delivers a merciless blow, severing [target]'s head!"),
			span_notice("Blood sprays violently as [target]'s head is sent flying!")
		)

		head.dismember() //I am not yet sure if chains will be able to protect the head from this.
		target.emote("scream")
		src.say(pick(GLOB.custodian_tease))

/mob/living/carbon/human/proc/special_attacks(mob/user, atom/A, params) //Attack for the Foglander Raiders.
	var/mob/living/target = A
	var/crit_roll = rand(1, 2)

	if(target.IsStun() || target.IsKnockdown() || target.lying) // Prioritize Execution move if target is stunned or paralyzed
		Execution(target)
		return  // You're very unlucky if NPC Execution happened.

	switch(crit_roll)
		if(1)
			Disarmroll(target) // This attack disarms the enemy and kicks the weapon away.
			return
		if(2)
			KnockbackAttack(target) // This attack pushes the enemy itself away, and can knockdown. Very risky with Execution.
			return

/mob/living/carbon/human/proc/Disarmroll(mob/living/target)
	var/obj/item/W = target.get_active_held_item()
	if(W)
		var/turf/item_target = get_edge_target_turf(src, get_dir(src, get_step_away(target, src)))
		target.dropItemToGround(W)
		if(item_target)
			W.throw_at(item_target, 6, 1) //KICKED AWAY!
		target.visible_message(span_danger("[src] strikes [target]'s arm with an open palm, bruising the tendons!"))
		emote("laugh")
		playsound(get_turf(src),'sound/combat/shieldraise.ogg', 200, TRUE)
	else
		KnockbackAttack(target)


/mob/living/carbon/human/proc/KnockbackAttack(mob/living/target)
	if (!target)
		return

	target.do_attack_animation(src, ATTACK_EFFECT_SMASH)
	target.visible_message(span_danger("[src]'s muscular hand reaches [target]'s throat.")) //I love to make this weird.
	src.say(pick(GLOB.custodian_special))
	src.emote("laugh")

	var/clap_distance = round((src.STASTR - target.STACON) / 2 + rand(-1,4)) //the rand adds randomness to the result.
	var/turf/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(target, src)))
	target.throw_at(throwtarget, clap_distance, 2, src)

	if(target.cmode)
		if(clap_distance >= 3) //Knockdown comes only after 3 tiles-of-force.
			target.AdjustKnockdown(1 + rand(2, 3)) // Potentially knocks down
			target.visible_message(span_danger("[src] launches [target] away like a mere claydoll!"))
		else
			target.visible_message(span_danger("[src] pushes [target] away, unable to break their stance."))
	else
		target.AdjustKnockdown(5 + rand(5, 10)) //If the player is not on combat mode, that means they are not ready to act against martial attacks.
		target.visible_message(span_danger("[src] launches [target] away like a mere claydoll!"))

/mob/living/carbon/human/proc/Execution(mob/living/target) //Dude, the player is beyond damned now.
	var/list/limb_list = list(
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
		BODY_ZONE_CHEST
	)
	var/obj/item/bodypart/BP = target.get_bodypart(limb_list) //Choose one single limb to PUNISH.

	target.do_attack_animation(src, ATTACK_EFFECT_KICK)
	target.visible_message(span_danger("[src] looms over [target] and crushes them with their feet!"))
	target.apply_damage(rand(30, 50), BRUTE, BP) // Big oof.
	target.SetSleeping(20) // Just to give a scare. Not really to make the player sleep midbattle.
	playsound(get_turf(src),'sound/combat/shieldbash_wood.ogg', 200, TRUE)
	if(BP)
		BP.add_wound(/datum/wound/fracture)
		BP.update_disabled() // HAHAHAHA

/mob/living/carbon/human/proc/throw_star(mob/living/target)
	if(shuriken_count >= 1 && target && ismob(target))
		var/obj/item/throwing_star/ninja/star = new /obj/item/throwing_star/ninja(get_turf(src))
		shuriken_count--

		src.visible_message(span_danger("[src] swiftly hurls a shuriken at [target]!"))
		star.thrownby = src

		// Simulate a throw for visuals
		star.safe_throw_at(target, 10, 4, src, 1, 0, null, 35)

		// Manually embed if the target is human
		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			if(can_embed(star) && !HAS_TRAIT(H, TRAIT_PIERCEIMMUNE))
				var/obj/item/bodypart/L = pick(H.bodyparts)
				L.add_embedded_object(star, silent = FALSE, crit_message = TRUE)
				H.emote("embed")
				L.receive_damage(star.w_class * star.embedding.embedded_impact_pain_multiplier)
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "embedded", /datum/mood_event/embedded)
				return
