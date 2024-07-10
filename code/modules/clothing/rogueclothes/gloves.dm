
/obj/item/clothing/gloves/roguetown
	slot_flags = ITEM_SLOT_GLOVES
	body_parts_covered = HANDS
	sleeved = 'icons/roguetown/clothing/onmob/gloves.dmi'
	icon = 'icons/roguetown/clothing/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/gloves.dmi'
	bloody_icon_state = "bloodyhands"
	sleevetype = "shirt"
	max_heat_protection_temperature = 361
	resistance_flags = FIRE_PROOF
	sewrepair = TRUE
	anvilrepair = null
	smeltresult = /obj/item/ash

/obj/item/clothing/gloves/roguetown/leather
	name = "leather gloves"
	desc = "Gloves made out of sturdy leather. Warm, and offer very small protection against melee attacks."
	icon_state = "leather_gloves"
	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	resistance_flags = FLAMMABLE // Made of leather
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'

/obj/item/clothing/gloves/roguetown/leather/black
	color = CLOTHING_BLACK

/obj/item/clothing/gloves/roguetown/fingerless
	name = "fingerless gloves"
	desc = "Gloves made out of sturdy leather with the fingers cut off for extra dexterity. They offer almost no protection whatsoever."
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "fingerless_gloves"
	max_integrity = 150
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	resistance_flags = FLAMMABLE // Made of leather
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'


/obj/item/clothing/gloves/roguetown/angle
	name = "heavy leather gloves"
	desc = "A heavier pair of leather gloves with extra padding. These look like they can take some beating. Fair melee protection and decent durability."
	icon_state = "angle"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 250
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	resistance_flags = FLAMMABLE // Made of leather

/obj/item/clothing/gloves/roguetown/chain
	name = "chain gauntlets"
	desc = "Gauntlets made out of interwoven steel chains. Average melee protection, though better used to stop arrows from being lethal."
	icon_state = "cgloves"
	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB)
	armor_class = ARMOR_CLASS_MEDIUM
	resistance_flags = null
	blocksound = CHAINHIT
	max_integrity = 300
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = null
	sewrepair = FALSE

/obj/item/clothing/gloves/roguetown/chain/iron
	name = "iron chain gauntlets"
	icon_state = "icgloves"
	desc = "Gauntlets made out of interwoven iron chains. Decent melee protection, but are better suited to stop arrows than blades."
	armor = list("melee" = 60, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250

/obj/item/clothing/gloves/roguetown/plate
	name = "plate gauntlets"
	desc = "Plated gauntlets made out of steel. Offers the best protection against melee attacks."
	icon_state = "gauntlets"
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor_class = ARMOR_CLASS_HEAVY
	blocksound = PLATEHIT
	body_parts_covered = ARMS|HANDS
	max_integrity = 350
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE
	smeltresult = null

/obj/item/clothing/gloves/roguetown/grenzelgloves
	name = "grenzelhoft gloves"
	desc = "Regal gloves of Grenzelhoftian design, more a fashion statement than actual protection."
	icon_state = "grenzelgloves"
	item_state = "grenzelgloves"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	resistance_flags = FLAMMABLE // Made of cloth

/obj/item/clothing/gloves/roguetown/rare
	icon = 'icons/roguetown/topadd/takyon/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleeved = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleevetype = null
	blocksound = PLATEHIT
	body_parts_covered = HANDS
	blade_dulling = DULLING_BASH
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 400
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/gloves/roguetown/rare/elfplate
	name = "dark elf plate gauntlets"
	desc = "Plate gauntlets of mystic dark elven alloy, lightweight yet incredibly protective. Typically worn by elite bladesingers."
	item_state = "elfhand"
	icon_state = "elfhand"
	allowed_race = list("elf", "half-elf", "dark elf")
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'

/obj/item/clothing/gloves/roguetown/rare/elfplate/welfplate
	name = "elvish plate gauntlets"
	desc = "Plate gauntlets of mystic elven alloy, lightweight yet incredibly protective. Typically worn by elite bladesingers."
	item_state = "welfhand"
	icon_state = "welfhand"

/obj/item/clothing/gloves/roguetown/rare/dwarfplate
	name = "dwarvish plate gauntlets"
	desc = "Plated gauntlets of masterwork dwarven smithing, the pinnacle of protection for one's hands."
	item_state = "dwarfhand"
	icon_state = "dwarfhand"
	allowed_race = list("dwarf")
	allowed_sex = list(MALE, FEMALE)
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'

/obj/item/clothing/gloves/roguetown/rare/grenzelplate
	name = "grenzelhoftian plate gauntlets"
	desc = "Battling the Zybantus led to the exchange of military ideas. The Grenzelhoft adopted refined chain and plate armaments to better allow their knights unmatchable resilience against the enemies of their Empire."
	item_state = "human_swordhand"
	icon_state = "human_swordhand"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'

/obj/item/clothing/gloves/roguetown/rare/zybanplate
	name = "kataphractoe claw gauntlets"
	desc = "Interwoven beautifully with layers of silk, chain and plate, these gauntlets grant unmatched coverage while allowing maximum mobility. Both useful to the Zybantu's ever-growing slave-empire."
	item_state = "human_spearhand"
	icon_state = "human_spearhand"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'

/obj/item/clothing/gloves/roguetown/leather/feld
	name = "feldsher's gloves"
	desc = "Improved grip for wielding the tools of the trade."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "feldgloves"
	item_state = "feldgloves"

/obj/item/clothing/gloves/roguetown/leather/phys
	name = "physicker's gloves"
	desc = "Improved grip for wielding disembowled organs."
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "surggloves"
	item_state = "surggloves"
