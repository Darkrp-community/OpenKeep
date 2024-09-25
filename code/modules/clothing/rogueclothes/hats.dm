/obj/item/clothing/head/roguetown
	slot_flags = ITEM_SLOT_HEAD
	name = "hat"
	desc = ""
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "top_hat"
	item_state = "that"
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null
	smeltresult = /obj/item/ash // Helmets have pre-defined smeltresults, this is for hats
	body_parts_covered = HEAD|HAIR
	sellprice = VALUE_CHEAP_CLOTHING

/obj/item/clothing/head/roguetown/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

//................ Simple Hats ............... //
/obj/item/clothing/head/roguetown/menacing
	name = "sack hood"
	desc = "A crude way to conceal one's identity, these are usually worn by local brigands to not get recognised."
	icon_state = "menacing"
	item_state = "menacing"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/roguetown/strawhat
	name = "crude straw hat"
	desc = "Welcome to the grain fields, thou plowerer of the fertile."
	icon_state = "strawhat"

/obj/item/clothing/head/roguetown/fisherhat
	name = "straw hat"
	desc = "Wenches shall lust for thee. Fishe will fear thee. \
			Humen will cast their gaze aside. As thou walk, \
			no creecher shall dare make a sound on thy presence. \
			Thou wilt be alone on these barren lands."
	icon_state = "fisherhat"
	item_state = "fisherhat"
//	color = "#fbc588"

/obj/item/clothing/head/roguetown/flathat
	name = "flat hat"
	icon_state = "flathat"
	item_state = "flathat"

/obj/item/clothing/head/roguetown/knitcap
	name = "knit cap"
	desc = "A crude peasant cap worn by about every serf under Astrata's radiance."
	icon_state = "knitcap"

/obj/item/clothing/head/roguetown/headband
	name = "headband"
	desc = "A piece of cloth worn around the temple."
	icon_state = "headband"
	item_state = "headband"
	dynamic_hair_suffix = null

/obj/item/clothing/head/roguetown/headband/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/armingcap
	name = "arming cap"
	desc = "A white peasant cap worn by most manual laborers to protect from sunburn."
	icon_state = "armingcap"
	item_state = "armingcap"
	flags_inv = HIDEEARS

//................ Fur Hats ............... //
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
	sellprice = VALUE_FINE_CLOTHING

//................ Chaperon Hat ............... //
/obj/item/clothing/head/roguetown/chaperon
	name = "chaperon hat"
	icon_state = "chaperon"
	item_state = "chaperon"
	flags_inv = HIDEEARS
	sellprice = VALUE_FINE_CLOTHING

/obj/item/clothing/head/roguetown/chaperon/greyscale
	name = "chaperon hat"
	desc = "A comfortable and fashionable headgear."
	icon_state = "chap_alt"
	item_state = "chap_alt"
	flags_inv = HIDEEARS
	color = "#cf99e3"

/obj/item/clothing/head/roguetown/chaperon/greyscale/random/Initialize()
	color = pick(CLOTHING_TEAL,  CLOTHING_GREEN, CLOTHING_ORANGE, CLOTHING_MAJENTA, CLOTHING_YELLOW)


//................ Cook Hat ............... //
/obj/item/clothing/head/roguetown/cookhat
	name = "cook hat"
	desc = "A white top hat typically worn by distinguished kitchen workers."
	icon_state = "chef"
	item_state = "chef"
	flags_inv = HIDEEARS

//................ Fancy Hats ............... //
/obj/item/clothing/head/roguetown/nun
	name = "nun's habit"
	desc = "Habits worn by nuns of the pantheon's faith."
	icon_state = "nun"
	allowed_race = list("human", "tiefling", "elf", "dwarf", "aasimar")

/obj/item/clothing/head/roguetown/fancyhat
	name = "fancy hat"
	icon_state = "fancy_hat"
	item_state = "fancyhat"
	sellprice = VALUE_FINE_CLOTHING

/obj/item/clothing/head/roguetown/bardhat
	name = "plumed hat"
	desc = "A simple leather hat with a fancy plume on top. A corny attempt at appearing regal \
			despite one's status. Typically worn by travelling minstrels of all kinds."
	icon_state = "bardhat"



/*------\
| Hoods |	- Defined as can be toggled
\------*/

/obj/item/clothing/head/roguetown/roguehood
	name = "hood"
	desc = "Conceals your face, whether against the rain, or the gazes of others."
	color = CLOTHING_BROWN
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "basichood"
	item_state = "basichood"
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	body_parts_covered = NECK
	max_integrity = 100

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

//................ Keffiyeh ............... //
/obj/item/clothing/head/roguetown/roguehood/shalal
	name = "keffiyeh"
	desc = "An eastern scarf usually worn around the head and neck."
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "shalal"
	item_state = "shalal"
	color = null

