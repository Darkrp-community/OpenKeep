//////////////////////
//# ABYSSOR'S RAGE #//
//////////////////////
/obj/effect/proc_holder/spell/invoked/projectile/swordfish
	name = "Abyssor's Rage"
	overlay_state = "curse2"
	releasedrain = 50
	chargetime = 20
	range = 10
	projectile_type = /obj/projectile/magic/swordfish
	warnie = "sydwarning"
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokegen
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssor)
	sound = 'sound/magic/whiteflame.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	miracle = TRUE
	charge_max = 15 SECONDS
	devotion_cost = 40

/obj/item/reagent_containers/food/snacks/fish/swordfish
	name = "swordfish"
	desc = "But one enactor of Abyssor's rage."
	icon = 'icons/roguetown/misc/fish.dmi'
	icon_state = "swordfishcom"
	force = DAMAGE_DAGGER
	dropshrink = 0.8
	possible_item_intents = list(/datum/intent/dagger/thrust, /datum/intent/food)
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/swordfish
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/fryfish/swordfish
	cooked_smell = /datum/pollutant/food/baked_swordfish

//esssentially a magic throwing knife
/obj/projectile/magic/swordfish
	name = "swordfish"
	desc = "But one enactor of Abyssor's rage."
	damage = DAMAGE_DAGGER * 2
	nodamage = FALSE
	damage_type = BRUTE
	icon = 'icons/roguetown/misc/fish.dmi'
	icon_state = "swordfish_proj"
	range = 10
	hitsound = 'sound/combat/hits/hi_arrow2.ogg'
	embedchance = 15
	armor_penetration = 10
	woundclass = BCLASS_STAB
	flag = "piercing"
	speed = 0.4
	impact_effect_type = null

/obj/projectile/magic/swordfish/on_hit(atom/target, blocked)
	. = ..()
	if(ismob(target))
		var/mob/hit = target
		if(hit.anti_magic_check())
			hit.visible_message("<span class='warning'>[src] vanishes on contact with [target]!</span>")
			return BULLET_ACT_BLOCK
	if(!dropped)
		dropped = new /obj/item/reagent_containers/food/snacks/fish/swordfish()

/obj/effect/proc_holder/spell/self/summon_trident
	name = "Summon Trident"
	overlay_state = "lightning"
	charge_max = 1 MINUTES
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssor)
	invocation = "Let Abyssor's wrath be known."
	invocation_type = "shout"
	releasedrain = 30
	miracle = TRUE
	devotion_cost = 45

	var/obj/marked_item

/obj/effect/proc_holder/spell/self/summon_trident/cast(list/targets,mob/living/user = usr)
	if(!QDELETED(marked_item))
		qdel(marked_item)
	var/obj/item/item = new /obj/item/fishingrod/abyssor_trident
	user.put_in_hands(item)
	marked_item = item
	return ..()

/obj/item/fishingrod/abyssor_trident
	name = "trident of the depths"
	desc = "An instrument of Abyssor's wrath to claim his bounties and punish the ignorant."
	force = DAMAGE_SPEAR
	force_wielded = DAMAGE_SPEAR+2
	throwforce = DAMAGE_SPEAR_WIELD
	possible_item_intents = list(SPEAR_THRUST, ROD_AUTO, ROD_CAST)
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, POLEARM_BASH)
	icon = 'icons/roguetown/weapons/64.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	icon_state = "tridentgold"
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

	sharpness = IS_SHARP
	wlength = WLENGTH_GREAT
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	wdefense = GREAT_PARRY
	blade_dulling = DULLING_BASHCHOP

	max_blade_int = 50
	max_integrity = INTEGRITY_WORST/2 // not meant for long-term combat
	minstr = 7
	dropshrink = 0.9
	walking_stick = TRUE
	thrown_bclass = BCLASS_STAB

	throw_speed = 3
	embedding = list("embedded_pain_multiplier" = 4, "embed_chance" = 50, "embedded_fall_chance" = 5, "embedded_ignore_throwspeed_threshold" = 1)

	associated_skill = /datum/skill/combat/polearms

	obj_flags = CAN_BE_HIT
	resistance_flags = FIRE_PROOF
	experimental_onback = TRUE
	armor_penetration = 5
	can_parry = TRUE
	has_inspect_verb = TRUE

/obj/item/fishingrod/abyssor_trident/Initialize()
	. = ..()
	reel = new /obj/item/fishing/reel/abytrident(src)
	hook = new /obj/item/fishing/hook/abytrident(src)
	line = new /obj/item/fishing/line/no_line(src)
	baited = new /obj/item/fishing/bait/no_bait(src)

/obj/item/fishingrod/abyssor_trident/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/fishingrod/abyssor_trident/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!is_embedded)
		src.visible_message(span_warning("[src] dissipates into a splash of water!"), vision_distance = COMBAT_MESSAGE_RANGE)
		qdel(src)

/obj/item/fishingrod/abyssor_trident/unembedded()
	if(!QDELETED(src))
		src.visible_message(span_warning("[src] dissipates into a splash of water!"), vision_distance = COMBAT_MESSAGE_RANGE)
		qdel(src)
		return TRUE

/obj/item/fishingrod/abyssor_trident/attack_right(mob/user)
	return

/obj/item/fishingrod/abyssor_trident/afterattack(obj/target, mob/user, proximity, params)
	. = ..()
	baited = new /obj/item/fishing/bait/no_bait(src)

/obj/item/fishing/reel/abytrident
	name = "trident shaft"
	linehealth = 14
	difficultymod = 1

/obj/item/fishing/hook/abytrident
	name = "trident prong"
	deepfishingweight = -2
	sizemod = list("tiny" = -3, "small" = -2, "normal" = -1, "large" = 1, "prize" = 1)

/obj/item/fishing/line/no_line
	name = "lack of attachment"

/obj/item/fishing/bait/no_bait
	name = "lack of bait"
	baitpenalty = 10
	sizemod = list("tiny" = -2, "small" = -2, "normal" = -1, "large" = 1, "prize" = 1)
	fishinglist = list(/obj/item/reagent_containers/food/snacks/fish/carp = 1,
					/obj/item/reagent_containers/food/snacks/fish/eel = 1,
					/obj/item/reagent_containers/food/snacks/fish/shrimp = 1)
	deeplist = list(/obj/item/reagent_containers/food/snacks/fish/angler = 1,
					/obj/item/reagent_containers/food/snacks/fish/clownfish = 1)

/obj/effect/proc_holder/spell/invoked/ocean_embrace
	name = "Ocean's Embrace"
	overlay_state = "astrata"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 7
	warnie = "sydwarning"
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssor)
	sound = 'sound/foley/jumpland/waterland.wav'
	invocation = "Embrace the waters of Abyssor's domain."
	invocation_type = "shout"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/invoked/ocean_embrace/cast(list/targets, mob/living/user)
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]
		if(HAS_TRAIT(target, TRAIT_ATHEISM_CURSE))
			target.visible_message(span_danger("[target] recoils in disgust!"), span_userdanger("These fools are trying to cure me with religion!!"))
			target.cursed_freak_out()
			return FALSE

		if(target.mob_biotypes & MOB_UNDEAD) //blasts with debuffs rather than direct damage
			target.visible_message("<span class='danger'>[target] is drowned by turbulent tides!</span>", "<span class='userdanger'>I'm being drowned by turbulent tides!</span>")
			target.safe_throw_at(get_step(target, get_dir(user, target)), 1, 1, user, spin = TRUE, force = target.move_force)
			target.adjustOxyLoss(80)
			target.Knockdown(5)
			target.Slowdown(60)
			target.Dizzy(10)
			target.blur_eyes(20)
			target.emote("drown")
			return ..()

		target.visible_message("<span class='info'>A wave of replenishing water passes through [target]!</span>", "<span class='notice'>I'm engulfed in a wave of replenishing water!</span>")
		wash_atom(target, CLEAN_STRONG)
		var/situational_bonus = 1
		var/list/water = typesof(/turf/open/water) - typesof(/turf/open/water/acid)
		// the more water around us, the more we heal, up to times two
		for (var/turf/O in oview(3, user))
			if(O.type in water)
				situational_bonus = min(situational_bonus + 0.1, 2)
		if(situational_bonus != 1)
			to_chat(user, "Channeling Abyssor's power is easier in these conditions!")
		if(target.blood_volume > 0)
			target.blood_volume += BLOOD_VOLUME_OKAY * situational_bonus
		return ..()
	return FALSE

// KAIZOKU START

/obj/effect/proc_holder/spell/invoked/lesser_heal/abyssal //for now just an abyssal version of the same spell, just with a different sprite. Placeholder.
	name = "Lesser Miracle"
	overlay_state = "purification"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'

/obj/effect/proc_holder/spell/invoked/icebind
	name = "Barotrauma Bind" //People faithful to Abyssor will instantly be released from this spell.
	overlay_state = "waternet"
	overlay_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	chargedrain = 5
	releasedrain = 30
	charge_max = 50 SECONDS
	range = 8
	warnie = "aimwarn"
	movement_interrupt = FALSE
	sound = 'sound/magic/magic_nulled.ogg'
	action_icon_state = "spell0"
	action_icon = 'icons/roguetown/kaizoku/misc/spells.dmi'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	charge_max = 60 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum)
	devotion_cost = 45

