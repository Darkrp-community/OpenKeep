/obj/item/clothing/head/roguetown
	name = "hat"
	desc = ""
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "top_hat"
	item_state = "that"
	body_parts_covered = HEAD|HAIR
	resistance_flags = FLAMMABLE
	smeltresult = /obj/item/ash
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	experimental_onhip = TRUE
	sewrepair = TRUE
	anvilrepair = null
	smeltresult = /obj/item/ash // Helmets have pre-defined smeltresults, this is for hats
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
	desc = "Conceals your face, whether against the rain, or the gazes of others."
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
	desc = "An eastern scarf usually worn around the head and neck."
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
	desc = "Worn by the faithful of Astrata."
	color = null
	icon_state = "astratahood"
	item_state = "astratahood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	resistance_flags = FIRE_PROOF // Not the sun hat!
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/nochood
	name = "moon hood"
	desc = "Worn by the faitful of Noc."
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
	desc = "Worn by the faithful of Necra, or less savory individuals."
	color = null
	icon_state = "necrahood"
	item_state = "necrahood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/dendormask
	name = "briar mask"
	desc = "Worn by the faithful of Dendor."
	color = null
	icon_state = "dendormask"
	item_state = "dendormask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	resistance_flags = FIRE_PROOF
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/eoramask
	name = "eoran mask"
	desc = "A silver rabbet mask worn by the faithful of Eora, usually during their rituals."
	color = null
	icon_state = "eoramask"
	item_state = "eoramask"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	dynamic_hair_suffix = ""
	resistance_flags = FIRE_PROOF // Made of metal
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/priestmask
	name = "solar visage"
	desc = "The sanctified helm of the most devoted. Thieves beware."
	color = null
	icon_state = "priesthead"
	item_state = "priesthead"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	resistance_flags = FIRE_PROOF

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
	desc = "A crude way to conceal one's identity, these are usually worn by local brigands to not get recognised."
	icon_state = "menacing"
	item_state = "menacing"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/menacing/bandit
	icon_state = "bandithood"

/obj/item/clothing/head/roguetown/jester
	name = "jester's hat"
	desc = "Just remember that the last laugh is on you."
	icon_state = "jester"
	item_state = "jester"
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/strawhat
	name = "crude straw hat"
	desc = "Welcome to the grain fields, thou plowerer of the fertile."
	icon_state = "strawhat"

/obj/item/clothing/head/roguetown/niteman
	name = "teller's hat"
	icon_state = "tophat"
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/fancyhat
	name = "fancy hat"
	icon_state = "fancy_hat"
	item_state = "fancyhat"

/obj/item/clothing/head/roguetown/bardhat
	name = "plumed hat"
	desc = "A simple leather hat with a fancy plume on top. A corny attempt at appearing regal \
			despite one's status. Typically worn by travelling minstrels of all kinds."
	icon_state = "bardhat"

/obj/item/clothing/head/roguetown/hatfur
	name = "fur hat"
	desc = "A hat made of fur typically worn by guildsmen."
	icon_state = "hatfur"

/obj/item/clothing/head/roguetown/hatblu
	name = "fur hat"
	icon_state = "hatblu"

/obj/item/clothing/head/roguetown/papakha
	name = "papakha"
	desc = "A fuzzy helmet of fur typically worn by frontiersmen of the far steppes."
	icon_state = "papakha"
	item_state = "papakha"

/obj/item/clothing/head/roguetown/fisherhat
	name = "straw hat"
	desc = "Wenches shall lust for thee. Fishe will fear thee. \
			Humen will cast their gaze aside. As thou walk, \
			no creecher shall dare make a sound on thy presence. \
			Thou wilt be alone on these barren lands."
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
	desc = "A white top hat typically worn by distinguished kitchen workers."
	icon_state = "chef"
	item_state = "chef"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/chaperon/greyscale
	name = "chaperon hat"
	desc = "A comfortable and fashionable headgear."
	icon_state = "chap_alt"
	item_state = "chap_alt"
	flags_inv = HIDEEARS
	color = "#cf99e3"

/obj/item/clothing/head/roguetown/chef
	name = "chef's hat"
	icon_state = "chef"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap
	name = "arming cap"
	desc = "A white peasant cap worn by most manual laborers to protect from sunburn."
	icon_state = "armingcap"
	item_state = "armingcap"
	flags_inv = HIDEEARS
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/knitcap
	name = "knit cap"
	desc = "A crude peasant cap worn by about every serf under Astrata's radiance."
	icon_state = "knitcap"
	//dropshrink = 0.75

/obj/item/clothing/head/roguetown/armingcap/dwarf
	color = "#cb3434"

