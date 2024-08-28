/obj/item/clothing/under/roguetown
	slot_flags = ITEM_SLOT_PANTS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = FALSE
	body_parts_covered = GROIN|LEGS
	resistance_flags = FLAMMABLE // Most made of cloth
	icon = 'icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/pants.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
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
	var/colorable_var = FALSE
	var/picked

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
	color = pick("#544236", "#435436", "#543836", "#79763f")
	..()

/obj/item/clothing/under/roguetown/tights/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/tights/red
	color = CLOTHING_RED

/obj/item/clothing/under/roguetown/tights/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/under/roguetown/tights/green
	color = "#3c693c"

/obj/item/clothing/under/roguetown/tights/jester
	desc = "Funny tights!"
	color = "#1E3B20"

/obj/item/clothing/under/roguetown/tights/lord
	color = "#865c9c"

/obj/item/clothing/under/roguetown/tights/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_LEFT

/obj/item/clothing/under/roguetown/tights/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = GROIN|LEG_RIGHT

/obj/item/clothing/under/roguetown/tights/vagrant/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
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

/obj/item/clothing/under/roguetown/trou
	name = "work trousers"
	desc = "Padded pants for hardy workers."
	gender = PLURAL
	icon_state = "trou"
	item_state = "trou"
//	adjustable = CAN_CADJUST
	sewrepair = TRUE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/under/roguetown/trou/leather
	name = "leather trousers"
	desc = "Standard leather pants for hardy workers."
	icon_state = "leathertrou"

/obj/item/clothing/under/roguetown/trou/leather/mourning
	name = "mourning trousers"
	desc = "Dark trousers worn by morticians while performing burial rites."
	icon_state = "leathertrou"
	color = "#151615"

/obj/item/clothing/under/roguetown/chainlegs
	name = "chain chausses"
	desc = "Chain maille chausses made of exquisite steel rings boasting superior protection."
	gender = PLURAL
	icon_state = "chain_legs"
	item_state = "chain_legs"
//	adjustable = CAN_CADJUST
	sewrepair = FALSE
	armor = list("melee" = 100, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Chainmail is meant to stop cuts, stabs and arrows, not blunt
	armor_class = ARMOR_CLASS_MEDIUM
	resistance_flags = FIRE_PROOF
	blocksound = CHAINHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/chainlegs/iron
	icon_state = "ichain_legs"
	name = "iron chain chausses"
	desc = "Chain maille chausses made of iron rings woven together, offering protection against cuts and stabs."
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/platelegs
	name = "plated chausses"
	desc = "Chausses made of plated steel, offering additional protection against blunt force."
	gender = PLURAL
	icon_state = "heavyleggies" // Finally a sprite
	item_state = "heavyleggies"
	// adjustable = CAN_CADJUST
	sewrepair = FALSE
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 500
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_HEAVY
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/loincloth
	name = "loincloth"
	desc = "Protects your modesty, but not much else."
	icon_state = "loincloth"
	item_state = "loincloth"
//	adjustable = CAN_CADJUST
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/loincloth/brown
	color = CLOTHING_BROWN

/obj/item/clothing/under/roguetown/loincloth/pink
	color = "#b98ae3"

/obj/item/clothing/under/roguetown/grenzelpants
	name = "grenzelhoftian paumpers"
	desc = "Padded pants for extra comfort and protection, adorned in vibrant colors."
	icon_state = "grenzelpants"
	item_state = "grenzelpants"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	detail_tag = "_detail"
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT)
	colorgrenz = TRUE

/obj/item/clothing/under/roguetown/grenzelpants/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

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

/obj/item/clothing/under/roguetown/chainlegs/haidate_tatami/sendan
	name = "haidate sendan"
	desc = "Segmented thigh armor with overlapping plates that allows engagement in prolonged combat, without causing mobility issues."
	icon_state = "haidate_sendan"
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'