//................ Sun Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/astrata
	name = "sun hood"
	desc = "Worn by the faithful of Astrata."
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "astratahood"
	item_state = "astratahood"
	resistance_flags = FIRE_PROOF // Not the sun hat!
	color = null

//................ Moon Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/nochood
	name = "moon hood"
	desc = "Worn by the faitful of Noc."
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "nochood"
	item_state = "nochood"
//	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dropshrink = 0.8
	color = null

//................ Rabbet Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/eora
	name = "rabbet hood"
	desc = "A silver rabbet mask worn by the faithful of Eora, usually during their rituals."
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "eorahood"
	item_state = "eorahood"
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64
	color = null



/*------------\
| Temple hats |	- Those that aren't true hoods
\------------*/

//................ Death Shroud ............... //
/obj/item/clothing/head/roguetown/necrahood
	name = "death shroud"
	desc = "Worn by the faithful of Necra, or less savory individuals."
	icon_state = "necrahood"
	item_state = "necrahood"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

//................ Briar Mask ............... //
/obj/item/clothing/head/roguetown/dendormask
	name = "briar mask"
	desc = "Worn by the faithful of Dendor."
	icon_state = "dendormask"
	item_state = "dendormask"
	dynamic_hair_suffix = ""
	flags_inv = HIDEFACE|HIDEFACIALHAIR

//................ Rabbet Mask ............... //
/obj/item/clothing/head/roguetown/eoramask
	name = "eoran mask"
	desc = "A silver rabbet mask worn by the faithful of Eora, usually during their rituals."
	icon_state = "eoramask"
	item_state = "eoramask"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	worn_x_dimension = 64
	worn_y_dimension = 64
	dynamic_hair_suffix = ""
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEHAIR
	resistance_flags = FIRE_PROOF // Made of metal

//................ Solar Visage ............... //
/obj/item/clothing/head/roguetown/priestmask
	name = "solar visage"
	desc = "The sanctified helm of the most devoted. Thieves beware."
	icon_state = "priesthead"
	item_state = "priesthead"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/roguetown/priestmask/pickup(mob/living/user)
	if((user.job != "Priest") && (user.job != "Priestess"))
		to_chat(user, "<font color='yellow'>UNWORTHY HANDS TOUCH THE VISAGE, CEASE OR BE PUNISHED</font>")
		spawn(30)
			if(loc == user)
				user.adjust_fire_stacks(5)
				user.IgniteMob()



/*----------\
| Rare hats |	- Not craftable but importable usually
\-----------*/

//................ Golden Circlet ............... //
/obj/item/clothing/head/roguetown/crown/circlet
	name = "golden circlet"
	desc = ""
	icon_state = "goldcirclet"
	item_state = "goldcirclet"
	dynamic_hair_suffix = null
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = VALUE_GOLD_ITEM

/obj/item/clothing/head/roguetown/nyle
	name = "jewel of nyle"
	icon_state = "nile"
	dynamic_hair_suffix = null
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	sellprice = VALUE_GOLD_ITEM

//................ Hennin ............... //
/obj/item/clothing/head/roguetown/hennin
	name = "hennin"
	desc = "A fashionable conical hat typically worn by princesses."
	icon_state = "hennin"
	dynamic_hair_suffix = "+generic"
	sellprice = VALUE_FINE_CLOTHING



/*------------\
| Unique hats |	- Not craftable, not importable
\------------*/

//................ Crown of Rockhill ............... //
/obj/item/clothing/head/roguetown/crown/serpcrown
	name = "crown of Rockhill"
	desc = "Heavy is the weight of the crown, and even heavier the responsability it infers to its wearer."
	icon_state = "serpcrown"
	dynamic_hair_suffix = null
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF|ACID_PROOF|LAVA_PROOF|UNACIDABLE|INDESTRUCTIBLE
	sellprice = VALUE_GOLD_ITEM*2

/obj/item/clothing/head/roguetown/crown/serpcrown/Initialize()
	. = ..()
	SSroguemachine.crown = src

//................ Knock-off Crown ............... //
/obj/item/clothing/head/roguetown/crown/serpcrown/surplus
	name = "crown"
	desc = "A replacement for the Crown of Rockhill, every bit as valid as proof of sovereignity as the original."
	icon_state = "serpcrowno"
	sellprice = VALUE_GOLD_ITEM

/obj/item/clothing/head/roguetown/crown/sparrowcrown
	name = "champion's circlet"
	desc = "Winner of tournaments, bask in Ravox's glory."
	icon_state = "sparrowcrown"
	dynamic_hair_suffix = null
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF | ACID_PROOF
	sellprice = VALUE_GOLD_ITEM

//................ Jesters hat ............... //
/obj/item/clothing/head/roguetown/jester
	name = "jester's hat"
	desc = "Just remember that the last laugh is on you."
	icon_state = "jester"
	item_state = "jester"
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/cookhat/chef // only unique thing is the name
	name = "chef's hat"

