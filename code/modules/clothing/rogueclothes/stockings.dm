/obj/item/clothing/under/roguetown/stockings
	name = "stockings"
	desc = "just stockings"
	icon_state = "stockings"
	item_state = "stockings_f"
	body_parts_covered = LEGS
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar")
	icon = 'icons/roguetown/clothing/stockings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/stockings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_stockings.dmi'

/obj/item/clothing/under/roguetown/net_stockings
	name = "net stockings"
	desc = "just net stockings"
	icon_state = "net_stockings"
	item_state = "net_stockings_f"
	body_parts_covered = LEGS
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar")
	icon = 'icons/roguetown/clothing/stockings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/stockings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_stockings.dmi'

/datum/crafting_recipe/roguetown/sewing/stockings
    name = "stockings"
    result = list(/obj/item/clothing/under/roguetown/stockings)
    reqs = list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
    craftdiff = 0

/datum/crafting_recipe/roguetown/sewing/net_stockings
    name = "net stockings"
    result = list(/obj/item/clothing/under/roguetown/net_stockings)
    reqs = list(/obj/item/natural/fibers = 2)
    craftdiff = 0