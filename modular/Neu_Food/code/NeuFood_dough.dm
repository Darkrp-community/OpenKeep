/* * * * * * * * * * * * * * *	*
 *								*	Basically add water to powder, then more powder
 *			NeuFood DOUGH		*
 *					 			*
 *								*       
 * * * * * * * * * * * * * * * 	*/


// -------------- DOUGH -----------------
/obj/item/reagent_containers/food/snacks/rogue/dough
	name = "unfinished dough"
	desc = "Needs more powder and kneading."
	icon_state = "dough_base"
	w_class = WEIGHT_CLASS_NORMAL
	slice_batch = TRUE
	slice_sound = TRUE
	slices_num = 0
	var/raisin = FALSE
	var/powdered = FALSE
	var/cake = FALSE

/obj/item/reagent_containers/food/snacks/rogue/dough/attackby(obj/item/F, mob/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(isturf(loc)&& (found_table))
		if(powdered)
			to_chat(user, "<span class='notice'>The dough can't take more powder.</span>")
		if(no_more)
			to_chat(user, "<span class='notice'>Cannot add more ingridients.</span>")
		if(!powdered && istype(F, /obj/item/reagent_containers/powder/flour))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 90, TRUE, -1)
			to_chat(user, "<span class='notice'>Kneading in more powder...</span>")
			if(do_after(user,short_cooktime, target = src))
				name = "dough"
				icon_state = "dough"
				slice_path = /obj/item/reagent_containers/food/snacks/rogue/doughslice
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/bread
				slices_num = 2
				powdered = TRUE
				update_icon_state()
				qdel(F)
		if(powdered && istype(F, /obj/item/reagent_containers/food/snacks/butterslice)) // testi9ng alt to raisin
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading_alt.ogg', 90, TRUE, -1)
			to_chat(user, "<span class='notice'>Kneading butter into the dough...</span>")
			if(do_after(user,long_cooktime, target = src))
				name = "butterdough"
				icon_state = "dough"
				color = "#ecce61"
				slices_num = 2
				slice_path = /obj/item/reagent_containers/food/snacks/rogue/butterdoughslice
				no_more = TRUE
				update_icon_state()
				qdel(F)
		if(powdered && istype(F, /obj/item/reagent_containers/food/snacks/rogue/raisins))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Kneading the dough and adding raisins...</span>")
			if(do_after(user,short_cooktime, target = src))
				if(raisin)
					name = "loaf of raisins"
					icon_state = "raisinbreaduncooked"
					slices_num = 0
					cooked_type = /obj/item/reagent_containers/food/snacks/rogue/raisinbread
					no_more = TRUE
					F.forceMove(src)
					update_icon_state()
					qdel(F)
				else
					name = "half-done raisin dough"
					icon_state = "dough_raisin"
					raisin = TRUE
					update_icon_state()
					qdel(F)
		if(powdered && istype(F, /obj/item/reagent_containers/food/snacks/egg))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Working cackleberry into the dough, shaping it into a cake...</span>")
			playsound(get_turf(user), 'modular/Neu_Food/sound/eggbreak.ogg', 100, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				name = "cake base"
				icon_state = "cake"
				foodtype = GRAIN | DAIRY
				cake = TRUE
				no_more = TRUE
				update_icon_state()
				qdel(F)
		if(powdered && istype(F, /obj/item/kitchen/rollingpin))
			playsound(get_turf(user), 'modular/Neu_Food/sound/rollingpin.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Rolling [src] into cracker dough.</span>")
			if(do_after(user,long_cooktime, target = src))
				name = "raw crackers"
				desc = "Needs baking."
				icon_state = "crackercook"
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/crackerscooked
				no_more = TRUE
				update_icon_state()
		if(cake && istype(F, /obj/item/reagent_containers/food/snacks/rogue/cheese))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Spreading fresh cheese on the cake...</span>")
			if(do_after(user,long_cooktime, target = src))
				name = "unbaked cake"
				icon_state = "cheesecakeuncook"
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/ccake
				foodtype = GRAIN | DAIRY | SUGAR
				no_more = TRUE
				update_icon_state()
				qdel(F)
		if(cake && istype(F, /obj/item/reagent_containers/food/snacks/rogue/honey))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Slathering the cake with delicious spider honey...</span>")
			if(do_after(user,long_cooktime, target = src))
				name = "unbaked cake"
				icon_state = "honeycakeuncook"
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/hcake
				foodtype = GRAIN | DAIRY | SUGAR
				no_more = TRUE
				update_icon_state()
				qdel(F)				

	else
		to_chat(user, "<span class='warning'>You need to put [src] on a table to knead it!</span>")
		return ..()


/obj/item/reagent_containers/food/snacks/rogue/doughslice
	name = "smalldough"
	icon_state = "doughslice"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/bun
	w_class = WEIGHT_CLASS_NORMAL
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
/obj/item/reagent_containers/food/snacks/rogue/doughslice/attackby(obj/item/I, mob/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(no_more)
		to_chat(user, "<span class='notice'>Cannot add more ingridients.</span>")
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheese))
		playsound(get_turf(user), 'modular/Neu_Food/sound/kneading_alt.ogg', 90, TRUE, -1)
		to_chat(user, "<span class='notice'>Adding fresh cheese...</span>")
		if(do_after(user,short_cooktime, target = src))
			name = "raw cheese bun"
			icon_state = "cheesebun_raw"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/cheesebun
			foodtype = GRAIN | DAIRY
			no_more = TRUE
			update_icon_state()
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/doughslice))
		var/found_table = locate(/obj/structure/table) in (loc)
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Combining dough...</span>")
			if(do_after(user,short_cooktime, target = src))
				new /obj/item/reagent_containers/food/snacks/rogue/dough(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>You need to put [src] on a table to knead it out!</span>")
	else
		return ..()



/obj/item/reagent_containers/food/snacks/rogue/butterdoughslice
	name = "butterdough piece"
	icon_state = "butterdoughslice"
	color = "#ecce61"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pastry
	w_class = WEIGHT_CLASS_NORMAL
/obj/item/reagent_containers/food/snacks/rogue/butterdoughslice/attackby(obj/item/I, mob/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(no_more)
		to_chat(user, "<span class='notice'>Cannot add more ingridients.</span>")
		return
	if(isturf(loc)&& (found_table))
		if(istype(I, /obj/item/kitchen/rollingpin))
			playsound(get_turf(user), 'modular/Neu_Food/sound/rollingpin.ogg', 100, TRUE, -1)	
			to_chat(user, "<span class='notice'>Flattening [src]...</span>")
			if(do_after(user,short_cooktime, target = src))
				name = "piedough"
				icon_state = "piedough"
				color = "#ecce61"
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom
				no_more = TRUE
				update_icon_state()
		if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/raisins))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Adding raisins to the dough...</span>")
			if(do_after(user,short_cooktime, target = src))
				name = "uncooked raisin biscuit"
				icon_state = "biscuit_raw"
				color = "#ecce61"
				cooked_type = /obj/item/reagent_containers/food/snacks/rogue/biscuit
				no_more = TRUE
				update_icon_state()
				qdel(I)
		else
			to_chat(user, "<span class='warning'>You need to put [src] on a table to roll it out!</span>")
		if(istype(I, /obj/item/rogueweapon/huntingknife))
			if(!isdwarf(user))
				to_chat(user, "<span class='warning'>You lack the art of making good dwarven pastries!</span>")
				return
			else
				playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
				to_chat(user, "<span class='notice'>Cutting the dough in strips and making a prezzel...</span>")
				if(do_after(user,short_cooktime, target = src))
					name = "uncooked prezzel"
					icon_state = "prezzel_raw"
					cooked_type = /obj/item/reagent_containers/food/snacks/rogue/biscuit
					no_more = TRUE
					update_icon_state()
					qdel(I)
		else
			to_chat(user, "<span class='warning'>You need to put [src] on a table to cut it!</span>")
	else
		..()


