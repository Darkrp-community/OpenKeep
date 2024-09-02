
//Meatwheat - grows into synthetic meat
/obj/item/reagent_containers/food/snacks/grown/meatwheat
	name = "meatwheat"
	desc = ""
	icon_state = "meatwheat"
	gender = PLURAL
	filling_color = rgb(150, 0, 0)
	bitesize_mod = 2
//	seed = /obj/item/seeds/wheat/meat
	foodtype = MEAT | GRAIN
	grind_results = list(/datum/reagent/consumable/flour = 0, /datum/reagent/blood = 0)
	tastes = list("meatwheat" = 1)
	can_distill = FALSE

/obj/item/reagent_containers/food/snacks/grown/meatwheat/attack_self(mob/living/user)
	user.visible_message("<span class='notice'>[user] crushes [src] into meat.</span>", "<span class='notice'>I crush [src] into something that resembles meat.</span>")
	playsound(user, 'sound/blank.ogg', 50, TRUE)
	var/obj/item/reagent_containers/food/snacks/meat/slab/meatwheat/M = new
	qdel(src)
	user.put_in_hands(M)
	return 1
