/obj/item/cooking/pot
	force = 10
	possible_item_intents = list(INTENT_GENERIC)
	name = "pot"
	desc = ""
	icon_state = "pote"
	sharpness = IS_BLUNT
	//dropshrink = 0.8
	slot_flags = null
	ingsize = 6
	item_state = "pot"
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	w_class = WEIGHT_CLASS_BULKY


// THE SOUP UPDATE IS BEING WORKED ON HERE (But it is on hold for now while I figure this fucking shit out)


// The Pot path is /obj/item/cooking/pot - This is the kettle of which soup is cooked. Stored in another file in TOOLS.
// Soup bowl icon stored in 'icons/roguetown/items/food.dmi'
/*
	var/list/acceptedfoods/list() // Describes what foods are allowed to go into soup, which is all food-path (/obj/item/reagent_containers/food/snacks/rogue)
	var/cookingtime = 2 MINUTES  // It takes 2 minutes to stew up a pot of the good stuff.
	var/maximumingredient = 5  // You can only add up to 5 ingredients
	var/nutrimentlevel // Detects how much nutriment UU's is within the food to determine if its a BROTH (5uu), GRUEL (10uu), SOUP(15uu) or STEW (20uu).

*/