/obj/item
	var/baitpenalty = 100 // Using this as bait will incurr a penalty to fishing chance. 100 makes it useless as bait. Lower values are better, but Never make it past 10.
	var/isbait = FALSE	// Is the item in question bait to be used?
	var/list/fishloot = null

/obj/item/natural/worms
	name = "worm"
	desc = "Wriggly blessings from Dendor, to feed the bird and the fish. Can be bundled and put in your pocket for luck."
	icon_state = "worm"
	throwforce = 10
	baitpenalty = 10
	isbait = TRUE
	color = "#985544"
	w_class = WEIGHT_CLASS_TINY
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	drop_sound = 'sound/foley/dropsound/food_drop.ogg'
	var/amt = 1

/obj/item/natural/worms/grubs
	name = "grub"
	baitpenalty = 5
	isbait = TRUE
	color = null
	fishloot = list(
		/obj/item/reagent_containers/food/snacks/fish/carp = 5,
		/obj/item/reagent_containers/food/snacks/fish/angler = 1,
		/obj/item/reagent_containers/food/snacks/fish/clownfish = 1,
	)

/obj/item/natural/worms/update_icon()
	icon_state = "worm[amt]"
	if(amt > 1)
		name = "[initial(name)]s"
	if(amt > 3)
		name = "[initial(name)]4"
	if(amt == 3)
		name = "[initial(name)]3"
	if(amt == 2)
		name = "[initial(name)]2"
	else
		name = initial(name)

/obj/item/natural/worms/Initialize()
	. = ..()
	dir = rand(0,8)
