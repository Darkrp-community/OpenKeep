/obj/item/rogueweapon/lordscepter
	force = 20
	force_wielded = 20
	possible_item_intents = list(/datum/intent/lordbash, /datum/intent/lord_electrocute, /datum/intent/lord_silence)
	gripped_intents = list(/datum/intent/lordbash)
	name = "master's rod"
	desc = "Bend the knee."
	icon_state = "scepter"
	icon = 'icons/roguetown/weapons/32.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	resistance_flags = FIRE_PROOF|LAVA_PROOF // Nigh indestructible due to how important it is
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = null // No
	swingsound = BLUNTWOOSH_MED
	minstr = 5
	blade_dulling = DULLING_BASHCHOP

/datum/intent/lordbash
	name = "bash"
	blade_class = BCLASS_BLUNT
	icon_state = "inbash"
	attack_verb = list("bashes", "strikes")
	penfactor = 10

/datum/intent/lord_electrocute
	name = "electrocute"
	blade_class = null
	icon_state = "inuse"
	tranged = TRUE
	noaa = TRUE

/datum/intent/lord_silence
	name = "silence"
	blade_class = null
	icon_state = "inuse"
	tranged = TRUE
	noaa = TRUE

/obj/item/rogueweapon/lordscepter/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = -7,"nx" = 11,"ny" = -6,"wx" = -1,"wy" = -6,"ex" = 3,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -1,"sy" = -4,"nx" = 1,"ny" = -3,"wx" = -1,"wy" = -6,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 20,"wturn" = 18,"eturn" = -19,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 0,"sy" = 2,"nx" = 1,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 4,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/lordscepter/afterattack(atom/target, mob/user, flag)
	. = ..()
	if(get_dist(user, target) > 7)
		return

	user.changeNext_move(CLICK_CD_MELEE)
	user.visible_message("<span class='warning'>[user] points [src] at [target].</span>")

	if(ishuman(user))
		var/mob/living/carbon/human/HU = user

		if((HU.job != "King") && (HU.job != "Queen"))
			to_chat(user, "<span class='danger'>The rod doesn't obey me.</span>")
			return

		if(ishuman(target))
			var/mob/living/carbon/human/H = target

			if(H == HU)
				return

			if(H.anti_magic_check())
				return
		
			if(!(H in SStreasury.bank_accounts))
				return

			if(istype(user.used_intent, /datum/intent/lord_electrocute))
				HU.visible_message("<span class='warning'>[HU] electrocutes [H] with \the [src].</span>")
				H.electrocute_act(5, src)
				to_chat(H, "<span class='danger'>I'm electrocuted by the scepter!</span>")
				return

			if(istype(user.used_intent, /datum/intent/lord_silence))
				HU.visible_message("<span class='warning'>[HU] silences [H] with \the [src].</span>")
				H.dna.add_mutation(/datum/mutation/human/mute)
				addtimer(CALLBACK(H.dna, TYPE_PROC_REF(/datum/dna/, remove_mutation), /datum/mutation/human/mute), 20 SECONDS)
				to_chat(H, "<span class='danger'>I'm silenced by the scepter!</span>")
				return

/obj/item/rogueweapon/mace/stunmace
	force = 15
	force_wielded = 15
	name = "stunmace"
	icon_state = "stunmace0"
	desc = "A dwarven invention, a mace that bears tiny soul-gems that imbue the crown of the mace with lightning mana."
	gripped_intents = null
	w_class = WEIGHT_CLASS_NORMAL
	possible_item_intents = list(/datum/intent/mace/strike/stunner, /datum/intent/mace/smash/stunner)
	wbalance = 0
	minstr = 5
	wdefense = 0
	var/charge = 100
	var/on = FALSE

/datum/intent/mace/strike/stunner/afterchange()
	var/obj/item/rogueweapon/mace/stunmace/I = masteritem
	if(I)
		if(I.on)
			hitsound = list('sound/items/stunmace_hit (1).ogg','sound/items/stunmace_hit (2).ogg')
		else
			hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	. = ..()

/datum/intent/mace/smash/stunner/afterchange()
	var/obj/item/rogueweapon/mace/stunmace/I = masteritem
	if(I)
		if(I.on)
			hitsound = list('sound/items/stunmace_hit (1).ogg','sound/items/stunmace_hit (2).ogg')
		else
			hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	. = ..()

/obj/item/rogueweapon/mace/stunmace/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/rogueweapon/mace/stunmace/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/rogueweapon/mace/stunmace/funny_attack_effects(mob/living/target, mob/living/user, nodmg)
	. = ..()
	if(on)
		target.electrocute_act(5, src)
		charge -= 33
		if(charge <= 0)
			on = FALSE
			charge = 0
			update_icon()
			if(user.a_intent)
				var/datum/intent/I = user.a_intent
				if(istype(I))
					I.afterchange()

/obj/item/rogueweapon/mace/stunmace/update_icon()
	if(on)
		icon_state = "stunmace1"
	else
		icon_state = "stunmace0"