/obj/item/clothing/head/roguetown/niteman // Now the archivist got this it seems
	name = "teller's hat"
	icon_state = "tophat"
	color = CLOTHING_BLACK
	sellprice = VALUE_FANCY_HAT

//................ Crown of Darkness ............... //
/obj/item/clothing/head/roguetown/vampire
	name = "crown of darkness"
	icon_state = "vcrown"
	body_parts_covered = null
	dynamic_hair_suffix = null
	sellprice = 1000
	resistance_flags = FIRE_PROOF



/*--------------\
| Basic helmets |
\--------------*/

/obj/item/clothing/head/roguetown/helmet
	name = "nasal helmet"
	desc = "A steel nasal helmet, usually worn by the guards of any respectable fief."
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "nasal"
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	resistance_flags = FIRE_PROOF
	anvilrepair = /datum/skill/craft/armorsmithing
	sewrepair = FALSE
	blocksound = PLATEHIT
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ITEM

	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 350

//................ Skull Cap ............... //
/obj/item/clothing/head/roguetown/helmet/skullcap
	name = "skull cap"
	desc = "A humble iron helmet. The most standard and antiquated protection for one's head from harm."
	icon_state = "skullcap"
	smeltresult = /obj/item/ash
	sellprice = VALUE_CHEAP_IRON_HELMET

	armor = list("melee" = 70, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	max_integrity = 150

//................ Horned Cap ............... //
/obj/item/clothing/head/roguetown/helmet/horned
	name = "horned cap"
	desc = "A crude horned cap usually worn by brute barbarians to invoke fear unto their enemies."
	icon_state = "hornedcap"
	smeltresult = /obj/item/ash
	sellprice = VALUE_CHEAP_IRON_HELMET

	body_parts_covered = HEAD|HAIR|EARS
	max_integrity = 150

//................ Winged Cap ............... //
/obj/item/clothing/head/roguetown/helmet/winged
	name = "winged cap"
	icon_state = "wingedcap"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	sellprice = VALUE_CHEAP_IRON_HELMET+ BONUS_VALUE_TINY

	body_parts_covered = HEAD|HAIR
	max_integrity = 200

//................ Kettle Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/kettle
	name = "kettle helmet"
	desc = "A lightweight steel helmet generally worn by crossbowmen and garrison archers."
	icon_state = "kettle"
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ash
	sellprice = VALUE_CHEAP_IRON_HELMET

	body_parts_covered = HEAD|HAIR
	max_integrity = 250 // Covers less, so less overall integrity

//................ Sallet ............... //
/obj/item/clothing/head/roguetown/helmet/sallet
	name = "sallet"
	icon_state = "sallet"
	desc = "A simple steel helmet with no attachments. Helps protect the ears."
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET

	body_parts_covered = HEAD|HAIR|EARS
	max_integrity = 300

//................ Elf Sallet ............... //
/obj/item/clothing/head/roguetown/helmet/sallet/elven	// blackoak merc helmet
	desc = "A steel helmet with a thin gold plating designed for Elven woodland guardians."
	icon_state = "bascinet_novisor"
	item_state = "bascinet_novisor"
	color = COLOR_ASSEMBLY_GOLD
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_MODEST

	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//................ Zybantine Kulah Khud ............... //
/obj/item/clothing/head/roguetown/helmet/sallet/zybantine // Unique Zybantu merc kit
	name = "zybantine kulah khud"
	desc = "Known as devil masks amongst the Western Kingdoms, these serve part decorative headpiece, part protective helmet."
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "iranian"
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

//................ Iron Plate Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/ironplate
	name = "iron plate helmet"
	desc = "An iron masked helmet usually worn by armed men, it is a solid design yet antiquated and cheap."
	icon_state = "ironplate"
	item_state = "ironplate"
	flags_inv = HIDEEARS
	block2add = FOV_RIGHT|FOV_LEFT // Unremovable visor.
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_CHEAP_IRON_HELMET

	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)	
	body_parts_covered = FULL_HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_STAB) // Stab protection out of having faceplate
	max_integrity = 350//isn't the same as a steel helmet but is better than a skullcap, costs 2 bars and protects the mouth

