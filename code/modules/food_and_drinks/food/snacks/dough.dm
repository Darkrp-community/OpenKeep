

/////////////////// Dough Ingredients ////////////////////////
/obj/item/reagent_containers/food/snacks/cakebatter
	name = "cake batter"
	desc = ""
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "cakebatter"
	cooked_type = /obj/item/reagent_containers/food/snacks/store/cake/plain
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("batter" = 1)
	foodtype = GRAIN | DAIRY
/*
// Cake batter + rolling pin = pie dough
/obj/item/reagent_containers/food/snacks/cakebatter/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/mace/woodclub/rollingpin))
		if(isturf(loc))
			new /obj/item/reagent_containers/food/snacks/piedough(loc)
			to_chat(user, "<span class='notice'>I flatten [src].</span>")
			qdel(src)
		else
			to_chat(user, "<span class='warning'>I need to put [src] on a surface to roll it out!</span>")
	else
		..()

/obj/item/reagent_containers/food/snacks/piedough
	name = "pie dough"
	desc = ""
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "piedough"
	slice_path = /obj/item/reagent_containers/food/snacks/rawpastrybase
	slices_num = 3
	cooked_type = /obj/item/reagent_containers/food/snacks/pie/plain
	list_reagents = list(/datum/reagent/consumable/nutriment = 9)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/rawpastrybase
	name = "raw pastry base"
	desc = ""
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "rawpastrybase"
	cooked_type = /obj/item/reagent_containers/food/snacks/pastrybase
	filling_color = "#CD853F"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("raw pastry" = 1)
	foodtype = GRAIN | DAIRY
*/
/obj/item/reagent_containers/food/snacks/pastrybase
	name = "pastry base"
	desc = ""
	icon = 'icons/obj/food/food_ingredients.dmi'
	icon_state = "pastrybase"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	filling_color = "#CD853F"
	tastes = list("pastry" = 1)
	foodtype = GRAIN | DAIRY
