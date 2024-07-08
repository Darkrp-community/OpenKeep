// -------------- FOOD PLATE -----------------
// plating - logic is meals (defined as cooked meals with pretty good nutrition, some skill/rare resources needed) can be plated for a small bonus
/obj/item/trash/plate/wood
	name = "plate"
	icon = 'icons/roguetown/items/cooking.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	icon_state = "plate_wood"
	resistance_flags = NONE
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	experimental_inhand = FALSE

// -------------- KITCHEN TOOLS -----------------
/obj/item/kitchen/spoon/plastic
	icon = 'icons/roguetown/items/cooking.dmi'

/obj/item/kitchen/rollingpin
	icon = 'icons/roguetown/items/cooking.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/rogueweapon/huntingknife/cleaver
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	item_state = "cleav"
	experimental_inhand = FALSE
	experimental_onhip = FALSE
	experimental_onback = FALSE

/obj/item/reagent_containers/glass/bowl
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	experimental_inhand = FALSE

/obj/item/reagent_containers/glass/cup
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	experimental_inhand = FALSE


// -------------- PEPPER MILL -----------------
/obj/item/reagent_containers/peppermill
	name = "pepper mill"
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "peppermill"
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	list_reagents = list(/datum/reagent/consumable/blackpepper = 5)
	reagent_flags = TRANSPARENT


/datum/crafting_recipe/roguetown/cooking/raisins
	name = "raisins"
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/raisins
	structurecraft = /obj/structure/fluff/dryingrack
	req_table = FALSE
	craftdiff = 0
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/cooking/butter
	name = "butter"
	reqs = list(
		/datum/reagent/consumable/milk = 15,
		/obj/item/reagent_containers/powder/salt = 1)
	result = /obj/item/reagent_containers/food/snacks/butter
	tools = list(/obj/item/reagent_containers/glass/bucket/wooden)

	subtype_reqs = FALSE

/datum/crafting_recipe/roguetown/cooking/cheese
	name = "fresh cheese"
	reqs = list(
		/datum/reagent/consumable/milk = 5,
		/obj/item/reagent_containers/powder/salt = 1)
	result = list(/obj/item/reagent_containers/food/snacks/rogue/cheese,
				/obj/item/reagent_containers/food/snacks/rogue/cheese,
				/obj/item/reagent_containers/food/snacks/rogue/cheese)
	tools = list(/obj/item/reagent_containers/glass/bucket/wooden)

	subtype_reqs = FALSE

/datum/crafting_recipe/roguetown/cooking/cheesewhee
	name = "cheese wheel"
	reqs = list(/obj/item/reagent_containers/food/snacks/rogue/cheese = 6)
	result = /obj/item/reagent_containers/food/snacks/rogue/cheddar

	subtype_reqs = FALSE

// Life has many Layers, Fuckboy. Onion land.

/obj/item/reagent_containers/food/snacks/rogue/skinnedonion
	name = "peeled onion"
	icon_state = "rawonionrings"
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/terriblerings

/obj/item/reagent_containers/food/snacks/rogue/terriblerings
	name = "unbreaded onion rings"
	icon_state = "rawonionrings"
	desc = "Unbreaded. Uncovered. Unloved."

/datum/crafting_recipe/roguetown/cooking/breadedonion
	name = "onion rings"
	reqs = list(/obj/item/reagent_containers/food/snacks/rogue/terriblerings = 1, /obj/item/reagent_containers/powder/flour = 1)
	result = /obj/item/reagent_containers/food/snacks/rogue/onionrings
	req_table = FALSE
	craftdiff = 0
	subtype_reqs = TRUE

/obj/item/reagent_containers/food/snacks/rogue/onionrings
	name = "raw breaded onion rings"
	icon_state = "rawonionrings"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/cooked/onionrings
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/cooked/onionrings
	name = "breaded onion rings"
	icon_state = "onionrings"
	desc = ""
	bitesize = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("crispy savoury morsel" = 1)

// Land of Potato.

/obj/item/reagent_containers/food/snacks/rogue/skinnedpotato
	name = "peeled potato"
	icon_state = "skinnedpotato"
	slices_num = 1
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/fingertatos
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/fingertatos
	name = "raw finger potatos"
	icon_state = "rawonionrings"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/cooked/godlesspotato
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/cooked/properfries
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/cooked/godlesspotato
	name = "baked finger potatos"
	icon_state = "ovenbakedfries"
	desc = ""
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	tastes = list("soggy starch" = 1)

/obj/item/reagent_containers/food/snacks/rogue/cooked/properfries
	name = "fried potato fingers"
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "friedsticks"
	desc = ""
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("crispy starch" = 1)

/obj/item/reagent_containers/food/snacks/rogue/cooked/bakedpotato
	name = "baked potato"
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "bakedpotato"
	desc = "Depressing."
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("bland fluffy grit" = 1)