/obj/item/clothing/under/roguetown/platelegs/yoroihakama
	name = "yoroihakama"
	desc = "Hakama with extreme plate reinforcement, with protuding plates protecting the hips, and many interlocking steel plates under the cloth."
	gender = PLURAL
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	icon_state = "yoroihakama"
	item_state = "yoroihakama"

/obj/item/clothing/under/roguetown/kaizoku/yoroihakama/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/under/roguetown/tobi
	name = "tobi pants"
	desc = "baggy pants of abyssariad design. Suitable for those who works the field and avoid horseback."
	gender = PLURAL
	icon_state = "tobi"
	item_state = "tobi"
	icon = 'icons/roguetown/kaizoku/clothingicon/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/pants.dmi'
	sewrepair = TRUE
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	colorable_var = TRUE

/obj/item/clothing/under/roguetown/kaizoku/tobi/thunder
	name = "thunder tobi pants"
	color = "#be8b48"

/obj/item/clothing/under/roguetown/kaizoku/tobi/storm
	name = "storm tobi pants"
	color = "#1a2677"

/obj/item/clothing/under/roguetown/kaizoku/tobi/ocean
	name = "ocean tobi pants"
	color = "#56928a"

/obj/item/clothing/under/roguetown/kaizoku/tobi/island
	name = "island tobi pants"
	color = "#bd3541"

/obj/item/clothing/under/roguetown/kaizoku/tobi/dragonslayer
	desc = "baggy pants of abyssariad design. This one is coated in asbestos, and may be just as dangerous."
	color = "#3d4681"
	armor = list("melee" = 0, "bullet" = 0, "laser" = 75,"energy" = 75, "bomb" = 75, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/kaizoku/tobi/fur
	name = "fur tobi"
	icon_state = "furpants"
	desc = "A tobi made out of Dendor's beloved guardians - so Abyssor's beloved guardians can use it."
	colorable_var = TRUE

/obj/item/clothing/under/roguetown/kaizoku/tobi/hakama
	name = "hakama"
	icon_state = "hakama"
	alternate_worn_layer = SHOESLEEVE_LAYER
	body_parts_covered = GROIN|LEGS|FEET
	desc = "suitable for the Abyssariad-cultured, in which large battle-skirts does not hurt their masculinity, differently of the frail Imperial counterpart."
	colorable_var = TRUE

/obj/item/clothing/under/roguetown/kaizoku/shinobizubon
	name = "shinobi zubon"
	desc = "Traditional flexible pants with loose fit around the legs with hardened leather tied under the cloth and ankles to prevent snagging and noise."
	gender = PLURAL
	icon_state = "shinobizubon"
	item_state = "shinobizubon"
	sewrepair = TRUE
	armor = list("melee" = 15, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/under/roguetown/kaizoku/ceramic
	name = "marauder chausses"
	desc = "Chausses used by marauders under the banner of the Abyssariads."
	gender = PLURAL
	icon_state = "marauder_leg"
	item_state = "marauder_leg"
	sewrepair = FALSE
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_HEAVY
	body_parts_covered = GROIN|LEGS|FEET
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/under/roguetown/kaizoku/ceramic/light
	name = "ivory leg plates"
	desc = "The leg protection proper for Kappa warriors."
	max_integrity = 200
	prevent_crits = list(BCLASS_CHOP, BCLASS_BLUNT)

	gender = PLURAL
	icon_state = "ivory_legs"
	item_state = "ivory_legs"

/obj/item/clothing/under/roguetown/attack_right(mob/user)
	if(colorable_var == TRUE)
		if(picked)
			return
		var/the_time = world.time
		if(world.time > (the_time + 30 SECONDS))
			return
		var/colorone = input(user, "Your emotions spreads your will.","Abyssor allows you to flush emotions within the threads.") as null|anything in CLOTHING_COLOR_NAMES
		if(!colorone)
			return
		picked = TRUE
		color = clothing_color2hex(colorone)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_pants()
	return

/obj/item/clothing/under/roguetown/kaizoku/tribal
	name = "tribal lowerhalf"
	icon_state = "tribalcloth"
	desc = "piece of clothings usually used by Kappa tribesmen of all genders."