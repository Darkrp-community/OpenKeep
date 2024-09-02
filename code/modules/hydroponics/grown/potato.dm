/*
/obj/item/reagent_containers/food/snacks/grown/potato/attackby(obj/item/W, mob/user, params)
	if(W.get_sharpness())
		to_chat(user, "<span class='notice'>I cut the potato into wedges with [W].</span>")
		var/obj/item/reagent_containers/food/snacks/grown/potato/wedges/Wedges = new /obj/item/reagent_containers/food/snacks/grown/potato/wedges
		remove_item_from_storage(user)
		qdel(src)
		user.put_in_hands(Wedges)
	else
		return ..()
*/

