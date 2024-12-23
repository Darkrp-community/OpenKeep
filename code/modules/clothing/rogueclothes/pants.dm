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


///////////////////////////////////////////////////////////////////
// Part of Kaizoku project. Usage ONLY for Stonekeep/Warmonger,  //
// If the usage is desired, ask monochrome9090 for permission.   //
// Respect the artists's will, COMMISSION them instead.          //
// This is solely for SPRITES. The code is free for the taking.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	name = "haidate tatami"
	desc = "Flexible thigh guard with interlocking scales sewn into the fabric. Ideal for agility during battle."
	gender = PLURAL
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	icon_state = "haidate_tatami"
	item_state = "haidate_tatami"
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/chainlegs/sendan
	name = "haidate sendan"
	desc = "Segmented thigh armor with overlapping plates that allows engagement in prolonged combat, without causing mobility issues."
	icon_state = "haidate_sendan"
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/platelegs/yoroihakama
	name = "yoroihakama"
	desc = "Hakama with extreme plate reinforcement, with protuding plates protecting the hips, and many interlocking steel plates under the cloth."
	gender = PLURAL
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	icon_state = "yoroihakama"
	item_state = "yoroihakama"
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/kaizoku/yoroihakama/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/under/roguetown/trou/tobi
	name = "tobi pants"
	desc = "Baggy pants of abyssariad design. Suitable for those who works the field and avoid horseback."
	icon_state = "tobi"
	item_state = "tobi"
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'

/obj/item/clothing/under/roguetown/tobi/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/under/roguetown/tobi/thunder
	name = "thunder tobi pants"
	color = CLOTHING_THUNDER

/obj/item/clothing/under/roguetown/tobi/storm
	name = "storm tobi pants"
	color = CLOTHING_STORM

/obj/item/clothing/under/roguetown/tobi/ocean
	name = "ocean tobi pants"
	color = CLOTHING_OCEAN

/obj/item/clothing/under/roguetown/tobi/island
	name = "island tobi pants"
	color = CLOTHING_ISLAND

/obj/item/clothing/under/roguetown/tobi/dark
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/under/roguetown/tobi/kabukimono
	color = CLOTHING_KABUKIMONO

/obj/item/clothing/under/roguetown/tobi/dragonslayer
	desc = "Baggy pants of abyssariad design. This one is coated in asbestos, and may be just as dangerous."
	color = "#3d4681"
	armor = list("melee" = 20, "bullet" = 0, "laser" = 75,"energy" = 75, "bomb" = 75, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/trou/leather/fur
	name = "thick tobi"
	icon_state = "furpants"
	desc = "A tobi made out of Dendor's beloved guardians - so Abyssor's beloved guardians can use it."

/obj/item/clothing/under/roguetown/tobi/fur/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/under/roguetown/tobi/fur/dragonslayer
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	color = CLOTHING_RED_OCHRE

/obj/item/clothing/under/roguetown/tights/hakama
	name = "hakama"
	icon_state = "hakama"
	alternate_worn_layer = SHOESLEEVE_LAYER
	desc = "Suitable for the Abyssariad-cultured, in which large battle-skirts does not hurt their masculinity, differently of the frail Imperial counterpart."

/obj/item/clothing/under/roguetown/tobi/hakama/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/under/roguetown/tobi/hakama/eidolon
	color = CLOTHING_EIDOLON

/obj/item/clothing/under/roguetown/trou/leather/shinobizubon
	name = "shinobi zubon"
	desc = "Traditional flexible pants with loose fit around the legs with hardened leather tied under the cloth and ankles to prevent snagging and noise."
	gender = PLURAL
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	icon_state = "shinobizubon"
	item_state = "shinobizubon"
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/under/roguetown/kaizoku/ceramic
	name = "marauder chausses"
	desc = "Bone chausses chiseled into a mimicry of shells, equal to a lamellar of mollusk shells, so it better absorb and disperse impact."
	gender = PLURAL
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	icon_state = "marauder_leg"
	item_state = "marauder_leg"
	sewrepair = FALSE
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = AC_MEDIUM
	body_parts_covered = GROIN|LEGS|FEET
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/platelegs/weepershanwenkai
	name = "weeper-patterned championage lowerhalf"
	desc = "Lower part of a godwenkai armor, relics of abyssariad championage for those of high-ranking deeply bound to Abyssanctum. Usually made of bronze, the grasp of the current era brought high-quality steel to the table."
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	icon_state = "weepershanwenkai"
	item_state = "weepershanwenkai"
	gender = PLURAL
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/kaizoku/ceramic/light
	name = "ivory leg plates"
	desc = "The leg protection proper for Undine warriors."
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
	max_integrity = 100
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_BLUNT)
	body_parts_covered = LEGS|FEET
	gender = PLURAL
	icon_state = "ivory_legs"
	item_state = "ivory_legs"

/obj/item/clothing/under/roguetown/kaizoku/tribal
	name = "tribal lowerhalf"
	desc = "piece of clothings usually used by Undine tribesmen of all genders."
	icon_state = "tribalcloth"
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_pants.dmi'
