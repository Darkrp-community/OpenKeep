/obj/structure/toilet
	name = "toilet"
	desc = ""
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE
	var/open = FALSE			//if the lid is up
	var/cistern = 1			//if the cistern bit is open
	var/w_items = 0			//the combined w_class of all the items in the cistern

/obj/structure/toilet/Initialize()
	. = ..()


/obj/structure/toilet/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(cistern && user.CanReach(src))
		if(!contents.len)
			to_chat(user, "<span class='notice'>The toilet is empty.</span>")
		else
			var/obj/item/I = pick(contents)
			if(ishuman(user))
				user.put_in_hands(I)
			else
				I.forceMove(drop_location())
			to_chat(user, "<span class='notice'>I find [I] in the toilet.</span>")
			w_items -= I.w_class
//	else
//		open = !open
//		update_icon()


/obj/structure/toilet/update_icon_state()
	icon_state = "toilet"


/obj/structure/toilet/attackby(obj/item/I, mob/living/user, params)
	add_fingerprint(user)
	if(I.tool_behaviour == TOOL_CROWBAR)
		to_chat(user, "<span class='notice'>I start to [cistern ? "replace the lid on the cistern" : "lift the lid off the cistern"]...</span>")
		playsound(loc, 'sound/blank.ogg', 50, TRUE)
		if(I.use_tool(src, user, 30))
			user.visible_message("<span class='notice'>[user] [cistern ? "replaces the lid on the cistern" : "lifts the lid off the cistern"]!</span>", "<span class='notice'>I [cistern ? "replace the lid on the cistern" : "lift the lid off the cistern"]!</span>", "<span class='hear'>I hear grinding porcelain.</span>")
			cistern = !cistern
			update_icon()
	else if(I.tool_behaviour == TOOL_WRENCH && !(flags_1&NODECONSTRUCT_1))
		I.play_tool_sound(src)
		deconstruct()
	else if(cistern)
		if(user.used_intent.type != INTENT_HARM)
			if(I.w_class > WEIGHT_CLASS_NORMAL)
				to_chat(user, "<span class='warning'>[I] does not fit!</span>")
				return
			if(w_items + I.w_class > WEIGHT_CLASS_HUGE)
				to_chat(user, "<span class='warning'>The toilet is full!</span>")
				return
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>\The [I] is stuck to your hand, you cannot put it in the cistern!</span>")
				return
			w_items += I.w_class
			to_chat(user, "<span class='notice'>I carefully place [I] into the toilet.</span>")

	else
		return ..()

/obj/structure/toilet/secret
	var/obj/item/secret
	var/secret_type = null

/obj/structure/toilet/secret/Initialize(mapload)
	. = ..()
	if (secret_type)
		secret = new secret_type(src)
		secret.desc += " It's a secret!"
		w_items += secret.w_class
		contents += secret

/obj/structure/toilet/greyscale
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR

