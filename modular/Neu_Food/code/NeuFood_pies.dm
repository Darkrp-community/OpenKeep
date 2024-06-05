/* * * * * * * * * * * * * * *	*
 *								*
 *		NeuFood Pies			*
 *					 			*
 *								*
 * * * * * * * * * * * * * * * 	*/

/*	........   Pie making   ................ */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom
	name = "pie bottom"
	icon_state = "piebottom"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = /datum/status_effect/debuff/uncookedfood
	color = "#e7e2df"
	var/piebottom = TRUE
	var/fish = FALSE
	var/meaty = FALSE
	var/potpie = FALSE
	var/applepie = FALSE
	var/berrypie = FALSE
	var/poisoning = FALSE	
	var/almost_done = FALSE
	var/fully_done = FALSE
/obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom/attackby(obj/item/I, mob/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))	
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Staring on a fish pie...</span>")
			name = "unfinished fishpie"
			icon_state = "piebottom_fish1"
			fish = TRUE
			qdel(I)
		if(fish && do_after(user,short_cooktime, target = src))
			name = "unfinished fishpie"
			icon_state = "piebottom_fish2"
			to_chat(user, "<span class='notice'>Adding filling to the fishpie. Needs more.</span>")
			almost_done = TRUE
			piebottom = FALSE
			qdel(I)
		if(fish && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished fishpie"
			icon_state = "piebottom_fish3"
			to_chat(user, "<span class='notice'>Filling the fishpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a meatpie</span>")
			name = "unfinished meatpie"
			icon_state = "piebottom_meat1"
			meaty = TRUE
			qdel(I)
		else if(meaty && do_after(user,short_cooktime, target = src))
			name = "unfinished meatpie"
			icon_state = "piebottom_meat2"
			to_chat(user, "<span class='notice'>Adding filling to the meatpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		else if(meaty && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished meatpie"
			icon_state = "piebottom_meat3"
			to_chat(user, "<span class='notice'>Filling the meatpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/egg))
		playsound(get_turf(user), 'modular/Neu_Food/sound/eggbreak.ogg', 100, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a pot pie...</span>")
			name = "unfinished pot pie"
			icon_state = "piebottom_egg1"
			potpie = TRUE
			qdel(I)
		if(potpie && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg2"
			to_chat(user, "<span class='notice'>Adding filling to the potpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(potpie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg3"
			to_chat(user, "<span class='notice'>Filling the potpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/fat))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a pot pie...</span>")
			name = "unfinished pot pie"
			icon_state = "piebottom_egg1"
			potpie = TRUE
			qdel(I)
		if(potpie && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg2"
			to_chat(user, "<span class='notice'>Adding filling to the potpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(potpie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg3"
			to_chat(user, "<span class='notice'>Filling the potpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a pot pie...</span>")
			name = "unfinished pot pie"
			icon_state = "piebottom_egg1"
			potpie = TRUE
			qdel(I)
		if(potpie && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg2"
			to_chat(user, "<span class='notice'>Adding filling to the potpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(potpie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg3"
			to_chat(user, "<span class='notice'>Filling the potpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/bacon))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a pot pie...</span>")
			name = "unfinished pot pie"
			icon_state = "piebottom_egg1"
			potpie = TRUE
			qdel(I)
		if(potpie && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg2"
			to_chat(user, "<span class='notice'>Adding filling to the potpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(potpie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg3"
			to_chat(user, "<span class='notice'>Filling the potpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a pot pie...</span>")
			name = "unfinished pot pie"
			icon_state = "piebottom_egg1"
			potpie = TRUE
			qdel(I)
		if(potpie && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg2"
			to_chat(user, "<span class='notice'>Adding filling to the potpie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(potpie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished pot pie"
			icon_state = "piebottom_egg3"
			to_chat(user, "<span class='notice'>Filling the potpie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/apple))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a applepie...</span>")
			name = "unfinished applepie"
			icon_state = "piebottom_apple1"
			applepie = TRUE
			qdel(I)
		if(applepie && do_after(user,short_cooktime, target = src))
			name = "unfinished applepie"
			icon_state = "piebottom_apple2"
			to_chat(user, "<span class='notice'>Adding filling to the applepie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(applepie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished applepie"
			icon_state = "piebottom_apple3"
			to_chat(user, "<span class='notice'>Filling the applepie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)
	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a berrypie...</span>")
			name = "unfinished berrypie"
			icon_state = "piebottom_berry1"
			berrypie = TRUE
			poisoning = TRUE	
			qdel(I)
		if(applepie && do_after(user,short_cooktime, target = src))
			name = "unfinished berrypie"
			icon_state = "piebottom_berry2"
			to_chat(user, "<span class='notice'>Adding filling to the berrypie. Needs more.</span>")
			almost_done = TRUE
			poisoning = TRUE
			qdel(I)
		if(applepie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished berrypie"
			icon_state = "piebottom_berry3"
			to_chat(user, "<span class='notice'>Filling the applepie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			poisoning = TRUE
			qdel(I)
	else if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(piebottom && !almost_done && do_after(user,short_cooktime, target = src))
			to_chat(user, "<span class='notice'>Starting on a berrypie...</span>")
			name = "unfinished berrypie"
			icon_state = "piebottom_berry1"
			berrypie = TRUE
			qdel(I)
		if(applepie && do_after(user,short_cooktime, target = src))
			name = "unfinished berrypie"
			icon_state = "piebottom_berry2"
			to_chat(user, "<span class='notice'>Adding filling to the berrypie. Needs more.</span>")
			almost_done = TRUE
			qdel(I)
		if(applepie && almost_done && do_after(user,short_cooktime, target = src))
			name = "unfinished berrypie"
			icon_state = "piebottom_berry3"
			to_chat(user, "<span class='notice'>Filling the applepie to the brim. Still lacks a pie roof.</span>")
			fully_done = TRUE
			qdel(I)

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/butterdoughslice))
		playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
		if(fish && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked fish pie"
			icon_state = "fishpie_raw"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
			filling_color = "#d44197"
			qdel(I)
		if(meaty && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked meat pie"
			icon_state = "meatpie_raw"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/meat
			filling_color = "#b43628"
			qdel(I)
		if(potpie && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked pot pie"
			icon_state = "pieuncooked"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pot
			qdel(I)
		if(applepie && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked applepie"
			icon_state = "pieuncooked"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
			qdel(I)
		if(berrypie && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked berrypie"
			icon_state = "pieuncooked"
			filling_color = "#4a62cf"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
			qdel(I)
		if(berrypie && poisoning && fully_done && do_after(user,short_cooktime, target = src))
			name = "uncooked berrypie"
			icon_state = "pieuncooked"
			filling_color = "#4a62cf"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
			qdel(I)
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/poison
	else
		return ..()



/*	........   Pie templates   ................ */
/obj/item/reagent_containers/food/snacks/rogue/pie
	name = "pie"
	desc = ""
	color = "#e7e2df"	
	var/stunning = FALSE

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	icon_state = "pie"
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_FILLING)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice
	slices_num = 5
	slice_batch = TRUE
	warming = 10 MINUTES
	eat_effect = null
	foodtype = GRAIN | DAIRY
	chopping_sound = TRUE
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/pie/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/rogue/pie/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/food/pie_smudge(T)
	if(reagents && reagents.total_volume)
		reagents.reaction(hit_atom, TOUCH)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		if(stunning)
			L.Paralyze(20) //splat!
		L.adjust_blurriness(1)
		L.visible_message("<span class='warning'>[L] is hit by [src]!</span>", "<span class='danger'>I'm hit by [src]!</span>")
	if(is_type_in_typecache(hit_atom, GLOB.creamable))
		hit_atom.AddComponent(/datum/component/creamed, src)
	qdel(src)

/obj/item/reagent_containers/food/snacks/rogue/pie/CheckParts(list/parts_list)
	..()
	for(var/obj/item/reagent_containers/food/snacks/M in parts_list)
		filling_color = M.filling_color
		update_snack_overlays(M)
		color = M.filling_color
		if(M.reagents)
			M.reagents.remove_reagent(/datum/reagent/consumable/nutriment, M.reagents.total_volume)
			M.reagents.trans_to(src, M.reagents.total_volume)
		qdel(M)

/obj/item/reagent_containers/food/snacks/rogue/pieslice
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("pie" = 1)
	name = "pie slice"
	desc = ""
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY
	warming = 10 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"


// -------------- MEAT PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat // bae item
	name = "meat pie"
	desc = ""
	eat_effect = /datum/status_effect/buff/foodbuff
	foodtype = GRAIN | DAIRY | MEAT

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/meat
	icon_state = "meatpie"
	tastes = list("succulent meat and crispy butterdough" = 1)
	filling_color = "#b43628"

// -------------- FISH PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
	name = "fish pie"
	icon_state = "fishpie"
	tastes = list("baked fish and crispy butterdough" = 1)
	filling_color = "#d44197"


// -------------- POT PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pot
	name = "pot pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("succulent filling and crispy butterdough" = 1)
	filling_color = "#755430"
	foodtype = GRAIN | DAIRY | MEAT

// -------------- BERRY PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
	name = "berry pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	slices_num = 4
	tastes = list("crispy butterdough" = 1, "sweet berries" = 1)
	filling_color = "#4a62cf"

// -------------- POISON PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/poison
	name = "berry pie"
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD, /datum/reagent/berrypoison = 12)
	tastes = list("crispy butterdough" = 1, "bitter berries" =1)
	filling_color = "#4a62cf"

// -------------- APPLE PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
	name = "apple pie"
	desc = ""
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("baked apples and crispy butterdough" = 1)
