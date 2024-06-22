/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can be plated and usually needs rare tools or ingridients. Typically based on a snack but not necessarily
 *		 (Meals)		*
 *						*
 * * * * * * * * * * * **/



/*	..................   Pepper steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/peppersteak
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("steak" = 1, "pepper" = 1)
	name = "peppersteak"
	desc = "Roasted flesh flanked with a generous coating of ground pepper for intense flavor."
	icon_state = "peppersteak"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = 30 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
/obj/item/reagent_containers/food/snacks/rogue/peppersteak/plated
	icon_state = "peppersteak_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT


/*	..................   Onion steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/onionsteak
	name = "onion steak"
	desc = "Roasted flesh garnished with tender fried onions. Fragrant and slathered with juices of both ingredients to a perfect mouth-watering sauce."
	icon_state = "onionsteak"
	tastes = list("steak" = 1, "onions" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+3)
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = 30 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
/obj/item/reagent_containers/food/snacks/rogue/onionsteak/plated
	icon_state = "onionsteak_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT


/*	.................   Wiener Cabbage   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienercabbage
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("savory sausage" = 1, "cabbage" = 1)
	name = "wiener on a cabbage bed"
	desc = "A rich and heavy meal, a perfect ration for a soldier on the march."
	icon_state = "wienercabbage"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = 20 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/wienercabbage/plated
	icon_state = "wienercabbage_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

/*	.................   Frybird & Tato   ................... */
/obj/item/reagent_containers/food/snacks/rogue/frybirdtato
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("frybird" = 1, "tato" = 1)
	name = "frybird with a tato"
	desc = "Hearty, comforting and rich - Alleged favorite dish of Ravox."
	icon_state = "frybirdtato"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = 20 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/frybirdtato/plated
	icon_state = "frybirdtato_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT


/*	.................   Valerian Omelette   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("fried cackleberries" = 1, "cheese" = 1)
	name = "valerian omelette"
	desc = "Fried cackleberries on a bed of half-melted cheese, a dish from distant lands."
	icon_state = "omelette"
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian/plated
	icon_state = "omelette_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

/*	.................   Plated fryfish   ................... */
/obj/item/reagent_containers/food/snacks/rogue/fryfish/carp/plated
	desc = "Abyssor's bounty, make sure to eat the eyes!"
	icon_state = "carpcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish/plated
	desc = "Abyssor's bounty, make sure to eat the eyes!"
	icon_state = "clownfishcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/fryfish/angler/plated
	desc = "Abyssor's bounty, make sure to eat the eyes!"
	icon_state = "anglercooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/fryfish/eel/plated
	desc = "Abyssor's bounty, make sure to eat the eyes!"
	icon_state = "eelcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT


/*	.................   Chicken roast   ................... */
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked
	desc = "A plump bird, roasted to a perfect temperature and bears a crispy skin."
	eat_effect = null
	slices_num = 0
	name = "roast bird"
	icon_state = "roastchicken"
	tastes = list("tasty birdmeat" = 1)
	cooked_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/plated
	icon_state = "roastchicken_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT


/*	.................   Cooked rat   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedrat/plated
	desc = "The beggar's feast."
	icon_state = "cookedrat_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_DECENT

