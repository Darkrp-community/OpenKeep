/obj/item/reagent_containers/food/snacks/produce
	icon = 'modular/Neu_Farming/icons/produce.dmi'
	dried_type = null
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_SMALL
	var/list/pipe_reagents = list()
	var/seed
	var/bitesize_mod = 0

/obj/item/reagent_containers/food/snacks/produce/Initialize(mapload)
	. = ..()
	if(!tastes)
		tastes = list("[name]" = 1)
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

/obj/item/reagent_containers/food/snacks/produce/Crossed(mob/living/carbon/human/H)
	..()
	if(prob(20))
		if(istype(H))
			if(eat_effect == /datum/status_effect/debuff/rotfood)
				visible_message("<span class='warning'>[H] crushes [src] underfoot.</span>")
				qdel(src)

/obj/item/reagent_containers/food/snacks/produce/attackby(obj/item/weapon, mob/user, params)
	if(weapon && isturf(loc))
		var/turf/location = get_turf(src)
		if(seed && (user.used_intent.blade_class == BCLASS_BLUNT) && (!user.used_intent.noaa))
			playsound(src,'sound/items/seedextract.ogg', 100, FALSE)
			if(prob(5))
				user.visible_message("<span class='info'>[user] fails to extract the seeds.</span>")
				qdel(src)
				return
			user.visible_message("<span class='info'>[user] extracts the seeds.</span>")
			new seed(location)
			if(prob(90))
				new seed(location)
			if(prob(23))
				new seed(location)
			if(prob(6))
				new seed(location)
			qdel(src)
			return
		else
			return ..()
	..()
//	return ..() fucked with slicing

