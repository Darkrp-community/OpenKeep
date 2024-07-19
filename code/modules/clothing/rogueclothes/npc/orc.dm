/obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
	name = "Orc Marauder Breastplate"
	icon_state = "marauder_armor"
	item_state = "marauder_armor"
	icon = 'icons/roguetown/clothing/armor.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list("orc")
	armor = list("melee" = 70, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_MEDIUM
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 10

/obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc/warlord
	name = "Orc Warlord Plate"
	desc = "Fearsome armor which covers nearly the entire body."
	icon_state = "warlord_armor"
	item_state = "warlord_armor"
	icon = 'icons/roguetown/clothing/armor.dmi'
	armor = list("melee" = 80, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	max_integrity = 150
	sellprice = 15

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/orc
	name = "Orc Marauder Chain Vest"
	icon_state = "orc_chainvest"
	item_state = "orc_chainvest"
	icon = 'icons/roguetown/clothing/armor.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list("orc")
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_MEDIUM
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 10

/obj/item/clothing/head/roguetown/helmet/orc
	name = "Orc Marauder Helmet"
	icon_state = "marauder_helm"
	item_state = "marauder_helm"
	icon = 'icons/roguetown/clothing/head.dmi'
	allowed_race = list("orc")
	smeltresult = /obj/item/ingot/iron
	armor = list("melee" = 60, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES|NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 5

/obj/item/clothing/head/roguetown/helmet/orc/warlord
	name = "Orc Warlord Helmet"
	icon_state = "warlord_helm"
	item_state = "warlord_helm"
	allowed_race = list("orc")
	icon = 'icons/roguetown/clothing/head.dmi'
	armor = list("melee" = 70, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	max_integrity = 150
	sellprice = 10

obj/item/clothing/head/roguetown/helmet/leather/orc
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "leather helmet"
	desc = ""
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("melee" = 27, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	sewrepair = TRUE
	blocksound = SOFTHIT

/obj/item/clothing/suit/roguetown/armor/leather/hide/orc
	name = "orc loincloth"
	icon_state = "orc_leather"
	item_state = "orc_leather"
	icon = 'icons/roguetown/clothing/armor.dmi'
	allowed_race = list("orc")
	armor = list("melee" = 30, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN
	sellprice = 0

///obj/item/clothing/suit/roguetown/armor/leather/hide/orc


///obj/item/clothing/wrists/roguetown/bracers/leather/orc dead until i find a way to make them usable
