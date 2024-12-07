/obj/structure/trap
	name = "IT'S A TRAP"
	desc = ""
	icon = 'icons/roguetown/misc/traps.dmi'
	icon_state = "trap_plate"
	density = FALSE
	anchored = TRUE
	alpha = 80
	///What to say when antimagic'd
	var/flare_message
	///What to say when found
	var/found_message
	var/last_trigger = 0
	var/time_between_triggers = 1 MINUTES
	///-1==infinite, otherwise deletes at 0
	var/charges = -1
	var/checks_antimagic = TRUE

	var/list/static/ignore_typecache
	var/list/mob/immune_minds = list()

	var/sparks = TRUE
	var/datum/effect_system/spark_spread/spark_system

/obj/structure/trap/Initialize(mapload)
	. = ..()
	if(isnull(flare_message))
		flare_message = span_warning("\The [src] fizzles!")
	if(isnull(found_message))
		found_message = span_warning("\The [src] reveals itself!")
	spark_system = new
	spark_system.set_up(4,1,src)
	spark_system.attach(src)

	if(!ignore_typecache)
		ignore_typecache = typecacheof(list(
			/obj/effect,
			/mob/dead))

/obj/structure/trap/Destroy()
	qdel(spark_system)
	spark_system = null
	. = ..()

/obj/structure/trap/examine(mob/user)
	. = ..()
	if(!isliving(user))
		return
	if(user.mind && (user.mind in immune_minds))
		return
	if(get_dist(user, src) <= 1)
		. += span_notice("I reveal [src]")
		flare()

///Make trap vizible and disarmed for a cooldown time, but dont take charge.
/obj/structure/trap/proc/flare(fizzle = FALSE)
	// Makes the trap visible, and starts the cooldown until it's
	// able to be triggered again.
	if(fizzle)
		visible_message(flare_message)
	else
		visible_message(found_message)
	if(sparks)
		spark_system.start()
	alpha = 200
	last_trigger = world.time
	animate(src, alpha = initial(alpha), time = time_between_triggers)

/obj/structure/trap/Crossed(atom/movable/AM)
	if(is_type_in_typecache(AM, ignore_typecache))
		return
	if(isliving(AM))
		if(trap_check(AM))
			trigger_step_on(AM)

/obj/structure/trap/Uncrossed(atom/movable/AM)
	if(is_type_in_typecache(AM, ignore_typecache))
		return
	if(isliving(AM))
		if(trap_check(AM))
			trigger_step_off(AM)

///Knocks off charge, deletes it if it runs out
/obj/structure/trap/proc/lose_charge()
	if(charges < 0)
		return
	if(charges > 0)
		charges--
	if(charges == 0)
		animate(src, alpha = 0, time = 5)
		QDEL_IN(src, 5)
	return
///Common checks to make sure we can trigger the trap.
/// True == Yep we good.
/obj/structure/trap/proc/trap_check(mob/living/victim)
	if(last_trigger + time_between_triggers > world.time)
		return FALSE
	if(victim.mind in immune_minds)
		return FALSE
	if(checks_antimagic && victim.anti_magic_check())
		flare(TRUE)
		return FALSE
	return TRUE
///Utility to set the last trigger time,show trap, and deduct charges.
/obj/structure/trap/proc/post_triggered()
	flare()
	lose_charge()
///Called when someone steps OFF and we're ready, make sure to deduct charges and set time
/obj/structure/trap/proc/trigger_step_off(mob/living/victim)
	playsound(src, 'sound/misc/pressurepad_up.ogg', 65, extrarange = 2)
	return
///Called when someone steps ON and we're ready
/obj/structure/trap/proc/trigger_step_on(mob/living/L)
	to_chat(L, span_info("I feel a 'click' beneath me..."))
	playsound(src, 'sound/misc/pressurepad_down.ogg', 65, extrarange = 2)
	return


/obj/structure/trap/shock
	name = "lightning plate trap"

/obj/structure/trap/shock/trigger_step_on(mob/living/victim)
	..()
	victim.electrocute_act(30, src, flags = SHOCK_NOGLOVES) // electrocute act does a message.
	victim.Paralyze(5 SECONDS)
	post_triggered()

/obj/structure/trap/fire
	name = "flamejet plate trap"

/obj/structure/trap/fire/trigger_step_on(mob/living/L)
	..()
	to_chat(L,span_danger("The ground suddenly erupts in flame!"))
	L.Paralyze(1 SECONDS)
	new /obj/effect/hotspot(get_turf(src))
	post_triggered()

/obj/structure/trap/chill
	name = "frost plate trap"

/obj/structure/trap/chill/trigger_step_on(mob/living/L)
	..()
	to_chat(L, span_danger("I am suddenly frozen solid!"))
	L.apply_status_effect(/datum/status_effect/frost_trap)
	post_triggered()

/obj/structure/trap/spike
	name = "spike plate trap"

/obj/structure/trap/spike/trigger_step_on(mob/living/L)
	..()
	to_chat(L, span_danger("Spikes erupt from the ground, skewering me!"))
	L.Paralyze(5 SECONDS)
	L.adjustBruteLoss(40)
	post_triggered()