// -------------- CRACKERS -----------------
/obj/item/reagent_containers/food/snacks/rogue/crackerscooked
	name = "crackers"
	icon_state = "cracker6"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("spelt" = 1)
	bitesize = 6
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/crackerscooked/On_Consume(mob/living/eater)
	..()
	if(bitecount == 1)
		icon_state = "cracker5"
	if(bitecount == 2)
		icon_state = "cracker4"
	if(bitecount == 3)
		icon_state = "cracker3"
	if(bitecount == 4)
		icon_state = "cracker2"
	if(bitecount == 5)
		icon_state = "cracker1"


// -------------- BREAD -----------------
/obj/item/reagent_containers/food/snacks/rogue/bread
	name = "bread loaf"
	icon_state = "loaf6"
	slices_num = 5
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/breadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	slice_batch = FALSE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/bread/update_icon()
	if(slices_num)
		icon_state = "loaf[slices_num]"
	else
		icon_state = "loaf_slice"

/obj/item/reagent_containers/food/snacks/rogue/bread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

///////////////////////////////////////////////////////////// ALT WAY
// -------------- BREADSLICE & TOAST -----------------
/obj/item/reagent_containers/food/snacks/rogue/breadslice
	name = "sliced bread"
	icon_state = "loaf_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/breadslice/attackby(obj/item/I, mob/user, params)
	if(no_more)
		to_chat(user, "<span class='notice'>Cannot add more ingridients.</span>")
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/salami/slice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "bread_salami"
			cooked_type = null
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
			tastes = list("salumoi" = 1)
			foodtype = GRAIN | MEAT
			no_more = TRUE	
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "bread_cheese"
			cooked_type = null
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
			tastes = list("cheese" = 1)
			foodtype = GRAIN | DAIRY
			no_more = TRUE	
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "bread_egg"
			cooked_type = null
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
			tastes = list("egg" = 1)
			no_more = TRUE	
			qdel(I)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	name = "toast"
	icon_state = "toast"
	tastes = list("crispy bread" = 1)
	cooked_type = null
	bitesize = 2
	rotprocess = null