/turf/open/proc/apply_ice_turf()
	var/prev_icon_state = icon_state //that code saves the original attributes of the turf to avoid a black void.
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
		if(!target_mob.has_status_effect(/datum/status_effect/abyssaltomb))
			target_mob.apply_status_effect(/datum/status_effect/abyssaltomb)
			target_mob.visible_message("<span class='warning'>[target_mob] is sealed within a crystalline abyssal tomb!</span>")
		else
			to_chat(user, span_warning("<span class='userdanger'>Your target is already immobilized within a frigid tomb from the ocean!</span>"))
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

/datum/status_effect/abyssaltomb/on_apply()
	tomb = new /obj/structure/abyssaltomb(get_turf(owner)) // Create the ice tomb, THEN move the victim inside
	tomb.encased_mob = owner
	if(istype(owner, /mob/living/carbon/human))
		tomb.buckle_mob(owner, TRUE, check_loc = FALSE)
		if(owner.patron && owner.patron.type == /datum/patron/divine/abyssor)
			to_chat(src, "<span class='debug'>Abyssor follower = no processing..</span>")
			tomb.processing = FALSE
		else
			to_chat(src, "<span class='debug'>Unbased person that don't follow abyssor, start to purify their ass.</span>")
			START_PROCESSING(SSobj, tomb) // Processing for non-Abyssor followers
	owner.forceMove(tomb) // Move the owner inside the tomb
	tomb.max_integrity = 300
	tomb.density = TRUE
	owner.visible_message("<span class='warning'>[owner] is encased in a crystalline tomb of ice.</span>")
	return ..()

/datum/status_effect/abyssaltomb/on_remove()
	if(tomb)
		tomb.unbuckle_all_mobs() //Avoid Qdelling the mob
		qdel(tomb)
	tomb = null
	return ..()

/obj/structure/abyssaltomb
	name = "abyssal tomb"
	desc = "A solid block of ice encasing a victim inside a pocket dimension deep on the ocean. One requires to break the coffin to be released from such depths."
	icon = 'icons/roguetown/kaizoku/misc/freezesprite.dmi'
	icon_state = "icespyre"
	density = TRUE
	max_integrity = 150
	buckle_lying = 0
	buckle_prevents_pull = 1
	layer = FLY_LAYER
	var/processing = TRUE
	var/last_attack
	var/mob/living/carbon/human/encased_mob

/obj/structure/abyssaltomb/Destroy()
	for(var/atom/movable/M in contents)
		M.forceMove(loc)
	if(encased_mob) // Use the linked mob reference
		encased_mob.remove_status_effect(/datum/status_effect/abyssaltomb)
	playsound(src, 'sound/combat/hits/onglass/glassbreak (2).ogg', 50, TRUE)
	return ..()

/obj/structure/abyssaltomb/process()
	to_chat(src, "<span class='debug'>Abyssal Tomb is processing properly.</span>")
	if(!has_buckled_mobs()) // If there are no mobs buckled, delete the tomb
		to_chat(src, "<span class='debug'>No buckled mobs found, deleting tomb.</span>")
		qdel(src)
		return
	for(var/mob/living/L in buckled_mobs)
		if(!iscarbon(L) || L.buckled != src)
			to_chat(src, "<span class='debug'>Invalid buckled mob detected, skipping.</span>")
			continue
		if(!last_attack) // Time tracking for damaging the buckled person
			last_attack = world.time
		var/barotrauma = 50 // 5 seconds for each
		if(world.time >= last_attack + barotrauma) // Pressure damage after enough time has passed
			last_attack = world.time
			src.visible_message("<span class='danger'>[src]'s crushing pressure squeezes [L] mercilessly!</span>")
			L.flash_fullscreen("whiteflash3")
			L.adjustBruteLoss(rand(10, 30))
			playsound(src, pick('sound/music/kaizoku/spells/abyssalpressure.ogg','sound/music/kaizoku/spells/abyssalpressure1.ogg','sound/music/kaizoku/spells/abyssalpressure2.ogg'), 100, FALSE)
		if(L.stat == DEAD)
			src.visible_message("<span class='danger'>[L]'s squeezed body is now released after death.</span>")
			qdel(src)

