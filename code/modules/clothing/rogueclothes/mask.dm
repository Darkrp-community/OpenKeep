/obj/item/clothing/mask/rogue
	name = ""
	icon = 'icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/masks.dmi'
	body_parts_covered = FACE
	slot_flags = ITEM_SLOT_MASK
	resistance_flags = FIRE_PROOF
	sewrepair = TRUE
	anvilrepair = null

/obj/item/clothing/mask/rogue/spectacles
	name = "spectacles"
	icon_state = "glasses"
	break_sound = "glassbreak"
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	max_integrity = 20
	integrity_failure = 0.5
	resistance_flags = FIRE_PROOF
	body_parts_covered = EYES
//	block2add = FOV_BEHIND

/obj/item/clothing/mask/rogue/spectacles/golden
	name = "golden spectacles"
	icon_state = "goggles"
	break_sound = "glassbreak"
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	max_integrity = 35
	integrity_failure = 0.5
	resistance_flags = FIRE_PROOF
	body_parts_covered = EYES

/obj/item/clothing/mask/rogue/spectacles/Initialize()
	. = ..()
	AddComponent(/datum/component/spill, null, 'sound/blank.ogg')

/obj/item/clothing/mask/rogue/spectacles/Crossed(mob/crosser)
	if(isliving(crosser) && !obj_broken)
		take_damage(11, BRUTE, "melee", 1)
	..()

/obj/item/clothing/mask/rogue/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/rogue/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/mask/rogue/eyepatch
	name = "eyepatch"
	desc = "An eyepatch, fitted for the right eye."
	icon_state = "eyepatch"
	max_integrity = 20
	integrity_failure = 0.5
	block2add = FOV_RIGHT
	body_parts_covered = RIGHT_EYE
	resistance_flags = FLAMMABLE

/obj/item/clothing/mask/rogue/eyepatch/left
	desc = "An eyepatch, fitted for the left eye."
	icon_state = "eyepatch_l"
	block2add = FOV_LEFT
	body_parts_covered = LEFT_EYE

/obj/item/clothing/mask/rogue/lordmask
	name = "golden halfmask"
	desc = "Half of your face turned gold."
	icon_state = "lmask"
	sellprice = 50

/obj/item/clothing/mask/rogue/lordmask/l
	icon_state = "lmask_l"

/obj/item/clothing/mask/rogue/facemask
	name = "iron mask"
	icon_state = "imask"
	desc = "A heavy iron mask that both conceals and protects the face."
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing


/obj/item/clothing/mask/rogue/facemask/prisoner/Initialize()
	. = ..()
	name = "cursed mask"
	desc = "We are often criminals in the eyes of the earth, not only for having committed crimes, but because we know that crimes have been committed."
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/mask/rogue/facemask/prisoner/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/mask/rogue/facemask/steel
	name = "steel mask"
	icon_state = "smask"
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	desc = "A knightly steel mask that both conceals and protects the face. Usually paired with a bascinet."
	max_integrity = 300

/obj/item/clothing/mask/rogue/shepherd
	name = "halfmask"
	icon_state = "shepherd"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	adjustable = CAN_CADJUST
	resistance_flags = FLAMMABLE
	toggle_icon_state = TRUE
	experimental_onhip = TRUE

/obj/item/clothing/mask/rogue/shepherd/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_wear_mask()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEFACE|HIDEFACIALHAIR
			body_parts_covered = NECK|MOUTH
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_wear_mask()

/obj/item/clothing/mask/rogue/shepherd/rag
	name = "rag halfmask"
	icon_state = "ragmask"

/obj/item/clothing/mask/rogue/feld
	name = "feldsher's mask"
	desc = "Three times the beaks means three times the doctor."
	icon_state = "feldmask"
	item_state = "feldmask"
	resistance_flags = FLAMMABLE
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	body_parts_covered = FACE|EARS|EYES|MOUTH|NECK
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