//................ Iron Pot Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/ironpot
	name = "iron pot helmet"
	desc = "A iron pot style helmet designed to protect the skull and the nose, designs like those are outdated but they are simple to make in big numbers."
	icon_state = "ironpot"
	item_state = "ironpot"
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_HELMET

	armor = list("melee" = 50, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|NOSE|EARS
	max_integrity = 250//isn't the same as a steel helmet but is better than a skullcap

//................ Copper Lamellar Cap ............... //
/obj/item/clothing/head/roguetown/helmet/coppercap
	name = "lamellar cap"
	desc = "A heavy lamellar cap made out of copper, a primitive material with an effective design to keep the head safe"
	icon_state = "lamellar"
	item_state = "lamellar"
	flags_inv = HIDEEARS
	smeltresult = /obj/item/ingot/copper
	sellprice = VALUE_LEATHER_HELMET // until copper/new mats properly finished and integrated this is a stopgap

	armor = list("melee" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	max_integrity = 150 //lowest possible for copper

//............... Battle Nun ........................... (unique kit for the role, iron coif mechanically.)
/obj/item/clothing/head/roguetown/helmet/battlenun
	name = "veil over coif"
	desc = "A gleaming coif of metal half-hidden by a black veil."
	icon_state = "battlenun"
	item_state = "battlenun"
	dynamic_hair_suffix = "+concealed"
	flags_inv = HIDEEARS|HIDEHAIR
	blocksound = CHAINHIT
	resistance_flags = FIRE_PROOF
	smeltresult = /obj/item/ash

	armor = list("melee" = 60, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Chainmail is meant to stop cuts, stabs and arrows, not blunt
	blocksound = CHAINHIT
	smeltresult = null



/*----------------\
| Visored helmets |
\----------------*/

/obj/item/clothing/head/roguetown/helmet/visored
	name = "parent visored helmet"
	desc = "If you're reading this, someone forgot to set an item description or spawned the wrong item. Yell at them."
	adjustable = CAN_CADJUST
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel // All visored helmets are made of steel
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY

	body_parts_covered = FULL_HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB) // All visored helmets protect against everything
	max_integrity = 350

// Proc shared by all visored helmets, therefore modular
/obj/item/clothing/head/roguetown/helmet/visored/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS
			flags_cover = null
			prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT) // Vulnerable to eye stabbing while visor is open
			block2add = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
			body_parts_covered = FULL_HEAD
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
			flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()
	else // Failsafe.
		to_chat(user, "<span class='warning'>Wear the helmet on your head to open and close the visor.</span>")
		return

//............... Visored Sallet ............... //
/obj/item/clothing/head/roguetown/helmet/visored/sallet
	name = "visored sallet"
	desc = "A steel helmet offering good overall protection. Its visor can be flipped over for higher visibility at the cost of eye protection."
	icon_state = "sallet_visor"

	armor = list("melee" = 90, "bullet" = 75, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//............... Hounskull ............... //
/obj/item/clothing/head/roguetown/helmet/visored/hounskull
	name = "hounskull helmet" // "Pigface" is a modern term, hounskull is a c.1400 term.
	desc = "A bascinet with a mounted pivot to protect the face by deflecting blows on its conical surface, \
			highly favored by knights of great renown. Its visor can be flipped over for higher visibility \
			at the cost of eye protection."
	icon_state = "hounskull"
	item_state = "hounskull"
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT

	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//............... Knights Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/visored/knight
	name = "knights helmet"
	desc = "A lightweight armet that protects dreams of chivalrous friendship, fair maidens to rescue, and glorious deeds of combat. Its visor can be flipped over for higher visibility at the cost of eye protection."
	icon_state = "knight"
	item_state = "knight"
	adjustable = CAN_CADJUST
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	max_integrity = 350

/obj/item/clothing/head/roguetown/helmet/visored/knight/black
	color = CLOTHING_BLACK



/*----------------\
| Heavy helmets |
\----------------*/

/obj/item/clothing/head/roguetown/helmet/heavy
	name = "barbute"
	desc = "This is the parent heavy helmet. If you're seeing this, someone forgot to add item descriptions. Shame them."
	icon_state = "barbute"
	item_state = "barbute"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET

	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = FULL_HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250

//............... Great Helm ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/bucket
	name = "great helmet"
	desc = "An immovable bulkwark of protection for the head of the faithful. Antiquated and impractical, but offering incredible defense."
	icon_state = "topfhelm"
	item_state = "topfhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR

	armor = list("melee" = 90, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB) // Stab immunity as a treat for low FOV

//............... Savoyard ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/guard
	name = "savoyard"
	desc = "A terrifying yet crude iron helmet shaped like a humen skull. Commands the inspiring terror of inhumen tyrants from yils past."
	icon_state = "guardhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_HELMET+BONUS_VALUE_MODEST

	armor = list("melee" = 90, "bullet" = 70, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200 // Still made of iron.

//............... Rusted Barbute ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/rust
	name = "rusted barbute"
	desc = "A rusted barbute. Relatively fragile, and might turn your hair brown, but offers good protection."
	icon_state = "rustbarbuta"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_LEATHER_HELMET

	max_integrity = 200 // shitty rusted iron
	sellprice = VALUE_IRON_HELMET/2

//............... Astrata Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/astratahelm
	name = "astrata helmet"
	desc = "A great helmet decorated with a golden sigil of the solar order. The dependable companion of many holy warriors of Astrata."
	icon_state = "astratahelm"
	item_state = "astratahelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)

//............... Noc Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/nochelm
	name = "noc helmet"
	desc = "A sleek and rounded heavy helmet. Its unique craft is said to allow holy warriors of Noc additional insight before battle."
	icon_state = "nochelm"
	item_state = "nochelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)

//............... Necra Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/necrahelm
	name = "necra helmet"
	desc = "A reinforced helmet shaped into the visage of a skull. A symbol of authority for the battle servants of the Undermaiden."
	icon_state = "necrahelm"
	item_state = "necrahelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	smeltresult = /obj/item/ingot/steel
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)

//............... Dendor Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/dendorhelm
	name = "dendor helmet"
	desc = "A great helmet with twisted metalwork that imitates the twisting of bark, or the horns of a beast." 
	icon_state = "dendorhelm"
	item_state = "dendorhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST)

//............... Sinistar (Graggar) Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/sinistar
	name = "sinistar helmet"
	desc = "Glorious star, smeared in guts and greeted with a chorus of howls."
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	icon_state = "sinistar"
	item_state = "sinistar"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	smeltresult = /obj/item/ingot/iron



/*----------------\
| Leather helmets |
\----------------*/

/obj/item/clothing/head/roguetown/helmet/leather
	name = "leather helmet"
	desc = "A conical leather helmet. It's comfortable and won't protect much, but it's better than nothing."
	icon_state = "leatherhelm"
	resistance_flags = FLAMMABLE // Made of leather
	smeltresult = /obj/item/ash
	anvilrepair = null
	sewrepair = TRUE
	blocksound = SOFTHIT
	sellprice = VALUE_LEATHER_HELMET

	armor = list("melee" = 30, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 200

//............... Buckled Hat ............... //
/obj/item/clothing/head/roguetown/helmet/leather/inquisitor
	name = "buckled hat"
	desc = "A black top hat with a buckle on top, favored by Witch Hunters and Inquisitors."
	icon_state = "puritan_hat"

//............... Headscarf ............... //
/obj/item/clothing/head/roguetown/helmet/leather/headscarf
	name = "headscarf"
	desc = "Rolled cloth. Gives some protection at least."
	icon_state = "headscarf"
	color = "#745a4d"
	sellprice = VALUE_LEATHER_HELMET/2

	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 120

//............... Ominous Hood ............... //
/obj/item/clothing/head/roguetown/helmet/leather/hood_ominous // a leather coif locked to headslot since you cannot pull it back. Crit prevent between armor items a little weird, this is leather coif, compare to helmet
	name = "ominous hood"
	desc = "Madmen. Cursed dogs. Beware."
	icon_state = "ominous"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	sellprice = VALUE_LEATHER_HELMET/2

	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)

//............... Hardened Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/leather/conical // old helmet sprite
	name = "hardened helmet"
	desc = "A conical helmet made from boiled leather and metal fittings."
	icon_state = "leatherhelm_old"
	item_state = "leatherhelm_old"

//............... Volf Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	name = "volf helmet"
	desc = "Bandit initiation rites often involve the slaying of a volf. This such helmet is produced after the hunt, as proof of having passed the test."
	icon_state = "volfhead"
	item_state = "volfhead"

	body_parts_covered = HEAD|HAIR|EARS
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)

//............... Miners Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/leather/minershelm
	name = "leather miners helmet"
	desc = "A leather kettle-like helmet with a headlamp, fueled by magiks."
	icon_state = "minerslamp"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	sellprice = VALUE_LEATHER_HELMET+BONUS_VALUE_MODEST

	armor = list("melee" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	var/brightness_on = 4 //less than a torch; basically good for one person.
	var/on = FALSE

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



/*------------------\
| Feldsher headwear |
\-------------------*/

//............... Feldshers Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/feld
	name = "feldsher's hood"
	desc = "My cure is most effective."
	icon_state = "feldhood"
	item_state = "feldhood"

//............... Physicians Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/phys
	name = "physicker's hood"
	desc = "My cure is mostly effective."
	icon_state = "surghood"
	item_state = "surghood"

//............... Feldshers Cage ............... //
/obj/item/clothing/head/roguetown/helmet/feld
	name = "feldsher's cage"
	desc = "To protect me from the maggets and creechers I treat."
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "headcage"
	icon_state = "headcage"
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES



/*------------------\
| Decorated helmets |
\------------------*/

//............... Decorated Knight Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/decoratedknighthelm
	name = "decorated knight helmet"
	desc = "A lavish knight's helmet which allows a crest to be mounted on top."
	icon_state = "decorated_knight"
	item_state = "decorated_knight"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY
	var/picked = FALSE

/obj/item/clothing/head/roguetown/helmet/decoratedknighthelm/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_decoration",
		"Blue"="blue_decoration",
		"Stripes"="stripes_decoration",
		"Red Castle"="castle_red_decoration",
		"White Castle"="castle_white_decoration",
		"Graggar"="graggar_decoration",
		"Efreet"="efreet_decoration",
		"Sun"="sun_decoration",
		"Feathers"="feathers_decoration",
		"Lion"="lion_decoration",
		"Red Dragon"="dragon_red_decoration",
		"Green Dragon"="dragon_green_decoration",
		"Horns"="horns_decoration",
		"Swan"="swan_decoration",
		"Fish"="fish_decoration",
		"Oathtaker"="oathtaker_decoration",
		"Skull"="skull_decoration")

		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/decoratedknighthelm/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)		

