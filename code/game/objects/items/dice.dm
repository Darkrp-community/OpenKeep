
/obj/item/dice //depreciated d6, use /obj/item/dice/d6 if you actually want a d6
	name = "die"
	desc = ""
	icon = 'icons/obj/dice.dmi'
	icon_state = "d6"
	w_class = WEIGHT_CLASS_TINY
	var/sides = 6
	var/result = null
	var/list/special_faces = list() //entries should match up to sides var if used
	var/microwave_riggable = TRUE

	var/rigged = DICE_NOT_RIGGED
	var/rigged_value

/obj/item/dice/Initialize()
	. = ..()
	if(!result)
		result = roll(sides)
	update_icon()

/obj/item/dice/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is gambling with death! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (OXYLOSS)


/obj/item/dice/attack_self(mob/user)
	diceroll(user)

/obj/item/dice/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	diceroll(thrownby)
	. = ..()

/obj/item/dice/proc/diceroll(mob/user)
	result = roll(sides)
	if(rigged != DICE_NOT_RIGGED && result != rigged_value)
		if(rigged == DICE_BASICALLY_RIGGED && prob(CLAMP(1/(sides - 1) * 100, 25, 80)))
			result = rigged_value
		else if(rigged == DICE_TOTALLY_RIGGED)
			result = rigged_value

	. = result

	var/fake_result = roll(sides)//Daredevil isn't as good as he used to be
	var/comment = ""
	if(sides == 20 && result == 20)
		comment = "NAT 20!"
	else if(sides == 20 && result == 1)
		comment = "Ouch, bad luck."
	update_icon()
	if(initial(icon_state) == "d00")
		result = (result - 1)*10
	if(special_faces.len == sides)
		result = special_faces[result]
	if(user != null) //Dice was rolled in someone's hand
		user.visible_message("<span class='notice'>[user] has thrown [src]. It lands on [result]. [comment]</span>", \
							"<span class='notice'>I throw [src]. It lands on [result]. [comment]</span>", \
							"<span class='hear'>I hear [src] rolling, it sounds like a [fake_result].</span>")
	else if(!src.throwing) //Dice was thrown and is coming to rest
		visible_message("<span class='notice'>[src] rolls to a stop, landing on [result]. [comment]</span>")

/obj/item/dice/update_icon()
	cut_overlays()
	add_overlay("[src.icon_state]-[src.result]")
