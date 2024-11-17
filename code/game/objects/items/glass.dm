/obj/item/natural/glass
	name = "glass"
	desc = "Glass panes for constructing windows."
	icon_state = "glasspane"
	possible_item_intents = list(/datum/intent/use)
	force = 10
	throwforce = 12
	throw_range = 5
	obj_flags = null
	max_integrity = 20
	w_class = WEIGHT_CLASS_BULKY
	bundletype = /obj/item/natural/bundle/glass

/obj/item/natural/glass/attack_right(mob/user)
	to_chat(user, "<span class='warning'>I start to collect [src]...</span>")
	if(move_after(user, 5 SECONDS, target = src))
		var/glasscount = 0
		for(var/obj/item/natural/glass/F in get_turf(src))
			glasscount++
		while(glasscount > 0)
			if(glasscount == 1)
				new /obj/item/natural/glass(get_turf(user))
				glasscount--
			else if(glasscount >= 2)
				var/obj/item/natural/bundle/glass/B = new(get_turf(user))
				B.amount = clamp(glasscount, 2, 3)
				B.update_bundle()
				glasscount -= clamp(glasscount, 2, 3)
		for(var/obj/item/natural/glass/F in get_turf(src))
			qdel(F)

/obj/item/natural/bundle/glass
	name = "stack of glass"
	desc = "A stack of fragile glass panes."
	icon_state = "glasspane1"
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "glass"
	stacktype = /obj/item/natural/glass
	maxamount = 3
	icon1 = "glasspane1"
	icon1step = 2
	icon2 = "glasspane2"
	icon2step = 3

/obj/item/natural/glass/shard
	name = "shard"
	desc = "A sharp shard of glass."
	icon = 'icons/obj/shards.dmi'
	icon_state = "large"
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/stab)
	force = 3
	throwforce = 5
	item_state = "shard-glass"
	resistance_flags = null
	w_class = WEIGHT_CLASS_TINY
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	attack_verb = list("stabbed", "slashed", "sliced", "cut")
	max_integrity = 40
	smeltresult = /obj/item/natural/glass
