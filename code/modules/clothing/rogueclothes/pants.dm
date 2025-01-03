/obj/item/clothing/under/roguetown
	slot_flags = ITEM_SLOT_PANTS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
	body_parts_covered = GROIN|LEGS
	resistance_flags = FLAMMABLE // Most made of cloth
	prevent_crits = list(BCLASS_LASHING)
	icon = 'icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/pants.dmi'
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	sleevetype = "leg"
	equip_delay_self = 30
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE
	anvilrepair = null
	r_sleeve_zone = BODY_ZONE_R_LEG
	l_sleeve_zone = BODY_ZONE_L_LEG
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	dropshrink = 0.8
	max_integrity = INTEGRITY_WORST

/obj/item/clothing/under/roguetown/AdjustClothes(mob/user)
#ifdef MATURESERVER
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_t"
			body_parts_covered = null
			slowdown += 2
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_pants()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_pants()
#else
	return
#endif

/obj/item/clothing/under/roguetown/tights
	name = "tights"
	desc = "Comfortable loose pants."
	gender = PLURAL
	icon_state = "tights"
	item_state = "tights"
//	adjustable = CAN_CADJUST

/obj/item/clothing/under/roguetown/tights/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/under/roguetown/tights/uncolored
	color = CLOTHING_LINEN

/obj/item/clothing/under/roguetown/tights/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/under/roguetown/tights/red
	color = CLOTHING_BLOOD_RED

/obj/item/clothing/under/roguetown/tights/purple
	color = CLOTHING_PLUM_PURPLE

/obj/item/clothing/under/roguetown/tights/green
	color = CLOTHING_SPRING_GREEN

/obj/item/clothing/under/roguetown/tights/jester
	desc = "Funny tights!"
	color = CLOTHING_SALMON

/obj/item/clothing/under/roguetown/tights/lord
	color = CLOTHING_PLUM_PURPLE

/obj/item/clothing/under/roguetown/tights/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_LEFT

/obj/item/clothing/under/roguetown/tights/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_RIGHT

/obj/item/clothing/under/roguetown/tights/vagrant/Initialize()
	color = pick(CLOTHING_MUD_BROWN, CLOTHING_OLD_LEATHER,  CLOTHING_SPRING_GREEN, CLOTHING_BARK_BROWN, CLOTHING_SOOT_BLACK	)
	..()

/obj/item/clothing/under/roguetown/tights/sailor
	name = "pants"
	icon_state = "sailorpants"

/obj/item/clothing/under/roguetown/webs
	name = "webbing"
	desc = "A fine webbing made from spidersilk, popular fashion within the underdark."
	gender = PLURAL
	icon_state = "webs"
	item_state = "webs"
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/trou/leather/mourning
	name = "mourning trousers"
	desc = "Dark trousers worn by morticians while performing burial rites."
	icon_state = "leathertrou"
	color = "#151615"

/obj/item/clothing/under/roguetown/trou/shadowpants
	name = "silk tights"
	desc = "Form-fitting legwear. Almost too form-fitting."
	icon_state = "shadowpants"
	allowed_race = list("elf", "dark elf")

/obj/item/clothing/under/roguetown/loincloth
	name = "loincloth"
	desc = "Protects your modesty, but not much else."
	icon_state = "loincloth"
	item_state = "loincloth"
//	adjustable = CAN_CADJUST
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/loincloth/brown
	color = CLOTHING_BARK_BROWN

/obj/item/clothing/under/roguetown/loincloth/pink
	color = "#b98ae3"

/obj/item/clothing/under/roguetown/tights/stockings
	name = "stockings"
	desc = "A legwear made just for the pure aesthetics. Popular in courts and brothels alike."
	icon_state = "stockings"
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	body_parts_covered = null
	flags_inv = null

/obj/item/clothing/under/roguetown/tights/stockings/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/under/roguetown/tights/stockings/white
	color = CLOTHING_WHITE

/obj/item/clothing/under/roguetown/tights/stockings/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/under/roguetown/tights/stockings/blue
	color = CLOTHING_BERRY_BLUE

/obj/item/clothing/under/roguetown/tights/stockings/red
	color = CLOTHING_WINESTAIN_RED

/obj/item/clothing/under/roguetown/tights/stockings/green
	color = CLOTHING_SPRING_GREEN

//Silk variants

/obj/item/clothing/under/roguetown/tights/stockings/silk
	name = "silk stockings"
	desc = "A legwear made just for the pure aesthetics. Made out of thin silk. Popular among nobles."
	icon_state = "silk"

/obj/item/clothing/under/roguetown/tights/stockings/silk/random/Initialize()
	color = RANDOM_NOBLE_DYES
	..()

