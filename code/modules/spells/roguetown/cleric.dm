/obj/effect/proc_holder/spell/invoked/shepherd
	name = "Shepherd"
	range = 8
	overlay_state = "psy"
	releasedrain = 50
	chargedrain = 0
	chargetime = 0
	charge_max = 10 SECONDS
	sound = 'sound/magic/swap.ogg'
	associated_skill = /datum/skill/magic/holy
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokeholy
	miracle = TRUE
	devotion_cost = -30

/obj/effect/proc_holder/spell/invoked/shepherd/cast(list/targets, mob/living/user)
	..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(get_dist(user, target) > 7)
			return FALSE
		var/turf/T = get_turf(target)
		var/turf/H = get_turf(user)
		if(T && H)
			playsound(T, 'sound/magic/swap.ogg', 100)
			user.forceMove(T)
			target.forceMove(H)
			return TRUE
	return FALSE

// Cleric Spell Spawner
/datum/devotion/cleric_holder/proc/grant_spells_priest(mob/living/carbon/human/H)
	if(!H || !H.mind)
		return
	var/datum/patrongods/A = H.PATRON
	var/spelllist = list(A.t0, A.t1, A.t2, A.t3)
	for(var/C in spelllist)
		H.mind.AddSpell(new C)
	level = CLERIC_T3
	update_devotion(300, 900)

/datum/devotion/cleric_holder/proc/grant_spells(mob/living/carbon/human/H)
	if(!H || !H.mind)
		return
	var/datum/patrongods/A = H.PATRON
	var/spelllist = list(A.t0, A.t1)
	level = CLERIC_T1
	for(var/C in spelllist)
		H.mind.AddSpell(new C)

// General
/obj/effect/proc_holder/spell/invoked/heal/lesser
	name = "Lesser Miracle"
	overlay_state = "lesserheal"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	sound = 'sound/magic/heal.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	devotion_cost = -25

/obj/effect/proc_holder/spell/invoked/heal/lesser/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(get_dist(user, target) > 7)
			return FALSE
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(50)
			target.Paralyze(30)
			target.fire_act(1,5)
			return TRUE
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
			target.adjustBruteLoss(-5)
			target.adjustFireLoss(-5)
		target.adjustToxLoss(-5)
		target.adjustOxyLoss(-5)
		target.blood_volume += 25
		return TRUE
	else
		return FALSE

// Light
/obj/effect/proc_holder/spell/invoked/heal
	name = "Miracle"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
//	chargedloop = /datum/looping_sound/invokeholy
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS
	miracle = TRUE
	devotion_cost = -45

/obj/effect/proc_holder/spell/invoked/heal/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(get_dist(user, target) > 7)
			return FALSE
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
		target.blood_volume += 100
		return TRUE
	else
		return FALSE

// Limb or organ attachment
/obj/effect/proc_holder/spell/invoked/attach_bodypart
	name = "Bodypart Miracle"
	overlay_state = "limb_attach"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 2
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 60 SECONDS //attaching a limb is pretty intense
	miracle = TRUE
	devotion_cost = -45

/obj/effect/proc_holder/spell/invoked/attach_bodypart/proc/get_limb(mob/living/target, mob/living/user)
	var/list/missing_limbs = target.get_missing_limbs()
	if(!length(missing_limbs))
		return
	var/obj/item/bodypart/limb
	//try to get from user's hands first
	for(var/obj/item/bodypart/potential_limb in user?.held_items)
		if(potential_limb.owner || !(potential_limb.body_zone in missing_limbs))
			continue
		limb = potential_limb
	//then target's hands
	if(!limb)
		for(var/obj/item/bodypart/dismembered in target.held_items)
			if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
				continue
			limb = dismembered
	//then finally, 1 tile range around target
	if(!limb)
		for(var/obj/item/bodypart/dismembered in range(1, target))
			if(dismembered.owner || !(dismembered.body_zone in missing_limbs))
				continue
			limb = dismembered
	return limb

/obj/effect/proc_holder/spell/invoked/attach_bodypart/proc/get_organ(mob/living/target, mob/living/user)
	var/list/missing_organs = list(
		ORGAN_SLOT_EARS,
		ORGAN_SLOT_EYES,
		ORGAN_SLOT_TONGUE,
	)
	for(var/missing_organ_slot in missing_organs)
		if(!target.getorganslot(missing_organ_slot))
			continue
		missing_organs -= missing_organ_slot
	if(!length(missing_organs))
		return
	var/obj/item/organ/organ
	//try to get from user's hands first
	for(var/obj/item/organ/potential_organ in user?.held_items)
		if(potential_organ.owner || !(potential_organ.slot in missing_organs))
			continue
		organ = potential_organ
	//then target's hands
	if(!organ)
		for(var/obj/item/organ/dismembered in target.held_items)
			if(dismembered.owner || !(dismembered.slot in missing_organs))
				continue
			organ = dismembered
	//then finally, 1 tile range around target
	if(!organ)
		for(var/obj/item/organ/dismembered in range(1, target))
			if(dismembered.owner || !(dismembered.slot in missing_organs))
				continue
			organ = dismembered
	return organ