/obj/item/reagent_containers/food/snacks/produce/wheat
	seed = /obj/item/neuFarm/seed/wheat
	name = "grain"
	desc = ""
	icon_state = "wheat"
	gender = PLURAL
	filling_color = "#F0E68C"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("wheat" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer
	distill_amt = 24
	grind_results = list(/datum/reagent/floure = 10)
	dropshrink = 0.9
	mill_result = /obj/item/reagent_containers/powder/flour
/obj/item/reagent_containers/food/snacks/produce/wheat/examine(var/mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 0)
		. += "I can easily tell that these are wheat grains."

/obj/item/reagent_containers/food/snacks/produce/oat
	seed = /obj/item/neuFarm/seed/wheat/oat
	name = "grain"
	desc = ""
	icon_state = "oat"
	gender = PLURAL
	filling_color = "#b1d179"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("oat" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/ale
	distill_amt = 12
	grind_results = list(/datum/reagent/floure = 10)
/obj/item/reagent_containers/food/snacks/produce/oat/examine(var/mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 0)
		. += "I can easily tell that these are oat groats."


/obj/item/reagent_containers/food/snacks/produce/apple
	seed = /obj/item/neuFarm/seed/apple
	name = "apple"
	desc = ""
	icon_state = "apple"
	bitesize = 3
	foodtype = FRUIT
	tastes = list("apple" = 1)
	trash = /obj/item/trash/applecore
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	slot_flags = ITEM_SLOT_HEAD
	worn_x_dimension = 64
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	worn_y_dimension = 64
	rotprocess = SHELFLIFE_DECENT
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/cider
	var/equippedloc = null
	var/list/bitten_names = list()

/obj/item/reagent_containers/food/snacks/produce/apple/On_Consume(mob/living/eater)
	..()
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(!(H.real_name in bitten_names))
			bitten_names += H.real_name

/obj/item/reagent_containers/food/snacks/produce/apple/blockproj(mob/living/carbon/human/H)
	testing("APPLEHITBEGIN")
	if(prob(98))
		H.visible_message(span_notice("[H] is saved by the apple!"))
		H.dropItemToGround(H.head)
		return 1
	else
		H.dropItemToGround(H.head)
		return 0

/obj/item/reagent_containers/food/snacks/produce/apple/equipped(mob/M)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.head == src)
			testing("equipped applz")
			equippedloc = H.loc
			START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/produce/apple/process()
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			if(equippedloc != H.loc)
				H.dropItemToGround(H.head)

/obj/item/reagent_containers/food/snacks/produce/berries/rogue
	seed = /obj/item/neuFarm/seed/berryrogue
	name = "jacksberries"
	desc = ""
	icon_state = "berries"
	tastes = list("berry" = 1)
	bitesize = 5
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	dropshrink = 0.75
	var/color_index = "good"
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/jackberrywine
	rotprocess = SHELFLIFE_SHORT
	var/poisonous = FALSE

/obj/item/reagent_containers/food/snacks/produce/berries/rogue/Initialize()
	if(GLOB.berrycolors[color_index])
		filling_color = GLOB.berrycolors[color_index]
	else
		var/newcolor = pick(BERRYCOLORS)
		if(newcolor in GLOB.berrycolors)
			GLOB.berrycolors[color_index] = pick(BERRYCOLORS)
		else
			GLOB.berrycolors[color_index] = newcolor
		filling_color = GLOB.berrycolors[color_index]
	update_icon()
	..()

/obj/item/reagent_containers/food/snacks/produce/berries/rogue/examine(var/mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 3 && poisonous == TRUE)
		. += "These berries appear to be poisonous."

/obj/item/reagent_containers/food/snacks/produce/berries/rogue/On_Consume(mob/living/eater)
	..()
	update_icon()

/obj/item/reagent_containers/food/snacks/produce/berries/rogue/update_icon()
	cut_overlays()
	var/used_state = "berriesc5"
	if(bitecount == 1)
		used_state = "berriesc4"
	if(bitecount == 2)
		used_state = "berriesc3"
	if(bitecount == 3)
		used_state = "berriesc2"
	if(bitecount == 4)
		used_state = "berriesc1"
	var/image/item_overlay = image(used_state)
	item_overlay.color = filling_color
	add_overlay(item_overlay)

/obj/item/reagent_containers/food/snacks/produce/berries/rogue/poison
	seed = /obj/item/neuFarm/seed/berryrogue/poison
	icon_state = "berries"
	tastes = list("berry" = 1)
	list_reagents = list(/datum/reagent/berrypoison = 5, /datum/reagent/consumable/nutriment = 3)
	grind_results = list(/datum/reagent/berrypoison = 5)
	color_index = "bad"
	poisonous = TRUE

/*	..................   Swamp weed   ................... */
/obj/item/reagent_containers/food/snacks/produce/rogue/swampweed
	seed = /obj/item/neuFarm/seed/swampleaf
	name = "swampweed"
	desc = "A 'foggy' pipe weed."
	icon_state = "swampweed"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	tastes = list("sweet" = 1,"bitterness" = 1)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/produce/rogue/swampweed_dried
	seed = null
	name = "swampweed"
	desc = ""
	icon_state = "swampweedd"
	dry = TRUE
	pipe_reagents = list(/datum/reagent/drug/space_drugs = 30)
	list_reagents = list(/datum/reagent/drug/space_drugs = 2,/datum/reagent/consumable/nutriment = 1)
	grind_results = list(/datum/reagent/drug/space_drugs = 5)
	eat_effect = /datum/status_effect/debuff/badmeal



/*	..................   Pipe weed   ................... */
/obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed
	seed = /obj/item/neuFarm/seed/pipeweed
	name = "westleach leaf"
	desc = "A generic kind of pipe weed."
	icon_state = "westleach"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	tastes = list("sweet" = 1,"bitterness" = 1)
	list_reagents = list(/datum/reagent/drug/nicotine = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	grind_results = list(/datum/reagent/drug/nicotine = 5)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed_dried
	seed = null
	name = "westleach leaf"
	desc = "A dried leaf."
	icon_state = "westleachd"
	dry = TRUE
	pipe_reagents = list(/datum/reagent/drug/nicotine = 30)
	eat_effect = /datum/status_effect/debuff/badmeal
	list_reagents = list(/datum/reagent/drug/nicotine = 5, /datum/reagent/consumable/nutriment = 1)
	grind_results = list(/datum/reagent/drug/nicotine = 10)



/*	..................   Cabbage   ................... */
/obj/item/reagent_containers/food/snacks/produce/cabbage
	name = "cabbage"
	desc = "A dense leafed vegetable, crunchy and ripe. A symbol of prosperity for elves"
	seed = /obj/item/neuFarm/seed/cabbage
	icon_state = "cabbage"
	tastes = list("cabbage" = 1)
	filling_color = "#88c8a0"
	bitesize = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	rotprocess = SHELFLIFE_LONG
	dropshrink = 0.8
	slices_num = 3
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/cabbage_sliced
	chopping_sound = TRUE

/*	..................   Onions   ................... */
/obj/item/reagent_containers/food/snacks/produce/onion
	name = "onion"
	desc = "A wonderful vegetable with many layers and broad flavor profile."
	seed = /obj/item/neuFarm/seed/onion
	icon_state = "onion"
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced
	tastes = list("onion" = 1)
	filling_color = "#fdfaca"
	bitesize = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/onion
	chopping_sound = TRUE
	dropshrink = 0.9
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/produce/onion/slice(obj/item/W, mob/user)
	. = ..()
	to_chat(user, "<span class='notice'>My eyes sting a little...</span>")
/*/obj/item/reagent_containers/food/snacks/produce/onion/slice(accuracy, obj/item/W, mob/user) This has the visual effect and I like it but it runtimes due to something with atmos. Until such time this stops being an issue we will have to use the gimped version above.
	var/datum/effect_system/smoke_spread/transparent/S = new	//Since the onion is destroyed when it's sliced,
	var/splat_location = get_turf(src)	//we need to set up the smoke beforehand
	S.attach(splat_location)
	S.set_up(reagents, 0, splat_location, 0)
	if(..())
		S.start()
		return TRUE
	qdel(S)*/


/*	..................   Potato   ................... */
/obj/item/reagent_containers/food/snacks/produce/potato
	name = "potato"
	desc = "A spud, dwarven icon of growth."
	seed = /obj/item/neuFarm/seed/potato
	icon_state = "potato"
	tastes = list("potato" = 1)
	filling_color = "#d8d8b6"
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/potato_sliced
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked
	eat_effect = null
	foodtype = VEGETABLES
	chopping_sound = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	bitesize = 1
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/voddena
	rotprocess = null
	dropshrink = 0.9

/*	..................   Sunflower   ................... */
/obj/item/reagent_containers/food/snacks/produce/sunflower
	seed = /obj/item/neuFarm/seed/sunflower
	name = "sunflower"
	desc = ""
	icon_state = "sunflower"
	seed = /obj/item/neuFarm/seed/sunflower
	slot_flags = ITEM_SLOT_HEAD
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 0)
	dropshrink = 0.8
	rotprocess = SHELFLIFE_EXTREME
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/roastseeds

/*	..................  Pear   ................... */ // for cider or eating raw
/obj/item/reagent_containers/food/snacks/produce/pear
	name = "pear"
	seed = /obj/item/neuFarm/seed/pear
	desc = "Too sweet for many, a favored treat for little ones. Dwarves do love them."
	icon_state = "pear"
	bitesize = 2
	foodtype = FRUIT
	tastes = list("pear" = 1)
	rotprocess = SHELFLIFE_DECENT
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/cider

/*	..................   Turnip   ................... */ // only for veggie soup
/obj/item/reagent_containers/food/snacks/produce/turnip
	name = "turnip"
	desc = "A shield against hunger, naught else."
	seed = /obj/item/neuFarm/seed/turnip
	icon_state = "turnip"
	tastes = list("dirt" = 1)
	bitesize = 1
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/turnip_sliced
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	chopping_sound = TRUE
	dropshrink = 0.9
	rotprocess = SHELFLIFE_EXTREME

/*
/obj/item/reagent_containers/food/snacks/produce/garlic
	name = "garlic"
	desc = "Your last line of defense against the vampiric horde."
//	seed = /obj/item/neuFarm/seed/garlic

/obj/item/reagent_containers/food/snacks/produce/amanita
//	seed = /obj/item/neuFarm/seed/mycelium/amanita
	name = "strange red mushroom"
	icon_state = "amanita"
	filling_color = "#daabab"
	bitesize = 3
	foodtype = GROSS
	tastes = list("numb" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin/amanitin = 3)
	grind_results = list(/datum/reagent/toxin/amanitin = 6)

/obj/item/reagent_containers/food/snacks/produce/rice
//	seed = /obj/item/neuFarm/seed/rice
	name = "rice grain"
	desc = ""
	icon_state = "rice"
	gender = PLURAL
	filling_color = "#f0f0f0"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("rice" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/sake
	distill_amt = 12
	grind_results = list(/datum/reagent/floure = 10)
*/
