/obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
	name = "Orc Marauder Breastplate"
	icon_state = "marauder_armor_item"
	item_state = "marauder_armor"
	icon = 'icons/roguetown/mob/monster/Orc.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list("orc")
	armor = list("melee" = 70, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_MEDIUM
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 10

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/orc
	name = "Orc Marauder Chain Vest"
	icon_state = "orc_chainvest_item"
	item_state = "orc_chainvest"
	icon = 'icons/roguetown/mob/monster/Orc.dmi'
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
	icon_state = "marauder_helm_item"
	item_state = "marauder_helm"
	icon = 'icons/roguetown/mob/monster/Orc.dmi'
	allowed_race = list("orc")
	smeltresult = /obj/item/ingot/iron
	armor = list("melee" = 60, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES|NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 5

/obj/item/clothing/suit/roguetown/armor/leather/hide/orc
	name = "orc loincloth"
	icon_state = "orc_leather_item"
	item_state = "orc_leather"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list("orc")
	armor = list("melee" = 30, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN
	sellprice = 0