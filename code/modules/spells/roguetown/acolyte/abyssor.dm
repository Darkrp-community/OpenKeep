/obj/effect/proc_holder/spell/invoked/lesser_heal/abyssal //for now just an abyssal version of the same spell, just with a different sprite. Placeholder.
	name = "Lesser Miracle"
	overlay_state = "purification"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'

/obj/effect/proc_holder/spell/invoked/icebind //This magic is not working as it should. It must be resisted only with a INT test. But since I am unable to, people will need to break it from the inside.
	name = "Glacial Bind" //People faithful to Abyssor SHOULD be able to instantly be released from this magic.
	overlay_state = "waternet"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 0
	chargetime = 2
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'sound/music/kaizoku/spells/martialart_abyssanctum.ogg'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	invocation_type = "emote"
	invocation = "punches and spins, unleashing a surge of freezing energy."
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS

/turf/open/proc/apply_ice_turf()
	// Save the original attributes of the turf
	var/prev_icon_state = icon_state
	icon_state = "ice"
	density = FALSE
	MakeSlippery(TURF_WET_PERMAFROST, min_wet_time = 100, wet_time_to_add = 5)
	spawn(100)
		if(icon_state == "ice")
			icon_state = prev_icon_state
			density = initial(density)

/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE

	var/target = targets[1]

	if(isliving(target))
		var/mob/living/target_mob = target
		if(!target_mob.has_status_effect(/datum/status_effect/frozentomb))
			target_mob.apply_status_effect(/datum/status_effect/frozentomb)
			target_mob.visible_message("<span class='warning'>[target_mob] is sealed within a crystalline abyssal tomb!</span>")
		else
			to_chat(user, span_warning("<span class='userdanger'>Your target is already immobilized within a frigid tomb of ice!</span>"))
		return TRUE

	if(isturf(target))
		var/turf/open/T = target
		if(!isclosedturf(T))
			T.apply_ice_turf()
			to_chat(user, "<span class='warning'>Without a target, the ground becomes victim of the abyssal oppression.</span>")
			return TRUE
		else
			to_chat(user, "<span class='warning'>There is no space for a proper icespyre or cold to be settled.</span>")
			return FALSE

	to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
	return FALSE

///proc/apply_abyssaltomb(mob/living/target)
//	if(!target)
//		return
//	target.visible_message("<span class='info'>[target] is encased in a block of ice!</span>")
//	target.apply_status_effect(/datum/status_effect/frozentomb)

/datum/status_effect/frozentomb/on_apply()
	// Create the ice tomb and move the owner inside
	tomb = new /obj/structure/abyssaltomb(get_turf(owner))
	owner.forceMove(tomb)
	owner.status_flags |= GODMODE
	tomb.max_integrity = 150
	tomb.density = TRUE
	owner.visible_message("<span class='warning'>[owner] is encased in a crystalline tomb of ice.</span>")
	// Register the resist signal
	//RegisterSignal(owner, COMSIG_LIVING_RESIST, PROC_REF(on_remove)) //Not working. People will need to break it by beating it with a stick.
	return ..()
/*
/datum/status_effect/frozentomb/on_remove(mob/living/user) //This is not working. I require fixes. Budging system is not working since it only makes the player fall down.
	if(user.patron == /datum/patron/divine/abyssor)
		user.visible_message("<span class='info'>[user]'s purified body shatters the icy tomb with ease!</span>")
		if(tomb)
			qdel(tomb)
		user.status_flags &= ~GODMODE
		UnregisterSignal(owner, COMSIG_LIVING_RESIST)
		user.remove_status_effect(src)
		return
	if(isliving(user))
		var/mob/living/L = user
		var/time2mount = CLAMP((L.STAINT), 1, 99)
		user.changeNext_move(CLICK_CD_RAPID)
		if(prob(time2mount))
			user.visible_message("<span class='success'>[user] breaks free of the icy tomb!</span>")
			if(tomb)
				qdel(tomb)
			user.status_flags &= ~GODMODE
			UnregisterSignal(user, COMSIG_LIVING_RESIST)
			user.remove_status_effect(src)
		else
			user.visible_message("<span class='warning'>[user] struggles against the icy tomb but fails to break free.</span>")
*/

