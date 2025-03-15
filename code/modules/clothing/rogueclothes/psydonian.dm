// Full Blackplate Psydonian Armor, Event only gear


//................ Full Blackplate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate/full/psyrant
	name = "blackplate armor"
	desc = "Full blacksteel plate. Leg protecting tassets, groin cup, armored vambraces."
	icon = 'icons/roguetown/clothing/special/psyrant.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/psyrant.dmi'
	icon_state = "psyrant"
	item_state = "psyrant"
	equip_delay_self = 8 SECONDS
	unequip_delay_self = 7 SECONDS
	sellprice = VALUE_FULL_PLATE
	allowed_race = list("human")

	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_FULL
	max_integrity = INTEGRITY_STRONGEST


//................ Full Blackplate Boots ............... //
/obj/item/clothing/shoes/roguetown/boots/armor/psyrant
	name = "blackplated boots"
	desc = "Armored boots made from blacksteel offering heavy protection against both melee and ranged attacks."
	icon = 'icons/roguetown/clothing/special/psyrant.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/psyrant.dmi'
	icon_state = "psyboots"
	item_state = "psyboots"
	body_parts_covered = FEET
	allowed_race = list("human")
	max_integrity = INTEGRITY_STRONGEST


//................ Full Blackplate Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/visored/psyrant
	name = "blackplate visored barbute"
	desc = "A blackplate imperial helmet with a psydonian cross-visor."
	icon = 'icons/roguetown/clothing/special/psyrant.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/psyrant.dmi'
	icon_state = "psyhelmet"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	equip_delay_self = 3 SECONDS
	unequip_delay_self = 3 SECONDS

	armor = ARMOR_PLATE
	body_parts_covered = FULL_HEAD
	max_integrity = INTEGRITY_STRONGEST
	prevent_crits = ALL_CRITICAL_HITS


//................ Full Blackplate Gauntlets ............... //
/obj/item/clothing/gloves/roguetown/plate/psyrant
	name = "plate gauntlets"
	desc = "Heavy plated gauntlets made out of blacksteel. Offers the best protection against melee attacks and the most powerful slaps."
	icon = 'icons/roguetown/clothing/special/psyrant.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/psyrant.dmi'
	icon_state = "psygloves"
	blocksound = PLATEHIT
	allowed_race = list("human")
	max_integrity = INTEGRITY_STRONGEST