/obj/item/clothing/head/roguetown/headband
	name = "headband"
	desc = "A piece of cloth worn around the temple."
	icon_state = "headband"
	item_state = "headband"
	//dropshrink = 0.75
	dynamic_hair_suffix = null

/obj/item/clothing/head/roguetown/headband/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/crown/serpcrown
	name = "crown of Rockhill"
	desc = "Heavy is the weight of the crown, and even heavier the responsability it infers to its wearer."
	icon_state = "serpcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	sellprice = 200
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF|ACID_PROOF|LAVA_PROOF|UNACIDABLE|INDESTRUCTIBLE

/obj/item/clothing/head/roguetown/crown/serpcrown/Initialize()
	. = ..()
	SSroguemachine.crown = src

/obj/item/clothing/head/roguetown/crown/serpcrown/surplus
	name = "crown"
	desc = "A replacement for the Crown of Rockhill, every bit as valid as proof of sovereignity as the original."
	icon_state = "serpcrowno"
	sellprice = 100

/obj/item/clothing/head/roguetown/crown/sparrowcrown
	name = "champion's circlet"
	desc = "Winner of tournaments, bask in Ravox's glory."
	icon_state = "sparrowcrown"
	//dropshrink = 0
	dynamic_hair_suffix = null
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = 50

/obj/item/clothing/head/roguetown/priesthat
	name = "priest's hat"
	desc = "The sacred headpiece of a priest."
	icon_state = "priest"
	//dropshrink = 0
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 77
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

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
	desc = "Habits worn by nuns of the pantheon's faith."
	icon_state = "nun"
	sellprice = 5
	allowed_race = list("human", "tiefling", "elf", "dwarf", "aasimar")

/obj/item/clothing/head/roguetown/hennin
	name = "hennin"
	desc = "A fashionable conical hat typically worn by princesses."
	icon_state = "hennin"
	sellprice = 19
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/helmet
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "nasal helmet"
	desc = "A steel nasal helmet, usually worn by the guards of any respectable fief."
	will_cover = HEAD|HAIR|NOSE
	resistance_flags = FIRE_PROOF
	icon_state = "nasal"
	sleevetype = null
	sleeved = null
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE
	blocksound = PLATEHIT
	max_integrity = 350
	sellprice = 30

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
	desc = "A humble iron helmet. The most standard and antiquated protection for one's head from harm."
	icon_state = "skullcap"
	armor = list("melee" = 70, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_cover = HEAD|HAIR|EARS
	max_integrity = 150
	sellprice = 20

/obj/item/clothing/head/roguetown/helmet/skullcap/copper
	name = "copper skull cap"//used by undead npc's and poor guys
	desc = "A poor copper helmet, used by barbarians or by militia trainees as a way to keep their skulls protected."
	icon_state = "coppercap"
	armor = list("melee" = 50, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_cover = HEAD|HAIR|EARS
	max_integrity = 100//max for copper armor
	sellprice = 10

/obj/item/clothing/head/roguetown/helmet/copper
	name = "copper warrior helmet"//used by undead npc's and antique warriors
	desc = "A humble copper helmet, used by ancient warriors before the age of iron."
	icon_state = "copperhelmet"
	armor = list("melee" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_cover = HEAD|HAIR|EARS
	max_integrity = 100//max for copper armor
	sellprice = 10

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/bronze
	name = "bronze warrior helmet"
	desc = "A simple and effective design, entire armies once wore helmets like these."
	icon_state = "bronzebucket"
	item_state = "bronzebucket"
	emote_environment = 3
	armor = list("melee" = 70, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)//bronze is almost the same as iron but not steel
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB) // Stab immunity as a treat for low FOV
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/bronze
	sellprice = 50

/obj/item/clothing/head/roguetown/helmet/horned
	name = "horned cap"
	desc = "A crude horned cap usually worn by brute barbarians to invoke fear unto their enemies."
	icon_state = "hornedcap"
	max_integrity = 150
	will_cover = HEAD|HAIR|EARS
	sellprice = 20

/obj/item/clothing/head/roguetown/helmet/winged
	name = "winged cap"
	icon_state = "wingedcap"
	max_integrity = 200
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	will_cover = HEAD|HAIR
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/helmet/kettle
	name = "kettle helmet"
	desc = "A lightweight steel helmet generally worn by crossbowmen and garrison archers."
	icon_state = "kettle"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	will_cover = HEAD|HAIR
	will_hide = HIDEEARS
	max_integrity = 250 // Covers less, so less overall integrity

/obj/item/clothing/head/roguetown/helmet/sallet
	name = "sallet"
	icon_state = "sallet"
	desc = "A simple steel helmet with no attachments. Helps protect the ears."
	smeltresult = /obj/item/ingot/steel
	will_cover = HEAD|HAIR|EARS
	will_hide = HIDEEARS
	max_integrity = 300
	sellprice = 35

/obj/item/clothing/head/roguetown/helmet/visored
	name = "parent visored helmet"
	desc = "If you're reading this, someone forgot to set an item description or spawned the wrong item. Yell at them."
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB) // All visored helmets protect against everything
	adjustable = CAN_CADJUST
	will_cover = FULL_HEAD
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel // All visored helmets are made of steel
	max_integrity = 350
	sellprice = 60

// Proc shared by all visored helmets, therefore modular
/obj/item/clothing/head/roguetown/helmet/visored/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			will_cover = HEAD|EARS|HAIR
			will_hide = HIDEEARS
			flags_cover = null
			prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT) // Vulnerable to eye stabbing while visor is open
			block2add = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
			will_cover = FULL_HEAD
			will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
			flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()
	else // Failsafe.
		to_chat(user, "<span class='warning'>Wear the helmet on your head to open and close the visor.</span>")
		return