//............... Decorated Hounskull ............... //
/obj/item/clothing/head/roguetown/helmet/decoratedhounskull
	name = "decorated hounskull"
	desc = "A lavish hounskull which allows a crest to be mounted on top."
	icon_state = "decorated_hounskull"
	item_state = "decorated_hounskull"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY
	var/picked = FALSE

/obj/item/clothing/head/roguetown/helmet/decoratedhounskull/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_houndecoration",
		"Blue"="blue_houndecoration",
		"Stripes"="stripes_houndecoration",
		"Red Castle"="castle_red_houndecoration",
		"White Castle"="castle_white_houndecoration",
		"Graggar"="graggar_houndecoration",
		"Efreet"="efreet_houndecoration",
		"Sun"="sun_houndecoration",
		"Feathers"="feathers_houndecoration",
		"Lion"="lion_houndecoration",
		"Red Dragon"="dragon_red_houndecoration",
		"Green Dragon"="dragon_green_houndecoration",
		"Horns"="horns_houndecoration",
		"Swan"="swan_houndecoration",
		"Fish"="fish_houndecoration",
		"Oathtaker"="oathtaker_houndecoration",
		"Skull"="skull_houndecoration")

		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/decoratedhounskull/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)		

//............... Decorated Great Helm ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket
	name = "decorated greathelm"
	desc = "A lavish greathelm which allows a crest to be mounted on top."
	icon_state = "decorated_bucket"
	item_state = "decorated_bucket"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY
	var/picked = FALSE

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_bucket",
		"Blue"="blue_bucket",
		"Stripes"="stripes_bucket",
		"Red Castle"="castle_red_bucket",
		"White Castle"="castle_white_bucket",
		"Graggar"="graggar_bucket",
		"Efreet"="efreet_bucket",
		"Sun"="sun_bucket",
		"Feathers"="feathers_bucket",
		"Lion"="lion_bucket",
		"Red Dragon"="dragon_red_bucket",
		"Green Dragon"="dragon_green_bucket",
		"Horns"="horns_bucket",
		"Swan"="swan_bucket",
		"Fish"="fish_bucket",
		"Oathtaker"="oathtaker_bucket",
		"Skull"="skull_bucket")

		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)		

