/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null

/obj/item/clothing/wrists/roguetown/bracers
	name = "plate vambraces"
	desc = "Plate forearm guards that offer superior protection while allowing mobility."
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE

	armor = ARMOR_PLATE
	body_parts_covered = ARMS
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGER

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = "Boiled leather bracers typically worn by archers to protect their forearms."
	icon_state = "lbracers"
	item_state = "lbracers"
	resistance_flags = null
	blocksound = SOFTHIT
	smeltresult = /obj/item/ash
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

	armor = ARMOR_LEATHER
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	desc = "Common Astratan vestments for the forearms."
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "wrappings"
	item_state = "wrappings"

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "nocwrappings"
	item_state = "nocwrappings"

//Aasimar hoplite bracers
/obj/item/clothing/wrists/roguetown/bracers/hoplite
	name = "ancient bracers"
	desc = "Stalwart bronze bracers, from an age long past."
	icon_state = "aasimarwrist"
	item_state = "aasimarwrist"

	armor = ARMOR_PLATE_BAD
	max_integrity = INTEGRITY_STRONG //Aasimar craftsmanship.

//copper bracers

/obj/item/clothing/wrists/roguetown/bracers/copper
	name = "copper bracers"
	desc = "Copper forearm guards that offer some protection while looking rather stylish."
	body_parts_covered = ARMS
	icon_state = "copperarm"
	item_state = "copperarm"
	smeltresult = /obj/item/ingot/copper
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE

	armor = ARMOR_PLATE_BAD
	max_integrity = INTEGRITY_POOR //Copper.