/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/attackby(obj/item/I, mob/user, params)
	if(no_more)
		to_chat(user, "<span class='notice'>Cannot add more ingridients.</span>")
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/butterslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "toast_butter"
			cooked_type = null
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
			tastes = list("butter" = 1)
			foodtype = GRAIN | MEAT
			no_more = TRUE	
			qdel(I)
	else
		return ..()



// -------------- BREAD BUN & VARIANTS -----------------
/obj/item/reagent_containers/food/snacks/rogue/bun
	name = "bun"
	icon_state = "bun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1)
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/bun/attackby(obj/item/I, mob/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(!no_more && istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))	// Grenzelbun
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>Pushing the wiener through the bun...</span>")
		if(do_after(user,short_cooktime, target = src))
			bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
			tastes = list("savory sausage" = 1, "bread" = 1)
			name = "grenzelbun"
			desc = "Wiener in a bun, Grenzelhoft cuisine at its finest."
			icon_state = "grenzbun"
			foodtype = GRAIN | MEAT
			warming = 5 MINUTES
			eat_effect = /datum/status_effect/buff/foodbuff
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


/* * * * * * * * * * * * * * *	*
 *								*
 *		Pastries & Sweets		*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/

// -------------- CHEESE BUN -----------------
/obj/item/reagent_containers/food/snacks/rogue/cheesebun
	name = "fresh cheese bun"
	desc = "A treat from the Grenzelhoft kitchen."
	icon_state = "cheesebun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("crispy bread and cream cheese" = 1)
	foodtype = GRAIN | DAIRY
	bitesize = 2
	rotprocess = SHELFLIFE_LONG

// -------------- PASTRY -----------------
/obj/item/reagent_containers/food/snacks/rogue/pastry
	name = "pastry"
	icon_state = "pastrypuff"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("crispy butterdough" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

// -------------- BISCUIT -----------------
/obj/item/reagent_containers/food/snacks/rogue/biscuit
	name = "biscuit"
	icon_state = "biscuit"
	filling_color = "#F0E68C"
	list_reagents = list(/datum/reagent/consumable/nutriment = (SNACK_DECENT+SNACK_POOR))
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	tastes = list("crispy butterdough" = 1, "raisins" = 1)
	eat_effect = /datum/status_effect/buff/foodbuff

// -------------- PREZZEL (dwarf pastry) -----------------
/obj/item/reagent_containers/food/snacks/rogue/prezzel
	name = "prezzel"
	desc = "Dwarvish style pastry."
	icon_state = "prezzel"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("crispy butterdough" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff


// -------------- RAISIN BREAD -----------------
/obj/item/reagent_containers/food/snacks/rogue/raisinbread
	name = "raisin loaf"
	icon_state = "raisinbread6"
	slices_num = 5
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_AVERAGE)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bread" = 1,"dried fruit" = 1)
	slice_batch = FALSE
	slice_sound = TRUE 
	rotprocess = 30 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/update_icon()
	if(slices_num)
		icon_state = "raisinbread[slices_num]"
	else
		icon_state = "raisinbread_slice"

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	name = "raisin loaf slice"
	icon_state = "raisinbread_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT-1)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	tastes = list("spelt" = 1,"dried fruit" = 1)
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff


// -------------- SPIDER-HONEY CAKE (Zybantu) -----------------
/obj/item/reagent_containers/food/snacks/rogue/hcake
	name = "zybantu cake"
	desc = "Cake glazed with spider-honey, in Zybantu style using local ingridients."
	icon_state = "honeycake"
	slices_num = 8
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/hcakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 48)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cake"=1, "delicious honeyfrosting"=1)
	foodtype = GRAIN | DAIRY | SUGAR
	slice_batch = TRUE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 16

/obj/item/reagent_containers/food/snacks/rogue/hcakeslice
	name = "zybantu cake slice"
	icon_state = "honeycakeslice"
	slices_num = 0
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	foodtype = GRAIN | DAIRY | SUGAR
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/hcakeslice/attackby(obj/item/I, mob/user, params)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "honeycakeslice_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()


// -------------- CHEESECAKE -----------------
/obj/item/reagent_containers/food/snacks/rogue/ccake
	name = "cheesecake"
	icon_state = "cheesecake"
	slices_num = 8
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/ccakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 48)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cake"=1, "creamy cheese"=1)
	foodtype = GRAIN | DAIRY | SUGAR
	slice_batch = TRUE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 16

/obj/item/reagent_containers/food/snacks/rogue/ccakeslice
	name = "cheesecake slice"
	icon_state = "cheesecake_slice"
	slices_num = 0
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	foodtype = GRAIN | DAIRY | SUGAR
	bitesize = 2
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/ccakeslice/attackby(obj/item/I, mob/user, params)
	if(no_more && istype(I, /obj/item/cooking/platter))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(do_after(user,2 SECONDS, target = src))
			icon_state = "cheesecakeslice_plated"
			put_on_plate()
			qdel(I)
	else
		return ..()