//............... Decorated Goldhelm ............... //
/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket
	name = "decorated goldhelm"
	desc = "A lavish gold-trimmed greathelm which allows a crest to be mounted on top."
	icon_state = "decorated_gbucket"
	item_state = "decorated_gbucket"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_TINY
	var/picked = FALSE

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_gbucket",
		"Blue"="blue_gbucket",
		"Stripes"="stripes_gbucket",
		"Red Castle"="castle_red_gbucket",
		"White Castle"="castle_white_gbucket",
		"Graggar"="graggar_gbucket",
		"Efreet"="efreet_gbucket",
		"Sun"="sun_gbucket",
		"Feathers"="feathers_gbucket",
		"Lion"="lion_gbucket",
		"Red Dragon"="dragon_red_gbucket",
		"Green Dragon"="dragon_green_gbucket",
		"Horns"="horns_gbucket",
		"Swan"="swan_gbucket",
		"Fish"="fish_gbucket",
		"Oathtaker"="oathtaker_gbucket",
		"Skull"="skull_gbucket")

		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)	



/*----------------------\
| Unique helmets & hats |	- Unique means no crafting them, no importing, nothing but spawn with the intended class
\----------------------*/

//............... Orc Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/orc
	name = "orc helmet"
	icon_state = "marauder_helm_item"
	item_state = "marauder_helm"
	icon = 'icons/roguetown/mob/monster/orc.dmi'
	allowed_race = list("orc")
	smeltresult = /obj/item/ingot/iron
	sellprice = NO_MARKET_VALUE	

	armor = list("melee" = 60, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|EARS|HAIR|EYES
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	max_integrity = 120


//............... Grenzelhoft Plume Hat ............... //
/obj/item/clothing/head/roguetown/grenzelhofthat
	name = "grenzelhoft plume hat"
	desc = "Slaying monsters or fair maidens: Grenzelhoft stands."
	icon_state = "grenzelhat"
	item_state = "grenzelhat"
	icon = 'icons/roguetown/clothing/head.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	detail_tag = "_detail"
	dynamic_hair_suffix = ""
	colorgrenz = TRUE
	sellprice = VALUE_FANCY_HAT

	max_integrity = 150

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
	resistance_flags = FIRE_PROOF // These are all metallic
	anvilrepair = /datum/skill/craft/armorsmithing
	blocksound = PLATEHIT

	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB, BCLASS_TWIST, BCLASS_BITE)
	sellprice = VALUE_STEEL_HELMET+BONUS_VALUE_SMALL

