/obj/item/undies
	name = "smallclothes"
	desc = "An Eoran designed undergarment to cover the loins."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "undies"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	var/gendered = MALE
	var/race
	var/cached_undies

/obj/item/undies/f
	name = "women's smallclothes"
	desc = "An Eoran designed undergarment to cover the privates and chest."
	icon_state = "girlundies"
	gendered = FEMALE

/obj/item/undies/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.gender != gendered)
			return
		if(H.underwear == "Nude" && H.cached_underwear != "Nude")
			user.visible_message("<span class='notice'>[user] tries to put [src] on [H]...</span>")
			if(do_after(user, 50, needhand = 1, target = H))
				get_location_accessible(H, BODY_ZONE_PRECISE_GROIN)
				H.underwear = H.cached_underwear
				H.underwear_color = color
				H.update_body()
				qdel(src)

/obj/item/undies/fundoshi
	name = "fundoshi"
	desc = "Simple undergarment that is merely a cloth folded on itself."
	icon = 'icons/roguetown/kaizoku/clothingicon/underwear.dmi'
	icon_state = "fundoshi"

/obj/item/undies/fundoshi/f
	name = "female fundoshi"
	desc = "Simple undergarment that is merely a cloth folded on itself."
	icon_state = "girlfundoshi"
	gendered = FEMALE
