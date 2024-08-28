
/obj/item/bomb
	name = "bottle bomb"
	desc = "Dangerous explosion, in a bottle."
	icon_state = "clear_bomb"
	icon = 'icons/roguetown/items/cooking.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	//dropshrink = 0
	throwforce = 0
	slot_flags = ITEM_SLOT_HIP
	throw_speed = 0.5
	var/fuze = 50
	var/lit = FALSE
	var/prob2fail = 23

/obj/item/bomb/homemade
	prob2fail = 30

/obj/item/bomb/homemade/Initialize()
	. = ..()
	fuze = rand(20, 50)

/obj/item/bomb/spark_act()
	light()

/obj/item/bomb/fire_act()
	light()

/obj/item/bomb/ex_act()
	if(!QDELETED(src))
		lit = TRUE
		explode(TRUE)

/obj/item/bomb/proc/light()
	if(!lit)
		START_PROCESSING(SSfastprocess, src)
		icon_state = "clear_bomb_lit"
		lit = TRUE
		playsound(src.loc, 'sound/items/firelight.ogg', 100)
		if(ismob(loc))
			var/mob/M = loc
			M.update_inv_hands()

/obj/item/bomb/extinguish()
	snuff()

/obj/item/bomb/proc/snuff()
	if(lit)
		lit = FALSE
		STOP_PROCESSING(SSfastprocess, src)
		playsound(src.loc, 'sound/items/firesnuff.ogg', 100)
		icon_state = "bbomb"
		if(ismob(loc))
			var/mob/M = loc
			M.update_inv_hands()

/obj/item/bomb/proc/explode(skipprob)
	STOP_PROCESSING(SSfastprocess, src)
	var/turf/T = get_turf(src)
	if(T)
		if(lit)
			if(!skipprob && prob(prob2fail))
				snuff()
			else
				explosion(T, light_impact_range = 1, flame_range = 2, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))
		else
			if(prob(prob2fail))
				snuff()
			else
				playsound(T, 'sound/items/firesnuff.ogg', 100)
				new /obj/item/shard (T)
	qdel(src)

/obj/item/bomb/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	explode()

/obj/item/bomb/process()
	fuze--
	if(fuze <= 0)
		explode(TRUE)

/obj/item/grenade/smoke_bomb
	name = "abyssariad smokebomb"
	desc = "The stealth operation bomb made out of guano, sugar and nahcolite for shinobi usage."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "smoke_bomb"
	item_state = "smoke_bomb"
	slot_flags = ITEM_SLOT_BELT

/obj/item/grenade/smoke_bomb/attack_self(mob/user)
	user.visible_message("<span class='warning'>[user]'s hand breaks the ceramic of the [src], releasing smoke!</span>", "<span class='notice'>I squeeze [src] down to release the inner compounds to the air.</span>")
	prime()

/obj/item/grenade/smoke_bomb/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	prime()

/obj/item/grenade/smoke_bomb/smokebomb/prime()
	update_mob()
	playsound(src, 'sound/blank.ogg', 50, TRUE, -3)
	var/datum/effect_system/smoke_spread/bad/smoke = new
	smoke.set_up(4, src)
	smoke.start()
	qdel(smoke)
	qdel(src)

/obj/item/grenade/smoke_bomb/poison
	name = "abyssariad poisonbomb"
	desc = "Ceramic sphere containing toxic composts from within, awaiting to be released."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "poison_bomb"
	item_state = "poison_bomb"
	slot_flags = ITEM_SLOT_BELT

/obj/item/grenade/smoke_bomb/poison/attack_self(mob/user)
	user.visible_message("<span class='warning'>[user]'s hand breaks the ceramic of the [src], engulfing themselves on poisonous smoke.</span>", "<span class='notice'>I squeeze [src] down to release the inner compounds- like an IDIOT. RUN AWAY!</span>")
	prime()

/obj/item/grenade/smoke_bomb/poison/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	..()
	prime()

/obj/item/grenade/smoke_bomb/poison/prime()
	update_mob()
	playsound(src, 'sound/blank.ogg', 50, TRUE, -3)
	var/datum/effect_system/smoke_spread/bad/stupid/smoke = new
	smoke.set_up(4, src)
	smoke.start()
	qdel(smoke)
	qdel(src)