/obj/effect/proc_holder/spell/invoked/attach_bodypart/cast(list/targets, mob/living/user)
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/target = targets[1]
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is burned by holy light!</span>", "<span class='userdanger'>I'm burned by holy light!</span>")
			target.adjustFireLoss(50)
			target.Paralyze(30)
			target.fire_act(1,5)
			return TRUE
		var/obj/item/bodypart/limb = get_limb(target, user)
		if(!limb?.attach_limb(target))
			var/obj/item/organ/organ = get_organ(target, user)
			if(!organ?.Insert(target))
				return FALSE
			target.visible_message("<span class='info'>\The [organ] attaches itself to [target]!</span>", \
							"<span class='notice'>\The [organ] attaches itself to me!</span>")
			return TRUE
		target.visible_message("<span class='info'>\The [limb] attaches itself to [target]!</span>", \
							"<span class='notice'>\The [limb] attaches itself to me!</span>")
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/targeted/sacred_flame_rogue
	name = "Sacred Flame"
	overlay_state = "sacredflame"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 15
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = null
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/heal.ogg'
	invocation = "The Sun cleanses!"
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 5 SECONDS
	miracle = TRUE
	devotion_cost = -45
	include_user = 0
	max_targets = 1

/obj/effect/proc_holder/spell/targeted/sacred_flame_rogue/cast(list/targets, mob/user = usr)
	for(var/mob/living/L in targets)
		user.visible_message("<font color='yellow'>[user] points at [L]/</font>")
		if(L.anti_magic_check(TRUE, TRUE))
			continue
		L.adjust_fire_stacks(5)
		L.IgniteMob()
		addtimer(CALLBACK(L, TYPE_PROC_REF(/mob/living, ExtinguishMob)), 4 SECONDS)
		return TRUE

/obj/effect/proc_holder/spell/invoked/revive
	name = "Anastasis"
	overlay_state = "revive"
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/revive.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 1 MINUTES
	miracle = TRUE
	devotion_cost = -100

/obj/effect/proc_holder/spell/invoked/revive/cast(list/targets, mob/living/user)
	..()
	if(isliving(targets[1]))
		testing("revived1")
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		if(!user.Adjacent(target))
			return FALSE
		if(GLOB.tod == "night")
			to_chat(user, "<span class='warning'>Let there be light.</span>")
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.visible_message("<span class='danger'>[target] is unmade by holy light!</span>", "<span class='userdanger'>I'm unmade by holy light!</span>")
			target.gib()
			return TRUE
		if(!target.revive(full_heal = FALSE))
			to_chat(user, "<span class='warning'>Nothing happens.</span>")
			return FALSE
		testing("revived2")
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		//GET OVER HERE!
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind?.current = target
		target.grab_ghost(force = TRUE) // even suicides
		target.emote("breathgasp")
		target.Jitter(100)
		target.update_body()
		target.visible_message("<span class='notice'>[target] is revived by holy light!</span>", "<span class='green'>I awake from the void.</span>")
		if(target.mind && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
			ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
		return TRUE
	else
		return FALSE

/obj/effect/proc_holder/spell/invoked/revive/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/fluff/psycross/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, "<span class='warning'>I need a holy cross.</span>")
		return FALSE
	else
		return TRUE

// Cure rot
/obj/effect/proc_holder/spell/invoked/cure_rot
	name = "Cure Rot"
	overlay_state = "cure_rot"
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/revive.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 2 MINUTES
	miracle = TRUE
	devotion_cost = -100
	/// Amount of PQ gained for curing zombos
	var/unzombification_pq = 0.4

/obj/effect/proc_holder/spell/invoked/cure_rot/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		testing("curerot1")
		var/mob/living/target = targets[1]
		if(target == user)
			return FALSE
		var/datum/antagonist/zombie/was_zombie = target.mind?.has_antag_datum(/datum/antagonist/zombie)
		var/has_rot = was_zombie
		if(!has_rot && iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/bodypart as anything in stinky.bodyparts)
				if(bodypart.rotted || bodypart.skeletonized)
					has_rot = TRUE
					break
		if(!has_rot)
			to_chat(user, "<span class='warning'>Nothing happens.</span>")
			return FALSE
		if(GLOB.tod == "night")
			to_chat(user, "<span class='warning'>Let there be light.</span>")
		for(var/obj/structure/fluff/psycross/S in oview(5, user))
			S.AOE_flash(user, range = 8)
		testing("curerot2")
		if(was_zombie)
			if(was_zombie.become_rotman && prob(5)) //5% chance to NOT become a rotman
				was_zombie.become_rotman = FALSE
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
			target.Unconscious(20 SECONDS)
			target.emote("breathgasp")
			target.Jitter(100)
			if(unzombification_pq && !HAS_TRAIT(target, TRAIT_IWASUNZOMBIFIED) && user?.ckey)
				adjust_playerquality(unzombification_pq, user.ckey)
				ADD_TRAIT(target, TRAIT_IWASUNZOMBIFIED, "[type]")
		var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)
		if(rot)
			rot.amount = 0
		if(iscarbon(target))
			var/mob/living/carbon/stinky = target
			for(var/obj/item/bodypart/rotty in stinky.bodyparts)
				rotty.rotted = FALSE
				rotty.skeletonized = FALSE
				rotty.update_disabled()
		target.update_body()
		if(!HAS_TRAIT(target, TRAIT_ROTMAN))
			target.visible_message("<span class='notice'>The rot leaves [target]'s body!</span>", "<span class='green'>I feel the rot leave my body!</span>")
		else
			target.visible_message("<span class='warning'>The rot fails to leave [target]'s body!</span>", "<span class='warning'>I feel no different...</span>")
		return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/cure_rot/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		return FALSE
	var/found = null
	for(var/obj/structure/fluff/psycross/S in oview(5, user))
		found = S
	if(!found)
		to_chat(user, "<span class='warning'>I need a holy cross.</span>")
		return FALSE
	return TRUE

// Necrite
/obj/effect/proc_holder/spell/targeted/burialrite
	name = "Burial Rites"
	range = 5
	overlay_state = "consecrateburial"
	releasedrain = 30
	charge_max = 300
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Undermaiden grant thee passage forth and spare the trials of the forgotten."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -15

/obj/effect/proc_holder/spell/targeted/burialrite/cast(list/targets,mob/user = usr)
	for(var/obj/structure/closet/dirthole/H in view(1))
		if(H.stage != 4)
			continue
		if(!H.contents)
			continue
		for(var/mob/living/carbon/human/A in H.contents)
			A.funeral = TRUE
			if(A.mind && A.mind.has_antag_datum(/datum/antagonist/zombie))
				A.mind.remove_antag_datum(/datum/antagonist/zombie)
			user.visible_message("My funeral rites have been performed!", "[user] consecrates the grave!")
		for(var/obj/structure/closet/crate/coffin/C)
			for(var/mob/living/carbon/human/B in C.contents)
				B.funeral = TRUE

/obj/effect/proc_holder/spell/targeted/churn
	name = "Churn Undead"
	range = 8
	overlay_state = "necra"
	releasedrain = 30
	charge_max = 300
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "The Undermaiden rubukes!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -60

/obj/effect/proc_holder/spell/targeted/churn/cast(list/targets,mob/living/user = usr)
	var/prob2explode = 100
	if(user && user.mind)
		prob2explode = 0
		for(var/i in 1 to user.mind.get_skill_level(/datum/skill/magic/holy))
			prob2explode += 30
	for(var/mob/living/L in targets)
		var/isvampire = FALSE
		var/iszombie = FALSE
		if(L.stat == DEAD)
			continue
		if(L.mind)
			var/datum/antagonist/vampirelord/lesser/V = L.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
			if(V)
				if(!V.disguised)
					isvampire = TRUE
			if(L.mind.has_antag_datum(/datum/antagonist/zombie))
				iszombie = TRUE
			if(L.mind.special_role == "Vampire Lord")
				user.visible_message("<span class='warning'>[L] overpowers being churned!</span>", "<span class='userdanger'>[L] is too strong, I am churned!</span>")
				user.Stun(50)
				user.throw_at(get_ranged_target_turf(user, get_dir(user,L), 7), 7, 1, L, spin = FALSE)
				return
		if((L.mob_biotypes & MOB_UNDEAD) || isvampire || iszombie)
//			L.visible_message("<span class='warning'>[L] is unmade by PSYDON!</span>", "<span class='danger'>I'm unmade by PSYDON!</span>")
			var/vamp_prob = prob2explode
			if(isvampire)
				vamp_prob -= 59
			if(prob(vamp_prob))
				explosion(get_turf(L), light_impact_range = 1, flame_range = 1, smoke = FALSE)
				L.Stun(50)
//				L.throw_at(get_ranged_target_turf(L, get_dir(user,L), 7), 7, 1, L, spin = FALSE)
			else
				L.visible_message("<span class='warning'>[L] resists being churned!</span>", "<span class='userdanger'>I resist being churned!</span>")
	..()
	return TRUE
// Druid

/obj/effect/proc_holder/spell/targeted/blesscrop
	name = "Bless Crops"
	range = 5
	overlay_state = "blesscrop"
	releasedrain = 30
	charge_max = 300
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "The Treefather commands thee, be fruitful!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -15

/obj/effect/proc_holder/spell/targeted/blesscrop/cast(list/targets,mob/user = usr)
	visible_message("<FONT COLOR='green'>[usr] blesses the crop with Dendor's Favour!</FONT><BR>")
	for(var/obj/machinery/crop/C in view(5))
		C.growth += 40
		C.update_seed_icon()

/obj/effect/proc_holder/spell/targeted/beasttame
	name = "Tame Beast"
	range = 5
	overlay_state = "tamebeast"
	releasedrain = 30
	charge_max = 300
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Be still and calm, brotherbeast."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -60

/obj/effect/proc_holder/spell/targeted/beasttame/cast(list/targets,mob/user = usr)
	visible_message("<FONT COLOR='green'>[usr] soothes the beastblood with Dendor's whisper.</FONT><BR>")
	for(var/mob/living/simple_animal/hostile/retaliate/B in oview(2))
		B.aggressive = 0