//............... Bladesinger Helmet ............... //
/obj/item/clothing/head/roguetown/rare/elfplate // Unique Bladesinger kit
	name = "elvish plate helmet"
	desc = "A bizarrely lightweight helmet of alloyed dark elven steel, offering unparalleled protection for elite bladesingers."
	icon_state = "elfhead"
	item_state = "elfhead"
	allowed_race = list("elf", "half-elf", "dark elf")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"

	armor_class = ARMOR_CLASS_MEDIUM
	body_parts_covered = HEAD|HAIR|NOSE

/obj/item/clothing/head/roguetown/rare/elfplate/welfplate // Unique Bladesinger kit
	desc = "A bizarrely lightweight helmet of alloyed elven steel, offering unparalleled protection for elite bladesingers."
	icon_state = "welfhead"
	item_state = "welfhead"

	body_parts_covered = HEAD|HAIR|NOSE|EYES

//............... Langobard Helmet ............... //
/obj/item/clothing/head/roguetown/rare/dwarfplate // Unique Longbeard kit
	name = "langobard pot helm"
	desc = "The Langobards are a cult of personality that are tasked by the Dwarven Kings to issue judgement, \
			justice and order around the realms for dwarvenkind. This helmet is a respected symbol of authority."
	icon_state = "dwarfhead"
	item_state = "dwarfhead"
	allowed_sex = list(MALE, FEMALE)
	allowed_race = list("dwarf")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"
	flags_inv = HIDEEARS

	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES

//............... Swordmaster Helmet ............... //
/obj/item/clothing/head/roguetown/rare/grenzelplate // Unique Swordmaster kit
	name = "grenzelhoftian chicklet sallet"
	desc = "A Grenzelhoftian chicklet sallet, decorated with a plume of valor. \
			It has been proven with severe battle-testing that a wearer's head would crack before the helmet chips."
	icon_state = "human_swordhead"
	item_state = "human_swordhead"
	allowed_sex = list(MALE)
	allowed_race = list("human")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"
	flags_inv = HIDEEARS

	body_parts_covered = HEAD|EARS|HAIR

//............... Kataphract/bastion/spear/zyban Helmet ............... //
/obj/item/clothing/head/roguetown/rare/zybanplate // Unique Freelancer kit
	name = "zybantean bastion helm"
	desc = "The Zybantu Kataphractoe are the ancestral guardians of the first Despot, \
			their helms designed in the fashion of the capital's majestic sky-piercing tower \
			where the old God-King resided."
	icon_state = "human_spearhead"
	item_state = "human_spearplate"
	allowed_sex = list(MALE)
	allowed_race = list("human")
	bloody_icon = 'icons/effects/blood32x64.dmi'
	bloody_icon_state = "helmetblood_big"
	flags_inv = HIDEEARS

	body_parts_covered = HEAD|EARS|HAIR


//............... Hoplite Helmet ............... //
/obj/item/clothing/head/roguetown/rare/hoplite // Unique Hoplite kit
	name = "ancient helmet"
	desc = "A weathered bronze helmet topped with a symbol of Astrata's sun."
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "aasimarhead"
	item_state = "aasimarhead"
	worn_x_dimension = 64
	worn_y_dimension = 64
	allowed_race = list("aasimar")
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"
	flags_inv = HIDEEARS

	body_parts_covered = HEAD|EARS|HAIR



/*---------------------\
| Magic hats & helmets |
\---------------------*/

//............... Wizard Hat ........................... (unique effects for court mage. Not any more so just a plain hat)
/obj/item/clothing/head/roguetown/wizhat
	name = "wizard hat"
	desc = "Used to distinguish dangerous wizards from senile old men."
	icon_state = "wizardhat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	worn_x_dimension = 64
	worn_y_dimension = 64
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

//............... Thermal Vision Circlet ............... //
/obj/item/clothing/head/roguetown/crown/circlet/vision
	name = "mystical circlet"
	desc = "A shining gold circlet, with a mysterious purple insert. You feel like you have a third eye while near it..."
	icon_state = "visioncirclet"
	item_state = "visioncirclet"
	sellprice = VALUE_MAGIC_ITEM_STRONG

