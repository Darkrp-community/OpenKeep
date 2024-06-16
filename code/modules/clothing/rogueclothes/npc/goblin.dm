/obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
	name = "goblin mail"
	icon_state = "plate_armor_item"
	item_state = "plate_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	smeltresult = /obj/item/ingot/iron
	armor = list("melee" = 80, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = list("goblin")
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	anvilrepair = /datum/skill/craft/armorsmithing
	max_integrity = 60
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/goblin
	name = "goblin armor"
	icon_state = "leather_armor_item"
	item_state = "leather_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	armor = list("melee" = 60, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	armor_class = ARMOR_CLASS_LIGHT
	max_integrity = 60
	allowed_race = list("goblin")
	sellprice = 0
	smeltresult = /obj/item/ash

/obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	name = "goblin loincloth"
	icon_state = "cloth_armor"
	item_state = "cloth_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list("goblin")
	armor = list("melee" = 30, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN
	sellprice = 0
	smeltresult = /obj/item/ash

/obj/item/clothing/head/roguetown/helmet/leather/goblin
	name = "goblin helmet"
	icon_state = "leather_helm_item"
	item_state = "leather_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	armor = list("melee" = 30, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	allowed_race = list("goblin")
	sellprice = 0
	smeltresult = /obj/item/ash

/obj/item/clothing/head/roguetown/helmet/goblin
	name = "goblin helmet"
	icon_state = "plate_helm_item"
	item_state = "plate_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = list("goblin")
	armor = list("melee" = 80, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 0
	smeltresult = /obj/item/ingot/iron
