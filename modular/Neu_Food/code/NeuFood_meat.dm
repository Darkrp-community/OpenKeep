
/* * * * * * * * * * * * * * *	*
 *								*
 *		NeuFood Meats			*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/


// -------------- RAW MEAT  -----------------
/obj/item/reagent_containers/food/snacks/rogue/meat
	eat_effect = /datum/status_effect/debuff/uncookedfood
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	name = "meat"
	icon_state = "meatslab"
	slice_batch = TRUE // so it takes more time, changed from FALSE
	filling_color = "#8f433a"
	rotprocess = SHELFLIFE_SHORT
	chopping_sound = TRUE
	foodtype = MEAT
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'

/obj/item/reagent_containers/food/snacks/rogue/meat/steak
	ingredient_size = 2
	name = "raw meat"
	icon_state = "meatcutlet"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef

/obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	eat_effect = null
	slices_num = 0
	name = "steak"
	icon_state = "friedsteak"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	rotprocess = SHELFLIFE_DECENT
	var/pepper
/obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried/attackby(obj/item/I, mob/user, params)
	var/obj/item/reagent_containers/peppermill/mill = I
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	

	if(!no_more && istype(mill))		
		if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
			to_chat(user, "There's not enough black pepper to make anything with.")
			return TRUE
		else
			mill.icon_state = "peppermill_grind"
			to_chat(user, "You start rubbing the steak with black pepper.")
			playsound(get_turf(user), 'modular/Neu_Food/sound/peppermill.ogg', 100, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
					to_chat(user, "There's not enough black pepper to make anything with.")
					return TRUE
				name = "peppersteak"
				icon_state = "peppersteak"
				mill.reagents.remove_reagent(/datum/reagent/consumable/blackpepper, 1)
				bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
				tastes = list("steak" = 1, "pepper" = 1)
				eat_effect = /datum/status_effect/buff/foodbuff
				warming = 5 MINUTES
				no_more = TRUE
	if(!no_more && istype(I,/obj/item/reagent_containers/food/snacks/rogue/peeledonion))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			name = "onion steak"
			icon_state = "onionsteak"
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)	
			tastes = list("steak" = 1, "onions" = 1)
			eat_effect = /datum/status_effect/buff/foodbuff
			warming = 5 MINUTES
			no_more = TRUE
			pepper = TRUE
			qdel(I)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			if(pepper)			
				icon_state = "peppersteak_plated"
			else	
				icon_state = "onionsteak_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()



/*	........   Minced meat & stuffing sausages   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/mince
	name = "mince"
	icon_state = "meatmince"
	ingredient_size = 2
	slice_path = null
	filling_color = "#8a0000"
	cooked_type = null
	var/beef
/obj/item/reagent_containers/food/snacks/rogue/meat/mince/attackby(obj/item/I, mob/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(isturf(loc)&& (found_table))
		if(beef && istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef))
			to_chat(user, "<span class='notice'>Stuffing a wiener...</span>")
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				name = "raw wiener"
				icon_state = "raw_wiener"
				ingredient_size = 1
				fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked/wiener
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked/wiener
				qdel(I)
		else if(istype(I, /obj/item/reagent_containers/food/snacks/fat) || istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince) || istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/bacon))
			to_chat(user, "<span class='notice'>Stuffing a sausage...</span>")
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				name = "raw sausage"
				icon_state = "raw_wiener"
				ingredient_size = 1
				fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked
				qdel(I)
	else
		to_chat(user, "<span class='warning'>You need to put [src] on a table to work on it.</span>")
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef
	name = "minced meat"
	beef = TRUE

/obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish
	name = "minced fish"
	icon_state = "fishmince"

/obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry
	name = "mince"
	icon_state = "meatmince"

// -------------- PORK, SPIDERMEAT, BIRDMEAT  -----------------
/obj/item/reagent_containers/food/snacks/rogue/meat/fatty //pork
	slices_num = 4
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/bacon
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/rogue/meat/bacon
	name = "raw bacon"
	icon_state = "bacon"
	slice_path = null
	slices_num = 0
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried
	filling_color = "#8a0000"

/obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried
	eat_effect = null
	name = "fried bacon"
	icon_state = "friedbacon"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/meat/spider // Low-nutrient, kind of gross. Survival food.
	name = "spidermeat"
	icon_state = "spidermeat"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/spider/fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/spider/fried
	slice_path = null
	slices_num = 0

/obj/item/reagent_containers/food/snacks/rogue/meat/spider/fried
	name = "fried spidermeat"
	icon_state = "friedspider"
	eat_effect = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/meat/poultry
	name = "bird meat"
	icon_state = "halfchicken"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked
	fried_type = null
	slices_num = 2
	ingredient_size = 4

/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet
	name = "bird meat"
	icon_state = "chickencutlet"
	ingredient_size = 2
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried
	slices_num = 1
	slice_bclass = BCLASS_CHOP
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried


// -------------- CHICKEN ROAST (meal)  -----------------
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked
	eat_effect = null
	slices_num = 0
	name = "roast bird"
	icon_state = "roastchicken"
	tastes = list("tasty birdmeat" = 1)
	cooked_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/attackby(obj/item/I, mob/user, params)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "roastchicken_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()


// -------------- FRYBIRD WITH TATO (meal) -----------------
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried
	eat_effect = null
	slices_num = 0
	name = "frybird"
	icon_state = "frybird"
	fried_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried/attackby(obj/item/I, mob/user, params)
	if(!no_more && istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			name = "frybird with a tato"
			icon_state = "frybirdtato"
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)	
			tastes = list("frybird" = 1, "tato" = 1)
			eat_effect = /datum/status_effect/buff/foodbuff
			warming = 5 MINUTES
			foodtype = VEGETABLES | MEAT
			no_more = TRUE
			qdel(I)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "frybirdtato_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()



// -------------- WIENER (Grenzelhoft kitchen) -----------------
/obj/item/reagent_containers/food/snacks/rogue/meat/sausage // this is obsolete
	name = "raw sausage"
	icon_state = "raw_wiener"
	ingredient_size = 1
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked

/obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked
	eat_effect = null
	name = "sausage"
	icon_state = "wiener"
	fried_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked/wiener
	name = "wiener"




// -------------- FRIED CACKLEBERRY -----------------
/obj/item/reagent_containers/food/snacks/rogue/friedegg
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("fried cackleberry" = 1)
	name = "fried cackleberry"
	icon_state = "friedegg"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	var/double_egg
/obj/item/reagent_containers/food/snacks/rogue/friedegg/attackby(obj/item/I, mob/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(!no_more && istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg))	// Double-egg
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			icon_state = "seggs"
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
			double_egg = TRUE
			qdel(I)
	if(double_egg && istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge))	// Omelette
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			tastes = list("fried cackleberries" = 1, "cheese" = 1)
			name = "tiberian omelette"
			desc = "Fried cackleberries on a bed of half-melted cheese, a dish from distant lands."
			icon_state = "omelette"
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
			double_egg = TRUE
			no_more = TRUE	
			qdel(I)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "omelette_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()

/*	........   Fish sounds   ................ */
/obj/item/reagent_containers/food/snacks/fish
	chopping_sound = TRUE