/obj/item/zhentianlei
	name = "thunder crash bomb"
	desc = "a bomb made out of cast iron and ceramic, now filled with gunpowder to the brim. Usually, it takes five second before the fire on the fuse reaches the gunpowder."
	icon_state = "zhentianlei"
	icon = 'icons/roguetown/weapons/32.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	throwforce = 0
	throw_speed = 0.5
	slot_flags = ITEM_SLOT_HIP

	var/lit = FALSE
	var/active = FALSE
	var/fuze = 50  // about five seconds
	var/turf/ignited_turf = null
	var/obj/item/ignited_by = null
	var/initial_icon_state = "zhentianlei"
	var/active_icon_state = "zhentianlei_rewinded"
	var/prob2fail = 23  // chance of failure

/obj/item/zhentianlei/spark_act()
	ignite()

/obj/item/zhentianlei/fire_act()
	ignite()

/obj/item/zhentianlei/ex_act()
	if(!QDELETED(src))
		lit = TRUE
		trigger_explosion(TRUE)

/obj/item/zhentianlei/New()
	..()
	icon_state = initial_icon_state

/obj/item/zhentianlei/proc/ignite(atom/igniter = null)
	if(!lit)
		START_PROCESSING(SSfastprocess, src)  // Start the processing for the fuse
		icon_state = active_icon_state
		lit = TRUE
		active = TRUE
		ignited_by = igniter
		playsound(src.loc, 'sound/items/firelight.ogg', 100)
		to_chat(src.loc, "<span class='warning'>The [name] starts to fizzle!</span>")
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_hands()

/obj/item/zhentianlei/proc/stop_ignition()
	if(lit)
		lit = FALSE
		active = FALSE
		STOP_PROCESSING(SSfastprocess, src) 
		icon_state = initial_icon_state
		ignited_by = null
		playsound(src.loc, 'sound/items/firesnuff.ogg', 100)
		to_chat(src.loc, "<span class='notice'>The [name] has been snuffed out.</span>")
		if(ismob(src.loc))
			var/mob/M = src.loc
			M.update_inv_hands()

/obj/item/zhentianlei/proc/trigger_explosion(skipprob = FALSE)
	STOP_PROCESSING(SSfastprocess, src)  // Stop the processing for the fuse
	var/turf/T = get_turf(src)
	if(T)
		if(lit && active)
			var/prob_fail = prob2fail
			if(ignited_by && istype(ignited_by, /obj/item))
				var/obj/item/igniter = ignited_by
				if(igniter.vars["prob2fail"])
					prob_fail = igniter.vars["prob2fail"]
			if(!skipprob && prob(prob_fail))
				stop_ignition()
			else
				explosion(T, light_impact_range = 2, flame_range = 4, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))
		else
			if(prob(prob2fail))
				stop_ignition()
			else
				playsound(T, 'sound/items/firesnuff.ogg', 100)
				new /obj/item/shard (T)
	qdel(src)

/obj/item/zhentianlei/proc/is_flammable(atom/target)
	if(isturf(target))
		return (target.vars["flags"] & FLAMMABLE) != 0
	return FALSE

/obj/item/zhentianlei/process()
	if(active && lit)
		fuze -= 1
		if(fuze <= 0)
			trigger_explosion(TRUE)
	else if(active && !lit)
		stop_ignition()

/obj/item/zhentianlei/examine(mob/user)
	var/inspect_text = ..()
	if(active)
		inspect_text += "The fuse is burning!"
	else
		inspect_text += "The fuse is not lit."
	return inspect_text

/*
    // I did not find the trigger for cutting tool. This is to either 
/obj/item/zhentianlei/attackby(obj/item/tool/cutting/C, mob/user)
		if(fuze > 30)
			fuze = 30
			to_chat(user, "<span class='warning'>You shorten the fuse of the [name].</span>")
			playsound(src.loc, 'sound/items/fusecut.ogg', 100) 
		else
			fuze = 0
			to_chat(user, "<span class='danger'>You shorten the fuse even more, turning it into a booby trap!</span>")
			playsound(src.loc, 'sound/items/fusecut.ogg', 100) 
		return TRUE
*/