/obj/item/clothing/head/roguetown/crown/circlet/vision/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_THERMAL_VISION,"thermal_vision")
	else
		REMOVE_TRAIT(user, TRAIT_THERMAL_VISION,"thermal_vision")

//............... Nosleep Circlet ............... //
/obj/item/clothing/head/roguetown/crown/circlet/sleepless
	name = "clouded circlet"
	desc = "A shining gold circlet, with a mysterious blue insert. You feel more energetic while near it..."
	icon_state = "sleepcirclet"
	item_state = "sleepcirclet"
	sellprice = VALUE_MAGIC_ITEM_WEAK

/obj/item/clothing/head/roguetown/crown/circlet/sleepless/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_NOSLEEP,"Fatal Insomnia")
	else
		REMOVE_TRAIT(user, TRAIT_NOSLEEP,"Fatal Insomnia")

//............... Stink Immunity Circlet ............... //
/obj/item/clothing/head/roguetown/crown/circlet/stink
	name = "numbing circlet"
	desc = "A shining gold circlet, with a mysterious green insert. You feel your sense of smell numb while near it..."
	icon_state = "stinkcirclet"
	item_state = "stinkcirclet"
	sellprice = VALUE_MAGIC_ITEM_WEAK


/obj/item/clothing/head/roguetown/crown/circlet/stink/equipped(mob/user, slot)
	. = ..()
	if (slot == SLOT_HEAD && istype(user))
		ADD_TRAIT(user, TRAIT_NOSTINK,"Dead Nose")
	else
		REMOVE_TRAIT(user, TRAIT_NOSTINK,"Dead Nose")



/*----------\
| Graveyard |	- Not used or ingame in any way except admeme spawning them.
\-----------*/

/obj/item/clothing/head/roguetown/helmet/heavy/captain
	name = "barred helmet"
	desc = "An archaic helmet whose shape resembles bars of a gate."
	icon_state = "gatehelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ITEM

/obj/item/clothing/head/roguetown/reqhat
	name = "serpent crown"
	desc = ""
	icon_state = "reqhat"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/priesthat // bishops mitre really
	name = "priest's hat"
	desc = "The sacred headpiece of a priest."
	icon_state = "priest"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood64x64.dmi'
	bloody_icon_state = "helmetblood_big"

/obj/item/clothing/head/roguetown/headdress // egyptian
	name = "foreign headdress"
	desc = ""
	icon_state = "headdress"

/obj/item/clothing/head/roguetown/headdress/alt
	icon_state = "headdressalt"

/obj/item/clothing/head/roguetown/armingcap/dwarf // gnome hat I guess?
	color = "#cb3434"


//Blackbag, spawns in Inquisition.
/obj/item/clothing/head/roguetown/sack
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "black bag"
	desc = "An eyeless sack, used to blindfold prisoners or hostages."
	//will_cover = HEAD|HAIR|NOSE|EARS
	flags_inv = HIDEEARS
	icon_state = "sacked"
	item_state = "sacked"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	tint = TINT_BLIND

/obj/item/clothing/head/roguetown/sack/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_HEAD)
		user.become_blind("blindfold[REF(src)]")

/obj/item/clothing/head/roguetown/sack/dropped(mob/living/carbon/human/user)
	..()
	user.cure_blind("blindfold_[REF(src)]")

/obj/item/clothing/head/roguetown/sack/attack(mob/living/target, mob/living/user)
	if(target.get_item_by_slot(SLOT_HEAD))
		to_chat(user, "<span class='warning'>Remove [target.p_their()] headgear first!</span>")
		return
	target.visible_message("<span class='warning'>[user] forces [src] onto [target]'s head!</span>", \
	"<span class='danger'>[target] forces [src] onto your head!</span>", "<i>I cant see anything.</i>")
	if(ishuman(target)) // If the target is human and not in combat mode, stun them the same way a feint would.
		var/mob/living/carbon/human/T = target
		if(!T.cmode)
			T.emote("whimper", intentional = FALSE)
			T.changeNext_move(8)
			T.Immobilize(10)
	user.dropItemToGround(src)
	target.equip_to_slot_if_possible(src, SLOT_HEAD)

/*	Last remnants of hipwearing flag inverter system
//	experimental_onhip = TRUE
//	var/will_cover // used for avoiding issues when worn on hip, currently only helmets
//	var/will_hide

// Prevents coverage error when unequipping. 
/obj/item/clothing/head/roguetown/helmet/visored/dropped(mob/user)
	. = ..()
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	will_cover = FULL_HEAD
	will_hide = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/equipped(mob/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		body_parts_covered = (will_cover)
		flags_inv = (will_hide)
	else
		body_parts_covered = null
		flags_inv = FALSE
*/