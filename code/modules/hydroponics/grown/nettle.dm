
/obj/item/reagent_containers/food/snacks/grown/nettle // "snack"
//	seed = /obj/item/seeds/nettle
	name = "nettle"
	desc = ""
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "nettle"
	lefthand_file = 'icons/mob/inhands/weapons/plants_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/plants_righthand.dmi'
	damtype = "fire"
	force = 15
	hitsound = 'sound/blank.ogg'
	throwforce = 5
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3
	attack_verb = list("stung")

/obj/item/reagent_containers/food/snacks/grown/nettle/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is eating some of [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS|TOXLOSS)

/obj/item/reagent_containers/food/snacks/grown/nettle/pickup(mob/living/user)
	..()
	if(!iscarbon(user))
		return FALSE
	var/mob/living/carbon/C = user
	if(C.gloves)
		return FALSE
	if(HAS_TRAIT(C, TRAIT_PIERCEIMMUNE))
		return FALSE
	var/hit_zone = (C.held_index_to_dir(C.active_hand_index) == "l" ? "l_":"r_") + "arm"
	var/obj/item/bodypart/affecting = C.get_bodypart(hit_zone)
	if(affecting)
		if(affecting.receive_damage(0, force))
			C.update_damage_overlays()
	to_chat(C, "<span class='danger'>The nettle burns your bare hand!</span>")
	return TRUE

/obj/item/reagent_containers/food/snacks/grown/nettle/afterattack(atom/A as mob|obj, mob/user,proximity)
	. = ..()
	if(!proximity)
		return
	if(force > 0)
		force -= rand(1, (force / 3) + 1) // When you whack someone with it, leaves fall off
	else
		to_chat(usr, "<span class='warning'>All the leaves have fallen off the nettle from violent whacking.</span>")
		qdel(src)

/obj/item/reagent_containers/food/snacks/grown/nettle/basic
//	seed = /obj/item/seeds/nettle


/obj/item/reagent_containers/food/snacks/grown/nettle/death
//	seed = /obj/item/seeds/nettle/death
	name = "deathnettle"
	desc = ""
	icon_state = "deathnettle"
	force = 30
	throwforce = 15


/obj/item/reagent_containers/food/snacks/grown/nettle/death/pickup(mob/living/carbon/user)
	if(..())
		if(prob(50))
			user.Paralyze(100)
			to_chat(user, "<span class='danger'>I are stunned by the Deathnettle as you try picking it up!</span>")

/obj/item/reagent_containers/food/snacks/grown/nettle/death/attack(mob/living/carbon/M, mob/user)
	if(!..())
		return
	if(isliving(M))
		to_chat(M, "<span class='danger'>I are stunned by the powerful acid of the Deathnettle!</span>")
		log_combat(user, M, "attacked", src)

		M.adjust_blurriness(force/7)
		if(prob(20))
			M.Unconscious(force / 0.3)
			M.Paralyze(force / 0.75)
		M.drop_all_held_items()