/obj/item/clothing/mask/rogue/phys
	name = "physicker's mask"
	desc = "Packed with herbs to conceal the rot."
	icon_state = "surgmask"
	item_state = "surgmask"
	resistance_flags = FLAMMABLE
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	body_parts_covered = FACE|EARS|EYES|MOUTH|NECK
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project. Usage ONLY for Stonekeep/Warmonger,  //
// If the usage is desired, ask monochrome9090 for permission.   //
// Respect the artists's will, COMMISSION them instead.          //
// This is solely for SPRITES. The code is free for the taking.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/mask/rogue/kaizoku
	icon = 'icons/roguetown/kaizoku/clothingicon/masks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/masks.dmi'
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = FACE
	slot_flags = ITEM_SLOT_MASK
	var/colorable_var = FALSE
	var/picked

/obj/item/clothing/mask/rogue/kaizoku/menpo
	name = "iron menpo"
	icon_state = "ironmenpo"
	desc = "Ever since the Onis has been dignified on Abyssariad fold, they have been exalted in war masks - and this became their default pattern for menpos ever since. "
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	flags_inv = HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | MASKCOVERSMOUTH
	body_parts_covered = FACE|NECK
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	sewrepair = FALSE

/obj/item/clothing/mask/rogue/kaizoku/menpo/half
	name = "iron half menpo"
	icon_state = "ironhalfmenpo"
	max_integrity = 100
	desc = "A cheaper menpo portraying the lower part of a Oni's head. It covers only the neck and the mouth."
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel
	name = "steel menpo"
	icon_state = "steelmenpo"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/half
	name = "steel menpo"
	icon_state = "steelmenpo"
	max_integrity = 200
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask
	name = "iron Merkkin mask"
	icon_state = "ironmenpo_tribal"
	desc = "The old, barely used mask of the almost extinct Merkpeople, with fish-like characteristics. Usually used by Kappas."
	max_integrity = 100
	body_parts_covered = FACE|MOUTH|EYES

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/steel
	name = "steel tribal mask"
	icon_state = "steelmenpo_tribal"
	desc = "The old, barely used mask of the almost extinct Merkpeople, with fish-like characteristics. Usually used by Kappas."
	max_integrity = 200

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/tengu
	name = "tengu mask"
	icon_state = "colourable_tengumask"
	max_integrity = 100
	desc = "A mask that glorifies a Tengu warrior. It portrays the exagerated perception over the race - even if they lack such noses and eyebrows."
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/kitsune
	name = "kitsune mask"
	icon_state = "colourable_kitsunemask"
	max_integrity = 100
	desc = "A mask that glorifies a Kitsune warrior. It portrays the less exagerated perception over the race - since the mask's animalistic figure is no equal to their biology-defying skull."
	detail_tag = "_detail"
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/kitsune/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor
	name = "dishonor mask"
	desc = "Blackpowder-infused, soul-bound veil for dishonored champions as a consequence for bringing shame to their clan and traditions, for those unentitled to be called Abyssariads - prostitutes, beggars and burakumins in general. If broken, it will explode."
	icon_state = "bmask"
	max_integrity = 300
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 50, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE
	body_parts_covered = EYES | EARS | NOSE //Allows them to use their mouth due to the mouth opening.
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/Initialize()
	. = ..()
	name = "dishonor mask"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	explode(src)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/proc/explode(skipprob)
	STOP_PROCESSING(SSfastprocess, src)
	var/turf/T = get_turf(src)
	explosion(T, light_impact_range = 1, flame_range = 1, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))

/obj/item/clothing/mask/rogue/kaizoku/attack_right(mob/user)
	if(colorable_var == TRUE)
		if(picked)
			return
		var/the_time = world.time
		if(world.time > (the_time + 30 SECONDS))
			return
		var/colorone = input(user, "Your emotions spreads your will.","Flush emotions within the threads.") as null|anything in CLOTHING_COLOR_NAMES
		if(!colorone)
			return
		picked = TRUE
		color = clothing_color2hex(colorone)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_wear_mask()
		return
	else 
		return