/obj/item/rogueweapon/mace/stunmace/attack_self(mob/user)
	if(on)
		on = FALSE
	else
		if(charge <= 33)
			to_chat(user, "<span class='warning'>It's out of mana.</span>")
			return
		user.visible_message("<span class='warning'>[user] flicks [src] on.</span>")
		on = TRUE
		charge--
	playsound(user, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)
	if(user.a_intent)
		var/datum/intent/I = user.a_intent
		if(istype(I))
			I.afterchange()
	update_icon()
	add_fingerprint(user)

/obj/item/rogueweapon/mace/stunmace/process()
	if(on)
		charge--
	else
		if(charge < 100)
			charge++
	if(charge <= 0)
		on = FALSE
		charge = 0
		update_icon()
		var/mob/user = loc
		if(istype(user))
			if(user.a_intent)
				var/datum/intent/I = user.a_intent
				if(istype(I))
					I.afterchange()
		playsound(src, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)

/obj/item/rogueweapon/mace/stunmace/extinguish()
	if(on)
		var/mob/living/user = loc
		if(istype(user))
			user.electrocute_act(5, src)
		on = FALSE
		charge = 0
		update_icon()
		playsound(src, pick('sound/items/stunmace_toggle (1).ogg','sound/items/stunmace_toggle (2).ogg','sound/items/stunmace_toggle (3).ogg'), 100, TRUE)

/obj/item/rogueweapon/tetsubishi //I humbly request someone to cook the 'jump' not causing damage.
	name = "tetsubishi"
	desc = "a sharp spike object used to slow down pursuer, often used by Abyssariad Shinobis, it has been massproduced and shipped to Heartfell."
	icon_state = "tetsubishi"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	force = 5
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	block_chance = 0
	armor_penetration = 5
	sharpness = IS_SHARP
	custom_materials = null
	can_parry = FALSE
	wlength = 6
	sellprice = 1
	has_inspect_verb = TRUE
	parrysound = list('sound/combat/parry/parrygen.ogg')
	anvilrepair = /datum/skill/craft/weaponsmithing
	obj_flags = CAN_BE_HIT
	blade_dulling = DULLING_BASH
	max_integrity = 60
	wdefense = 3
	experimental_onhip = TRUE
	experimental_onback = TRUE
	embedding = list(
		"embed_chance" = 60,
		"embedded_pain_multiplier" = 1,
		"embedded_fall_chance" = 0,
	)
	attack_verb = list("stabbed", "slashed", "sliced", "cut")
	hitsound = 'sound/blank.ogg'
	var/icon_prefix

/obj/item/rogueweapon/tetsubishi/Initialize()
	. = ..()
	AddComponent(/datum/component/kaizoku/caltrop, 20, 30, 100, CALTROP_BYPASS_SHOES)

/obj/item/rogueweapon/tetsubishi/Crossed(mob/living/L)
	playsound(loc, 'sound/foley/flesh_rem2.ogg', TRUE)
	return ..()

/datum/component/kaizoku/caltrop //Less laggy alternative for the server-destroying OG caltrops.
	var/min_damage
	var/max_damage
	var/probability
	var/flags

	var/cooldown = 0

/datum/component/kaizoku/caltrop/Initialize(_min_damage = 0, _max_damage = 0, _probability = 100,  _flags = NONE)
	min_damage = _min_damage
	max_damage = max(_min_damage, _max_damage)
	probability = _probability
	flags = _flags

	RegisterSignal(parent, list(COMSIG_MOVABLE_CROSSED), PROC_REF(Crossed))

/datum/component/kaizoku/caltrop/proc/Crossed(datum/source, atom/movable/AM)
	var/atom/A = parent
	if(!prob(probability))
		return

	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if((flags & CALTROP_IGNORE_WALKERS) && H.m_intent == MOVE_INTENT_WALK)
			return

		var/picked_def_zone = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
		var/obj/item/bodypart/O = H.get_bodypart(picked_def_zone)
		if(!istype(O))
			return

		var/feetCover = (H.wear_armor && (H.wear_armor.body_parts_covered & FEET)) || (H.wear_pants && (H.wear_pants.body_parts_covered & FEET))

		if(!(flags & CALTROP_BYPASS_SHOES) && (H.shoes || feetCover))
			return

		if((H.movement_type & FLYING) || H.buckled)
			return

		var/damage = rand(min_damage, max_damage)
		H.apply_damage(damage, BRUTE, picked_def_zone)

		if(cooldown < world.time - 10) //cooldown to avoid message spam.
			if(!H.incapacitated(ignore_restraints = TRUE))
				H.visible_message("<span class='danger'>[H] steps on [A] as it pierces skin.</span>", \
						"<span class='danger'>I feel my feet being pierced as I step on [A]!</span>")
			else
				H.visible_message("<span class='danger'>[H] slides on [A]!</span>", \
						"<span class='danger'>I slide on [A]!</span>")

			cooldown = world.time
		H.Stun(60)