/obj/structure/abyssaltomb
	name = "abyssal tomb"
	desc = "A solid block of ice encasing a victim inside a pocket dimension. One requires to break the coffin to be released from such depths."
	icon = 'icons/roguetown/kaizoku/misc/freezesprite.dmi'
	icon_state = "icespyre"
	density = TRUE
	max_integrity = 150

/obj/structure/abyssaltomb/Destroy()
	for(var/atom/movable/M in contents)
		M.forceMove(loc)
	playsound(src, 'sound/combat/hits/onglass/glassbreak (2).ogg', 50, TRUE)
	return ..()

/datum/status_effect/frozentomb/proc/breakTomb()
	owner.remove_status_effect(src)

///Purification///

/obj/effect/proc_holder/spell/invoked/projectile/purify
	name = "Purifying filter"
	overlay_state = "icespike"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	releasedrain = 50
	chargetime = 30
	range = 7
	warnie = "sydwarning"
	movement_interrupt = FALSE
	projectile_type = /obj/projectile/magic/purify
	chargedloop = null
	//req_items = list(/obj/item/clothing/neck/roguetown/psycross)
	sound = 'sound/music/kaizoku/spells/martialart_abyssanctum.ogg'
	invocation_type = "emote"
	invocation = "delivers sharp jabs and a sudden clap, unleashing a freezing shockwave that forms and launches a jagged ice spike."

	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 10 SECONDS
	devotion_cost = -45

/obj/projectile/magic/purify
	name = "purification"
	icon_state = "icespikeproj"
	icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	paralyze = 50
	damage = 0
	range = 7
	hitsound = 'sound/blank.ogg'
	nondirectional_sprite = TRUE
	impact_effect_type = /obj/effect/temp_visual/icespikeproj_projectile_impact //See if we can set it to be a projectile if CMODE, and a invocation if !CMODE

/obj/effect/temp_visual/icespikeproj_projectile_impact
	name = "purifying spike"
	icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	icon_state = "icespikeproj_break"
	layer = ABOVE_ALL_MOB_LAYER
	duration = 3

/obj/projectile/magic/purify/on_hit(atom/target, mob/living/user, blocked = FALSE)
	..()
	var/mob/living/carbon/C = target
	//if(!user.cmode)
	if(iscarbon(target))
		if(C.mob_biotypes & MOB_SPIRIT) // Abyssor's purifying filter absolutely destroys demonic essence.
			C.visible_message("<span class='info'>An otherworldly divine freeze encircles [target], filtering out their very existence!</span>", "<span class='notice'>My breath shallows- my ears rings, my senses overwhelmed with the crushing grip! I'M GOING TO IMPLODE FROM INSIDE OUT! PLEASE MERCY!</span>")
			C.adjustBruteLoss(rand(50, 100)) //Random damage between 50 and 100. Very brutal, and proper for killing demons. Cold damage will come together with it after.
			C.Paralyze(60) //Purification successful. You will be paralyzed.
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if(C.dna.species?.id == "tiefling"||C.dna.species?.id == "goblin"||C.dna.species?.id == "orc") // Creatures with demon essence from Apotheosis war gets the second end of the stick.
			C.visible_message("<span class='danger'>[target]'s body is distorted by the crushing force of the abyssal waters!</span>", "<span class='userdanger'>I feel the suffocating pressure of the deep crushing my lungs!</span>")
			C.adjustBruteLoss(rand(30, 50)) // 30 to 50 damage, less than full demons. More damage comes from freezing.
			C.Paralyze(30) //Purification successful. You will be paralyzed.
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if(C.dna.species?.id == "abyssariad"||C.dna.species?.id == "aasimar") //Barely does anything to "Pure" creatures.
			C.visible_message("<span class='danger'>[target]'s body shivers slightly, yet remains sturdy.</span>", "<span class='userdanger'>A cold travel down my spine, yet I feel little to no pain.</span>")
			C.adjustBruteLoss(rand(5, 15)) // 10 to 15 damage. Don't even bother attacking these. They will not be frozen either.
			return
		else //Does not paralyze.
			C.visible_message("<span class='danger'>[target]'s body is distorted by the crushing force of the abyssal waters!</span>", "<span class='userdanger'>I feel the suffocating pressure of the deep crushing my lungs!</span>")
			C.adjustBruteLoss(rand(20, 35)) //Normal creatures will still suffer the effects of Barotrauma, yet less in terms of damage. Will still freeze.
			C.apply_status_effect(/datum/status_effect/debuff/freezing)
			C.flash_fullscreen("whiteflash3")
			return