// Prevents coverage error when unequipping.
/obj/item/clothing/head/roguetown/helmet/visored/dropped(mob/user)
	. = ..()
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	will_cover = FULL_HEAD
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/visored/sallet
	name = "visored sallet"
	desc = "A steel helmet offering good overall protection. Its visor can be flipped over for higher visibility at the cost of eye protection."
	icon_state = "sallet_visor"
	armor = list("melee" = 90, "bullet" = 75, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 60

/obj/item/clothing/head/roguetown/helmet/visored/hounskull
	name = "hounskull helmet" // "Pigface" is a modern term, hounskull is a c.1400 term.
	desc = "A bascinet with a mounted pivot to protect the face by deflecting blows on its conical surface, \
			highly favored by knights of great renown. Its visor can be flipped over for higher visibility \
			at the cost of eye protection."
	icon_state = "hounskull"
	item_state = "hounskull"
	emote_environment = 3
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	block2add = FOV_RIGHT|FOV_LEFT
	sellprice = 90

// Unique, therefore superb.
/obj/item/clothing/head/roguetown/helmet/sallet/elven
	desc = "A steel helmet with a thin gold plating designed for Elven woodland guardians."
	icon_state = "bascinet_novisor"
	item_state = "bascinet_novisor"
	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	color = COLOR_ASSEMBLY_GOLD
	sellprice = 100

/obj/item/clothing/head/roguetown/helmet/heavy
	name = "barbute"
	desc = "This is the parent heavy helmet. If you're seeing this, someone forgot to add item descriptions. Shame them."
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
	sellprice = 100

// VL's are already OP and the helm is made of iron, let's not give them too good of a helm
/obj/item/clothing/head/roguetown/helmet/heavy/guard
	name = "savoyard"
	desc = "A terrifying yet crude iron helmet shaped like a humen skull. Commands the inspiring terror of inhumen tyrants from yils past."
	icon_state = "guardhelm"
	emote_environment = 3
	armor = list("melee" = 90, "bullet" = 70, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron
	max_integrity = 200 // Still made of iron.

// Unused
/obj/item/clothing/head/roguetown/helmet/heavy/captain
	name = "barred helmet"
	desc = "An archaic helmet whose shape resembles bars of a gate."
	icon_state = "gatehelm"
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

// Entering big boy steel territory, high end gear
/obj/item/clothing/head/roguetown/helmet/visored/knight
	name = "knight's helmet"
	desc = "A lightweight armet that protects dreams of chivalrous friendship, fair maidens to rescue, and glorious deeds of combat. Its visor can be flipped over for higher visibility at the cost of eye protection."
	icon_state = "knight"
	item_state = "knight"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	adjustable = CAN_CADJUST
	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	will_cover = HEAD|EARS|HAIR|NOSE|EYES
	smeltresult = /obj/item/ingot/steel
	max_integrity = 350
	sellprice = 65

/obj/item/clothing/head/roguetown/helmet/visored/knight/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/helmet/heavy/bucket
	name = "great helmet"
	desc = "An immovable bulkwark of protection for the head of the faithful. Antiquated and impractical, but offering incredible defense."
	icon_state = "topfhelm"
	item_state = "topfhelm"
	emote_environment = 3
	armor = list("melee" = 90, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB) // Stab immunity as a treat for low FOV
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel
	sellprice = 60

/obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
	name = "astrata helmet"
	desc = "A great helmet decorated with a golden sigil of the solar order. The dependable companion of many holy warriors of Astrata."
	icon_state = "astratahelm"
	item_state = "astratahelm"
	emote_environment = 3
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/nochelm
	name = "noc helmet"
	desc = "A sleek and rounded heavy helmet. Its unique craft is said to allow holy warriors of Noc additional insight before battle."
	icon_state = "nochelm"
	item_state = "nochelm"
	emote_environment = 3
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
	name = "necra helmet"
	desc = "A reinforced helmet shaped into the visage of a skull. A symbol of authority for the battle servants of the Undermaiden."
	icon_state = "necrahelm"
	item_state = "necrahelm"
	emote_environment = 3
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
	name = "dendor helmet"
	desc = "A great helmet with twisted metalwork that imitates the twisting of bark, or the horns of a beast." 
	icon_state = "dendorhelm"
	item_state = "dendorhelm"
	emote_environment = 3
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/rust
	name = "rusted barbute"
	desc = "A rusted barbute. Relatively fragile, and might turn your hair brown, but offers good protection."
	icon_state = "rustbarbuta"
	emote_environment = 3
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron
	max_integrity = 200 // shitty rusted iron

/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "leather helmet"
	desc = "A conical leather helmet. It's comfortable and won't protect much, but it's better than nothing."
	will_cover = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("melee" = 30, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FLAMMABLE // Made of leather
	smeltresult = /obj/item/ash
	anvilrepair = null
	max_integrity = 200
	sewrepair = TRUE
	blocksound = SOFTHIT
	sellprice = 20

/obj/item/clothing/head/roguetown/helmet/leather/inquisitor
	name = "buckled hat"
	desc = "A black top hat with a buckle on top, favored by Witch Hunters and Inquisitors."
	icon_state = "puritan_hat"

/obj/item/clothing/head/roguetown/helmet/leather/headscarf
	name = "headscarf"
	desc = "Rolled cloth. Gives some protection at least."
	icon_state = "headscarf"
	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 120
	color = "#745a4d"

/obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "volf helmet"
	desc = "Bandit initiation rites often involve the slaying of a volf. This such helmet is produced after the hunt, as proof of having passed the test."
	will_cover = HEAD|HAIR|EARS
	icon_state = "volfhead"
	item_state = "volfhead"
	max_integrity = 150 //crude bandit craftsmenship
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)
	sellprice = 30

/obj/item/clothing/head/roguetown/helmet/leather/minershelm
	name = "leather miners helmet"
	desc = "A leather kettle-like helmet with a headlamp, fueled by magiks."
	icon_state = "minerslamp"
	var/brightness_on = 4 //less than a torch; basically good for one person.
	var/on = FALSE
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

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
	resistance_flags = FLAMMABLE
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/wizhat/gen
	icon_state = "wizardhatgen"
/*
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
*/


/obj/item/clothing/head/roguetown/nyle
	name = "jewel of nyle"
	icon_state = "nile"
	body_parts_covered = null
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = null
	sellprice = 100
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing

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
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	detail_tag = "_detail"
	dynamic_hair_suffix = ""
	max_integrity = 150
	colorgrenz = TRUE
	resistance_flags = FLAMMABLE
	smeltresult = /obj/item/ash
	sewrepair = TRUE
	anvilrepair = null

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
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY
	resistance_flags = FIRE_PROOF // These are all metallic
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST, BCLASS_BITE)
	anvilrepair = /datum/skill/craft/armorsmithing
	blocksound = PLATEHIT

/obj/item/clothing/head/roguetown/rare/elfplate
	icon_state = "elfhead"
	item_state = "elfhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "dark elf plate helmet"
	desc = "A bizarrely lightweight helmet of alloyed dark elven steel, offering unparalleled protection for elite bladesingers."
	body_parts_covered = HEAD|HAIR|NOSE
	allowed_race = list("elf", "half-elf", "dark elf")
	armor_class = ARMOR_CLASS_MEDIUM
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/rare/elfplate/welfplate
	name = "elvish plate helmet"
	desc = "A bizarrely lightweight helmet of alloyed elven steel, offering unparalleled protection for elite bladesingers."
	icon_state = "welfhead"
	item_state = "welfhead"
	body_parts_covered = HEAD|HAIR|NOSE|EYES

/obj/item/clothing/head/roguetown/rare/dwarfplate
	icon_state = "dwarfhead"
	item_state = "dwarfhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "langobard pot helm"
	desc = "The Langobards are a cult of personality that are tasked by the Dwarven Kings to issue judgement, \
			justice and order around the realms for dwarvenkind. This helmet is a respected symbol of authority."
	allowed_sex = list(MALE, FEMALE)
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
	flags_inv = HIDEEARS
	experimental_onhip = FALSE
	allowed_race = list("dwarf")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/rare/grenzelplate
	icon_state = "human_swordhead"
	item_state = "human_swordhead"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "grenzelhoftian chicklet sallet"
	desc = "A Grenzelhoftian chicklet sallet, decorated with a plume of valor. \
			It has been proven with severe battle-testing that a wearer's head would crack before the helmet chips."
	allowed_sex = list(MALE)
	body_parts_covered = HEAD|EARS|HAIR
	flags_inv = HIDEEARS
	allowed_race = list("human")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/rare/zybanplate
	icon_state = "human_spearhead"
	item_state = "human_spearplate"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "zybantean bastion helm"
	desc = "The Zybantu Kataphractoe are the ancestral guardians of the first Despot, \
			their helms designed in the fashion of the capital's majestic sky-piercing tower \
			where the old God-King resided."
	allowed_sex = list(MALE)
	body_parts_covered = HEAD|EARS|HAIR
	flags_inv = HIDEEARS
	allowed_race = list("human")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/helmet/sallet/zybantine
	name = "zybantine kulah khud"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "iranian"
	desc = "Known as devil masks amongst the Western Kingdoms, these serve part decorative headpiece, part protective helmet."
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

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
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/crown/circlet
	name = "golden circlet"
	desc = ""
	icon_state = "goldcirclet"
	item_state = "goldcirclet"
	dynamic_hair_suffix = null
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = 50

/obj/item/clothing/head/roguetown/crown/circlet/vision
	name = "mystical circlet"
	desc = "A shining gold circlet, with a mysterious purple insert. You feel like you have a third eye while near it..."
	icon_state = "visioncirclet"
	item_state = "visioncirclet"
	sellprice = 80

/obj/item/clothing/head/roguetown/crown/circlet/vision/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_THERMAL_VISION,"thermal_vision")
	else
		REMOVE_TRAIT(user, TRAIT_THERMAL_VISION,"thermal_vision")