// -------------- FRYFISH ON A PLATTER (snack) -----------------
/obj/item/reagent_containers/food/snacks/rogue/fryfish/carp/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon = 'modular/Neu_Food/icons/food.dmi'
			icon_state = "carpcooked_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()
/obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon = 'modular/Neu_Food/icons/food.dmi'
			icon_state = "clownfishcooked_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()
/obj/item/reagent_containers/food/snacks/rogue/fryfish/angler/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon = 'modular/Neu_Food/icons/food.dmi'
			icon_state = "anglercooked_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()
/obj/item/reagent_containers/food/snacks/rogue/fryfish/eel/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon = 'modular/Neu_Food/icons/food.dmi'
			icon_state = "eelcooked_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()


// -------------- COOKED RAT (snack) -----------------
/obj/item/reagent_containers/food/snacks/rogue/friedrat/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "cookedrat_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()



/* * * * * * * * * * * * * * *	*
 *								*
 *			Vegetables			*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/
/obj/item/reagent_containers/food/snacks/grown/onion/rogue
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/peeledonion
	tastes = list("onion" = 1)
	chopping_sound = TRUE

/*	........   Vegetable-based foods   ................ */
/obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/cabbage_sliced
	dropshrink = 0.8
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/rogue/cabbage_sliced
	name = "shredded cabbage"
	icon_state = "cabbage_sliced"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried

// -------------- FRIED CABBAGE (snack) and WIENER CABBAGE (meal) -----------------
/obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried
	name = "cooked cabbage"
	icon_state = "cabbage_fried"
	bitesize = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("warm cabbage" = 1)
/obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried/attackby(obj/item/I, mob/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(!no_more && istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			name = "wiener on a cabbage bed"
			desc = "Another northern traditional dish."
			icon_state = "wienercabbage"
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)	
			tastes = list("savory sausage" = 1, "cabbage" = 1)
			eat_effect = /datum/status_effect/buff/foodbuff
			warming = 5 MINUTES
			foodtype = VEGETABLES | MEAT
			no_more = TRUE
			qdel(I)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "grenzbun_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/peeledonion
	name = "sliced onion"
	icon_state = "onion_sliced"
	slices_num = 0
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried

/obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried
	name = "fried onion"
	icon_state = "onion_fried"
	bitesize = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("savoury morsel" = 1)

/obj/item/reagent_containers/food/snacks/grown/potato/rogue
	eat_effect = null
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/peeledpotato
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked
	tastes = list("potato" = 1)

/obj/item/reagent_containers/food/snacks/rogue/peeledpotato
	name = "peeled potato"
	icon_state = "skinnedpotato"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked

/obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked
	name = "baked potatos"
	icon_state = "potato_baked"
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)