//	else //If not on combat mode, heal your target - no matter who.
//		target.adjustToxLoss(-100) //Purification. Removes toxins from your body.
//		target.adjustOxyLoss(-50)
//		target.adjustBruteLoss(-50)
//		target.adjustFireLoss(-50)
//		target.blood_volume += BLOOD_VOLUME_SURVIVE
//		target.reagents.add_reagent(/datum/reagent/medicine/abyssalpurificator, 15) //PURIFYYYYYYYYYYYYYYYY - TAKE ALL AWAAAAY! Important to avoid becoming a DAEMON with too much corruption chem.
//		return


////////NOT FINISHED YET//////////

/*
/obj/effect/proc_holder/spell/invoked/elemental //chooses attackable people by clicking on them.
	name = "Ice elemental"
	overlay_state = "waterspirit"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	releasedrain = 30
	chargedrain = 4
	chargetime = 5
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'sound/music/kaizoku/spells/martialart_abyssanctum.ogg'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	invocation_type = "emote"
	invocation = "punches and spins, unleashing a surge of freezing energy."
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	charge_max = 10 SECONDS



/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE

	var/target = targets[1]

	if(isliving(target))
		var/mob/living/target_mob = target
		if(!target_mob.has_status_effect(/datum/status_effect/frozentomb))
			target_mob.apply_status_effect(/datum/status_effect/frozentomb)


/obj/effect/proc_holder/spell/invoked/icebind/cast(list/targets, mob/living/user, mob/living/carbon/human/H)
	if(!targets.len || !targets[1])
		to_chat(user, span_warning("<span class='userdanger'>Your spell fails to take hold, victimless.</span>"))
		return FALSE

	var/mob/living/target = targets[1]
	if(target.stat < DEAD)
		to_chat(user, "<span class='warning'>Nothing happens.</span>")
		return FALSE
	if(target != user)
		target.faction = "enemy" // You're targeted to DIE
		return TRUE

	if(isturf(target))
		var/turf/open/T = target
		if(!isclosedturf(T))
			new /mob/living/simple_animal/retaliate/purifier(target)
			to_chat(user, "<span class='warning'>You create an elemental to do your bidding.</span>")
			return FALSE
		else
			to_chat(user, "<span class='warning'>You cannot mark someone for purification or create an elemental here.</span>")
			return FALSE

/mob/living/simple_animal/retaliate/purifier
	name = "Abyssal Elemental"
	desc = "A creature which the presence damages "
	health = 300
	maxHealth = 300
	icon = 'icons/roguetown/kaizoku/misc/waterspirit.dmi'
	icon_state = "waterspirit"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	movement_type = GROUND
	speak_emote = list("roars")
	wander = TRUE
	del_on_death = TRUE
	deathmessage = "falls to the ground, decaying into glowing particles."
	deathsound = "bodyfall"
	footstep_type = FOOTSTEP_MOB_HEAVY
	turns_per_move = 3
	STACON = 15
	STASTR = 11
	STASPD = 12
	var/list/currently_affected = list()
	var/ticks_to_next_process = 3

/mob/living/simple_animal/retaliate/purifier/process()
	if(stat)
		return
	var/list/affected = hearers(7, src)
	var/to_fire = 5
	for(var/mob/living/A in affected)
		if(istype(A, /mob/living/carbon/human/species))
			if(A.stat != DEAD)
				A.adjustBruteLoss(rand(2,10))
				if(!--to_fire)
					return
		else if(istype(A, /mob/living/simple_animal/hostile))
			if(A.stat != DEAD)
				A.adjustBruteLoss(rand(2,10))
				if(!--to_fire)
					return

*/