/obj/structure/abyssaltomb/user_unbuckle_mob(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(obj_broken)
		..()
		return

	if(isliving(user))
		var/mob/living/L = user
		var/willpower = CLAMP((L.STAINT * 2 - 10), 1, 99)
		var/barotrauma_roll = rand(1, 100)
		to_chat(user, "<span class='debug'>DEBUG: willpower=[willpower], barotrauma_roll=[barotrauma_roll]; To be released, have more Willpower than Barotrauma</span>")

		if(processing == FALSE)
			to_chat(M, "<span class='info'>[M]'s purified body quickly breaks away from the abyssal tomb.</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			qdel(src)
			return

		user.changeNext_move(CLICK_CD_RAPID)
		if(user != M)
			if(barotrauma_roll <= willpower) //Freeing someone else.
				to_chat(user, "<span class='info'>Your body warmth releases [M]'s from the pocket dimension.</span>")
				to_chat(M, "<span class='info'>You feel [user]'s warmth as light comes over to your eyes.</span>")
				M.remove_status_effect(/datum/status_effect/abyssaltomb)
				if(processing == TRUE)
					STOP_PROCESSING(SSobj, src)
				qdel(src)
			else
				to_chat(user, "<span class='danger'>You try to free [M], but you hand ricochets.</span>")
				to_chat(M, "<span class='info'>[user] attempts to free you, but your world spins instead.</span>")
				M.Stun(40)
				shake_camera(M, 15, 1)
			return

		if(barotrauma_roll <= willpower) // Freeing themselves
			to_chat(M, "<span class='info'>You push the pressure towards itself, finally released from its grasp.</span>")
			src.visible_message("<span class='info'>[M] manages to break down the abyssal tomb!</span>")
			M.remove_status_effect(/datum/status_effect/abyssaltomb)
			if(processing == TRUE)
				STOP_PROCESSING(SSobj, src)
			qdel(src)
		else
			to_chat(user, "<span class='warning'>You struggle to break free of the tomb, but remain trapped.</span>")
			user.Stun(40)
			shake_camera(user, 15, 1)

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
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum)
	sound = 'sound/magic/magic_nulled.ogg'
	invocation_type = "none"
	//invocation = "delivers sharp jabs and a sudden clap, unleashing a freezing shockwave that forms and launches a jagged ice spike."

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
	if(iscarbon(target))
		if(C.mob_biotypes & MOB_SPIRIT) // Abyssor's purifying filter absolutely destroys demonic essence.
			C.visible_message("<span class='info'>An otherworldly divine freeze encircles [target], filtering out their very existence!</span>", "<span class='notice'>My breath shallows- my ears rings, my senses overwhelmed with the crushing grip! I'M GOING TO IMPLODE FROM INSIDE OUT! PLEASE MERCY!</span>")
			C.adjustFireLoss(rand(50, 100)) //Random damage between 50 and 100. Very brutal, and proper for killing demons. Cold damage will come together with it after.
			C.Knockdown(40) //Purification successful. You will be paralyzed.
			C.Paralyze(1)
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if((C.faction = "orcs") || (C.dna.species?.id == "tiefling") ||(HAS_TRAIT(C, TRAIT_NASTY_EATER ))) // Had to give them these ones because there's a bunch of different goblin IDs. So Trait will have to stay until I care about giving each a respective var.
			C.visible_message("<span class='danger'>[target]'s body is distorced by the crushing force of the abyssal waters!</span>", "<span class='userdanger'>I feel the suffocating pressure of the deep crushing my lungs!</span>")
			C.adjustFireLoss(rand(30, 50)) // 30 to 50 damage, less than full demons. More damage comes from freezing.
			C.Knockdown(20) //Purification successful. You will be paralyzed.
			C.Paralyze(1) // Creatures with demon essence from Apotheosis war gets the second end of the stick.
			C.apply_status_effect(/datum/status_effect/debuff/freezing/severe)
			C.flash_fullscreen("whiteflash3")
			return
		if(C.dna.species?.id == "abyssariad"||C.dna.species?.id == "aasimar") //Barely does anything to "Pure" creatures. This proves their 'divinity' and purity ingame.
			C.visible_message("<span class='danger'>[target]'s body shivers slightly, yet remains sturdy.</span>", "<span class='userdanger'>A cold travel down my spine, yet I feel little to no pain.</span>")
			C.adjustBruteLoss(rand(5, 15)) // 10 to 15 damage. Don't even bother attacking these. They will not be frozen either.
			return
		else //Does not paralyze.
			C.visible_message("<span class='danger'>[target]'s body is being crushed!</span>", "<span class='userdanger'>I feel a suffocating pressure building on my body!</span>")
			C.adjustFireLoss(rand(20, 35)) //Normal creatures will still suffer the effects of Barotrauma, yet less in terms of damage. Will still freeze.
			C.apply_status_effect(/datum/status_effect/debuff/freezing)
			C.flash_fullscreen("whiteflash3")
			return

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
//experimental