/obj/item/clothing/under/roguetown/tights/stockings/silk/white
	color = CLOTHING_CHALK_WHITE

/obj/item/clothing/under/roguetown/tights/stockings/silk/black
	color = CLOTHING_DARK_INK

/obj/item/clothing/under/roguetown/tights/stockings/silk/blue
	color = CLOTHING_SKY_BLUE

/obj/item/clothing/under/roguetown/tights/stockings/silk/red
	color = CLOTHING_BLOOD_RED

/obj/item/clothing/under/roguetown/tights/stockings/silk/purple
	color = CLOTHING_PLUM_PURPLE

//..................................................................................................................................
/*---------------\
|			 	 |
|  Light Armor	 |
|			 	 |
\---------------*/

/obj/item/clothing/under/roguetown/trou
	name = "work trousers"
	desc = "Padded pants for hardy workers."
	gender = PLURAL
	icon_state = "trou"
	item_state = "trou"
//	adjustable = CAN_CADJUST
	sewrepair = TRUE
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

	armor = ARMOR_PADDED_BAD
	prevent_crits = MINOR_CRITICALS

/obj/item/clothing/under/roguetown/trou/leather
	name = "leather trousers"
	desc = "Standard leather pants for hardy workers."
	icon_state = "leathertrou"

	armor = ARMOR_LEATHER_BAD
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_POOR

/obj/item/clothing/under/roguetown/grenzelpants
	name = "grenzelhoftian paumpers"
	desc = "Padded pants for extra comfort and protection, adorned in vibrant colors."
	icon_state = "grenzelpants"
	item_state = "grenzelpants"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	detail_tag = "_detail"
	colorgrenz = TRUE

	armor = ARMOR_PADDED
	prevent_crits = MINOR_CRITICALS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/under/roguetown/grenzelpants/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


//................ Silk Pantaloons ............... //
/obj/item/clothing/under/roguetown/pantaloons
	name = "silk pantaloons"
	icon_state = "pantaloons"
	item_state = "pantaloons"
	color = CLOTHING_WET
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	adjustable = FALSE

/obj/item/clothing/under/roguetown/pantaloons/random/Initialize()
	color = RANDOM_NOBLE_DYES
	..()

/obj/item/clothing/under/roguetown/pantaloons/dark
	color = CLOTHING_DARK_INK


//..................................................................................................................................
/*---------------\
|			 	 |
|  Medium Armor	 |
|			 	 |
\---------------*/

/obj/item/clothing/under/roguetown/chainlegs
	name = "chain chausses"
	desc = "Chain mail chausses made of exquisite steel rings boasting superior protection."
	gender = PLURAL
	icon_state = "chain_legs"
	item_state = "chain_legs"
//	adjustable = CAN_CADJUST
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF
	blocksound = CHAINHIT
	equip_delay_self = 25
	unequip_delay_self = 25
	var/do_sound = FALSE
	equip_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	pickup_sound = "rustle"
	break_sound = 'sound/foley/breaksound.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

	armor_class = AC_MEDIUM
	armor = ARMOR_MAILLE
	max_integrity = INTEGRITY_STRONGER //300 Integrity, good for 8 halberd stabs.
	prevent_crits = ALL_EXCEPT_BLUNT


/obj/item/clothing/under/roguetown/chainlegs/iron
	icon_state = "ichain_legs"
	name = "iron chain chausses"
	desc = "Chain mail chausses made of iron rings woven together, offering protection against cuts and stabs."
	smeltresult = /obj/item/ingot/iron

	armor = ARMOR_MAILLE_IRON
	max_integrity = INTEGRITY_STRONG //250 Integrity.
	prevent_crits = ALL_EXCEPT_BLUNT_AND_STAB //Non-riveted, iron chain can be broken apart with a powerful thrust.


//..................................................................................................................................
/*---------------\
|			 	 |
|  Heavy Armor	 |
|			 	 |
\---------------*/

/obj/item/clothing/under/roguetown/platelegs
	name = "plated chausses"
	desc = "Cuisses made of plated steel, offering additional protection against blunt force."
	gender = PLURAL
	icon_state = "heavyleggies" // Finally a sprite
	item_state = "heavyleggies"
	// adjustable = CAN_CADJUST
	sewrepair = FALSE
	blocksound = PLATEHIT
	equip_delay_self = 30
	unequip_delay_self = 30
	resistance_flags = FIRE_PROOF
	var/do_sound = FALSE
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	pickup_sound = "rustle"
	break_sound = 'sound/foley/breaksound.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	clothing_flags = CANT_SLEEP_IN

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE
	max_integrity = INTEGRITY_STRONGER //350 Integrity, middle ground between bulky chestpieces and peripheral pieces.
	prevent_crits = ALL_EXCEPT_STAB

