/obj/item/clothing/head/roguetown
	name = "hat"
	desc = ""
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "top_hat"
	item_state = "that"
	body_parts_covered = HEAD|HAIR
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	experimental_onhip = TRUE
	var/will_cover // used for avoiding issues when worn on hip, currently only helmets
	var/will_hide

/obj/item/clothing/head/roguetown/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/roguehood
	name = "hood"
	desc = ""
	color = CLOTHING_BROWN
	icon_state = "basichood"
	item_state = "basichood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/shalal
	name = "keffiyeh"
	desc = ""
	color = null
	icon_state = "shalal"
	item_state = "shalal"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/astrata
	name = "sun hood"
	desc = ""
	color = null
	icon_state = "astratahood"
	item_state = "astratahood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/nochood
	name = "moon hood"
	desc = ""
	color = null
	icon_state = "nochood"
	item_state = "nochood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/necrahood
	name = "death shroud"
	color = null
	icon_state = "necrahood"
	item_state = "necrahood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/dendormask
	name = "briarmask"
	color = null
	icon_state = "dendormask"
	item_state = "dendormask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/eoramask
	name = "eoran mask"
	color = null
	icon_state = "eoramask"
	item_state = "eoramask"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask
	name = "solar visage"
	desc = "The sanctified helm of the most devoted. Thiefs beware."
	color = null
	icon_state = "priesthead"
	item_state = "priesthead"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask/pickup(mob/living/user)
	if((user.job != "Priest") && (user.job != "Priestess"))
		to_chat(user, "<font color='yellow'>UNWORTHY HANDS TOUCH THE VISAGE, CEASE OR BE PUNISHED</font>")
		spawn(30)
			if(loc == user)
				user.adjust_fire_stacks(5)
				user.IgniteMob()

/obj/item/clothing/head/roguetown/roguehood/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/roguehood/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/roguehood/random/Initialize()
	color = pick("#544236", "#435436", "#543836", "#79763f")
	..()

/obj/item/clothing/head/roguetown/roguehood/mage/Initialize()
	color = pick("#4756d8", "#759259", "#bf6f39", "#c1b144")
	..()

/obj/item/clothing/head/roguetown/roguehood/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			body_parts_covered = NECK|HAIR|EARS|HEAD
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = FOV_BEHIND
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = null
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()


/obj/item/clothing/head/roguetown/menacing
	name = "sack hood"
	icon_state = "menacing"
	item_state = "menacing"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/menacing/bandit
	icon_state = "bandithood"

/obj/item/clothing/head/roguetown/jester
	name = "jester's hat"
	icon_state = "jester"
	item_state = "jester"
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/strawhat
	name = "straw hat"
	icon_state = "strawhat"

/obj/item/clothing/head/roguetown/puritan
	name = "buckled hat"
	icon_state = "puritan_hat"

/obj/item/clothing/head/roguetown/niteman
	name = "teller's hat"
	icon_state = "tophat"
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/fancyhat
	name = "fancy hat"
	icon_state = "fancy_hat"
	item_state = "fancyhat"

/obj/item/clothing/head/roguetown/bardhat
	name = "hat"
	icon_state = "bardhat"

/obj/item/clothing/head/roguetown/hatfur
	name = "fur hat"
	icon_state = "hatfur"

/obj/item/clothing/head/roguetown/hatblu
	name = "fur hat"
	icon_state = "hatblu"

/obj/item/clothing/head/roguetown/papakha
	name = "papakha"
	icon_state = "papakha"
	item_state = "papakha"

/obj/item/clothing/head/roguetown/fisherhat
	name = "straw hat"
	icon_state = "fisherhat"
	item_state = "fisherhat"
//	color = "#fbc588"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/flathat
	name = "flat hat"
	icon_state = "flathat"
	item_state = "flathat"


/obj/item/clothing/head/roguetown/chaperon
	name = "chaperon hat"
	icon_state = "chaperon"
	item_state = "chaperon"
	flags_inv = HIDEEARS
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/cookhat
	name = "cook hat"
	icon_state = "chef"
	item_state = "chef"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/chaperon/greyscale
	name = "chaperon hat"
	icon_state = "chap_alt"
	item_state = "chap_alt"
	flags_inv = HIDEEARS
	color = "#cf99e3"

/obj/item/clothing/head/roguetown/chef
	name = "chef's hat"
	icon_state = "chef"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap
	name = "cap"
	icon_state = "armingcap"
	item_state = "armingcap"
	flags_inv = HIDEEARS
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/knitcap
	name = "knit cap"
	icon_state = "knitcap"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap/dwarf
	color = "#cb3434"

/obj/item/clothing/head/roguetown/headband
	name = "headband"
	icon_state = "headband"
	item_state = "headband"
	//dropshrink = 0.75
	dynamic_hair_suffix = null

/obj/item/clothing/head/roguetown/headband/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/crown/serpcrown
	name = "crown of rockhill"
	desc = ""
	icon_state = "serpcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/roguetown/crown/serpcrown/Initialize()
	. = ..()
	SSroguemachine.crown = src

/obj/item/clothing/head/roguetown/crown/serpcrown/surplus
	name = "crown"
	icon_state = "serpcrowno"
	sellprice = 100

/obj/item/clothing/head/roguetown/crown/sparrowcrown
	name = "champion's circlet"
	desc = ""
	icon_state = "sparrowcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = 50

/obj/item/clothing/head/roguetown/priesthat
	name = "priest's hat"
	desc = ""
	icon_state = "priest"
	//dropshrink = 0
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 77
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/reqhat
	name = "serpent crown"
	desc = ""
	icon_state = "reqhat"
	flags_inv = HIDEEARS
	sellprice = 100

/obj/item/clothing/head/roguetown/headdress
	name = "foreign headdress"
	desc = ""
	icon_state = "headdress"
	sellprice = 10

/obj/item/clothing/head/roguetown/headdress/alt
	icon_state = "headdressalt"

/obj/item/clothing/head/roguetown/nun
	name = "nun's habit"
	icon_state = "nun"
	sellprice = 5

/obj/item/clothing/head/roguetown/hennin
	name = "hennin"
	icon_state = "hennin"
	sellprice = 19
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/helmet
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "helmet"
	desc = ""
	will_cover = HEAD|HAIR|NOSE
	icon_state = "nasal"
	sleevetype = null
	sleeved = null
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	anvilrepair = /datum/skill/craft/armorsmithing
	blocksound = PLATEHIT
	max_integrity = 200

/obj/item/clothing/head/roguetown/helmet/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		body_parts_covered = (will_cover)
		flags_inv = (will_hide)
	else
		body_parts_covered = null
		flags_inv = FALSE


/obj/item/clothing/head/roguetown/helmet/skullcap
	name = "skull cap"
	desc = ""
	icon_state = "skullcap"
	will_cover = HEAD|HAIR
	max_integrity = 200

/obj/item/clothing/head/roguetown/helmet/horned
	name = "horned cap"
	icon_state = "hornedcap"
	max_integrity = 200
	will_cover = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/winged
	name = "winged cap"
	icon_state = "wingedcap"
	max_integrity = 200
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	will_cover = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/kettle
	desc = "A steel helmet which protects the ears."
	icon_state = "kettle"
	will_cover = HEAD|HAIR|EARS
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_hide = HIDEEARS

/obj/item/clothing/head/roguetown/helmet/sallet
	name = "sallet"
	icon_state = "sallet"
	desc = "A steel helmet which protects the ears."
	smeltresult = /obj/item/ingot/steel
	will_cover = HEAD|HAIR|EARS
	will_hide = HIDEEARS

/obj/item/clothing/head/roguetown/helmet/sallet/visored
	name = "visored sallet"
	desc = "A steel helmet which protects the ears, nose, and eyes."
	icon_state = "sallet_visor"
	adjustable = CAN_CADJUST
	will_hide = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	will_cover = HEAD|EARS|HAIR|NOSE|EYES
	block2add = FOV_BEHIND

/obj/item/clothing/head/roguetown/helmet/sallet/visored/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_inv = HIDEEARS
			flags_cover = null
			prevent_crits -= list(BCLASS_STAB) // Vulnerable to eye stabbing while visor is open
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits += list(BCLASS_STAB)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/sallet/elven
	desc = "A steel helmet with a thin gold plating designed for Elven woodland guardians."
	icon_state = "bascinet_novisor"
	item_state = "bascinet_novisor"
	color = COLOR_ASSEMBLY_GOLD

/obj/item/clothing/head/roguetown/helmet/heavy
	name = "barbute"
	desc = ""
	will_cover = FULL_HEAD
	icon_state = "barbute"
	item_state = "barbute"
	will_hide = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel
	max_integrity = 250

/obj/item/clothing/head/roguetown/helmet/heavy/guard
	name = "savoyard"
	desc = ""
	icon_state = "guardhelm"
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/heavy/captain
	name = "barred helmet"
	desc = ""
	icon_state = "gatehelm"
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/heavy/knight
	name = "knight's helmet"
	icon_state = "knight"
	item_state = "knight"
	adjustable = CAN_CADJUST
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	will_cover = HEAD|EARS|HAIR|NOSE|EYES
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/knight/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/helmet/heavy/knight/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "knightum"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS|HIDEHAIR
			flags_cover = null
			prevent_crits -= list(BCLASS_STAB) // Vulnerable to eye stabs with the cover up
			emote_environment = 0
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits += list(BCLASS_STAB)
			emote_environment = 3
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy/bucket
	name = "great helmet"
	icon_state = "topfhelm"
	item_state = "topfhelm"
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
	name = "astrata helmet"
	icon_state = "astratahelm"
	item_state = "astratahelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/nochelm
	name = "noc helmet"
	icon_state = "nochelm"
	item_state = "nochelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
	name = "necra helmet"
	icon_state = "necrahelm"
	item_state = "necrahelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
	name = "dendor helmet"
	icon_state = "dendorhelm"
	item_state = "dendorhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/pigface
	name = "pigface helmet"
	icon_state = "hounskull"
	item_state = "hounskull"
	adjustable = CAN_CADJUST
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/pigface/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS|HIDEHAIR
			flags_cover = null
			prevent_crits -= list(BCLASS_STAB) // Vulnerable to eye stabs with the cover up
			emote_environment = 0
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits += list(BCLASS_STAB)
			emote_environment = 3
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "leather helmet"
	desc = ""
	will_cover = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("melee" = 27, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	sewrepair = TRUE
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "volf helmet"
	desc = "Bandit initiation rites involve the slaying of a volf."
	will_cover = HEAD|HAIR|EARS
	icon_state = "volfhead"
	item_state = "volfhead"
	armor = list("melee" = 27, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	sewrepair = TRUE
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/leather/minershelm
	name = "leather miners helmet"
	desc = "A leather kettle-like helmet with a headlamp, fueled by magiks."
	icon_state = "minerslamp"
	var/brightness_on = 4 //less than a torch; basically good for one person.
	var/on = FALSE
	actions_types = list(/datum/action/item_action/toggle_helmet_light)

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/attack_self(mob/living/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/toggle_helmet_light(mob/living/user)
	on = !on
	if(on)
		turn_on(user)
	else
		turn_off(user)
	update_icon()

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/update_icon()
	icon_state = "minerslamp[on]"
	item_state = "minerslamp[on]"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon(force = TRUE)
	..()

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/turn_on(mob/user)
	set_light(brightness_on)

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/turn_off(mob/user)
	set_light(0)

//............... Wizard Hat ........................... (unique effects for court mage)
/obj/item/clothing/head/roguetown/wizhat
	name = "wizard hat"
	desc = "Used to distinguish dangerous wizards from senile old men."
	icon_state = "wizardhat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 100
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/wizhat/gen
	icon_state = "wizardhatgen"

/obj/item/clothing/head/roguetown/wizhat/equipped(mob/living/user, slot)
	. = ..()
	if(user.mind && user.mind.assigned_role == "Court Magician")
		if(slot == SLOT_HEAD && istype(user))
			user.apply_status_effect(/datum/status_effect/buff/thinking_cap)
		else
			user.remove_status_effect(/datum/status_effect/buff/thinking_cap)
	else return

/obj/item/clothing/head/roguetown/wizhat/dropped(mob/living/user, slot)
	. = ..()
	user.remove_status_effect(/datum/status_effect/buff/thinking_cap)



/obj/item/clothing/head/roguetown/nyle
	name = "jewel of nyle"
	icon_state = "nile"
	body_parts_covered = null
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = null
	sellprice = 100
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/roguetown/helmet/orc
	name = "orc helmet"
	icon_state = "marauder_helm_item"
	item_state = "marauder_helm"
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	allowed_race = list("orc")
	smeltresult = /obj/item/ingot/iron
	armor = list("melee" = 60, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	max_integrity = 120
	sellprice = 5

/obj/item/clothing/head/roguetown/grenzelhofthat
	name = "grenzelhoft plume hat"
	desc = "Slaying monsters or fair maidens: Grenzelhoft stands."
	icon_state = "grenzelhat"
	item_state = "grenzelhat"
	icon = 'icons/roguetown/clothing/head.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	slot_flags = ITEM_SLOT_HEAD
	detail_tag = "_detail"
	dynamic_hair_suffix = ""
	max_integrity = 150
	colorgrenz = TRUE

/obj/item/clothing/head/roguetown/grenzelhofthat/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/rare
	icon = 'icons/roguetown/topadd/takyon/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleevetype = null

/obj/item/clothing/head/roguetown/rare/elfplate
	icon_state = "elfhead"
	item_state = "elfhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "dark elf plate helmet"
	desc = ""
	body_parts_covered = HEAD|HAIR|NOSE
	allowed_race = list("elf", "half-elf", "dark elf")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/head/roguetown/rare/elfplate/welfplate
	name = "elvish plate helmet"
	icon_state = "welfhead"
	item_state = "welfhead"
	body_parts_covered = HEAD|HAIR|NOSE|EYES

/obj/item/clothing/head/roguetown/rare/dwarfplate
	icon_state = "dwarfhead"
	item_state = "dwarfhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "dwarvish plate helmet"
	desc = ""
	allowed_sex = list(MALE, FEMALE)
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
	flags_inv = HIDEEARS
	allowed_race = list("dwarf")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/head/roguetown/rare/humanswplate
	icon_state = "human_swordhead"
	item_state = "human_swordhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "northern plate helmet"
	desc = ""
	allowed_sex = list(MALE)
	body_parts_covered = HEAD|EARS|HAIR
	flags_inv = HIDEEARS
	allowed_race = list("human")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/head/roguetown/rare/humanspplate
	icon_state = "human_spearhead"
	item_state = "human_spearplate"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "southern plate helmet"
	desc = ""
	allowed_sex = list(MALE)
	body_parts_covered = HEAD|EARS|HAIR
	flags_inv = HIDEEARS
	allowed_race = list("human")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/head/roguetown/helmet/sallet/zybantine
	name = "zybantine kulah khud"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "iranian"
	desc = "Known as devil masks amongst the Northern Kingdoms, these serve part decorative headpiece, part protective helmet."
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/roguehood/feld
	name = "feldsher's hood"
	desc = "My cure is most effective."
	icon_state = "feldhood"
	item_state = "feldhood"
	color = null

/obj/item/clothing/head/roguetown/roguehood/phys
	name = "physicker's hood"
	desc = "My cure is mostly effective."
	icon_state = "surghood"
	item_state = "surghood"
	color = null

/obj/item/clothing/head/roguetown/helmet/feld
	name = "feldsher's cage"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	desc = "To protect me from the maggets and creechers I treat."
	icon_state = "headcage"
	icon_state = "headcage"
	worn_x_dimension = 64
	worn_y_dimension = 64
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