/obj/item/clothing/head/roguetown/crown/circlet/sleepless
	name = "clouded circlet"
	desc = "A shining gold circlet, with a mysterious blue insert. You feel more energetic while near it..."
	icon_state = "sleepcirclet"
	item_state = "sleepcirclet"
	sellprice = 80

/obj/item/clothing/head/roguetown/crown/circlet/sleepless/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_NOSLEEP,"Fatal Insomnia")
	else
		REMOVE_TRAIT(user, TRAIT_NOSLEEP,"Fatal Insomnia")

/obj/item/clothing/head/roguetown/crown/circlet/stink
	name = "numbing circlet"
	desc = "A shining gold circlet, with a mysterious green insert. You feel your sense of smell numb while near it..."
	icon_state = "stinkcirclet"
	item_state = "stinkcirclet"
	sellprice = 80

/obj/item/clothing/head/roguetown/crown/circlet/stink/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_NOSTINK,"Dead Nose")
	else
		REMOVE_TRAIT(user, TRAIT_NOSTINK,"Dead Nose")

// Aasimar hoplite helmet
/obj/item/clothing/head/roguetown/rare/hoplite
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	name = "ancient helmet"
	desc = "A weathered bronze helmet topped with a symbol of Astrata's sun."
	icon_state = "aasimarhead"
	item_state = "aasimarhead"
	worn_x_dimension = 64
	worn_y_dimension = 64
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	body_parts_covered = HEAD|EARS|HAIR
	flags_inv = HIDEEARS
	allowed_race = list("aasimar")
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/helmet/ironplate
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "iron plate helmet"
	max_integrity = 350//isn't the same as a steel helmet but is better than a skullcap, costs 2 bars and protects the mouth
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_STAB) // Stab protection out of having faceplate
	block2add = FOV_RIGHT|FOV_LEFT // Unremovable visor.
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "ironplate"
	item_state = "ironplate"
	desc = "An iron masked helmet usually worn by armed men, it is a solid design yet antiquated and cheap."
	will_cover = HEAD|HAIR|NOSE|MOUTH|EARS
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/ironpot
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "iron plate helmet"
	max_integrity = 250//isn't the same as a steel helmet but is better than a skullcap
	armor = list("melee" = 50, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "ironpot"
	item_state = "ironpot"
	desc = "A iron pot style helmet designed to protect the skull and the nose, designs like those are outdated but they are simple to make in big numbers."
	will_cover = HEAD|HAIR|NOSE|EARS
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/iron
