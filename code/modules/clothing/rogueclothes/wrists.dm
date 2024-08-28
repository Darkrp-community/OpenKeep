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
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = "Boiled leather bracers typically worn by archers to protect their forearms."
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	smeltresult = /obj/item/ash
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE

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
	armor = list("melee" = 70, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0) // Less protection than steel

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project. Usage ONLY for Stonekeep/Warmonger,  //
// If the usage is desired, ask monochrome9090 for permission.   //
// Respect the artists's will, COMMISSION them instead.          //
// This is solely for SPRITES. The code is free for the taking.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/wrists/roguetown/bracers/kote
	name = "kote"
	desc = "a sashinuki kote, the armored sleeves and gloves knitted into a jacket layer. It belongs as one of the armor component of Sangu, together with Suneate and Haidate."
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	icon_state = "kote"
	item_state = "kote"

/obj/item/clothing/wrists/roguetown/kaizoku/dragonwrap
	name = "dragon wrappings"
	desc = "fireproof cloth wrappings to cover the arms and hands. It is completely made of asbestos and resin keeping its toxicity in place. For now."
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "dragonwrap"
	item_state = "dragonwrap"
	icon = 'icons/roguetown/kaizoku/clothingicon/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/wrists.dmi'
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 0)
	heat_protection = ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF