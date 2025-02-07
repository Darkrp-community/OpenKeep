/obj/item/clothing/shoes/roguetown
	name = "shoes"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = "Typical shoes worn by almost anyone."
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	prevent_crits = list(BCLASS_LASHING, BCLASS_TWIST)
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE
	sellprice = 5

/obj/item/clothing/shoes/roguetown/boots
	name = "dark boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Boots made out of darker materials. Offers light protection against melee attacks."
	gender = PLURAL
	icon_state = "blackboots"
	item_state = "blackboots"
	sellprice = 10

	armor = ARMOR_LEATHER_BAD
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/shoes/roguetown/nobleboot
	name = "noble boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Fine dark leather boots. Offers light protection against melee attacks."
	gender = PLURAL
	icon_state = "nobleboots"
	item_state = "nobleboots"
	sellprice = 10

	armor = ARMOR_LEATHER_BAD
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STRONGER //Durable.

/obj/item/clothing/shoes/roguetown/shortboots
	name = "shortboots"
	color = "#d5c2aa"
	desc = "A shorter format of boots worn by about anyone."
	gender = PLURAL
	icon_state = "shortboots"
	item_state = "shortboots"

	armor = ARMOR_LEATHER_WORST
	prevent_crits = MINOR_CRITICALS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "riding boots"
	color = "#d5c2aa"
	desc = "Boots designed for riding a mount."
	gender = PLURAL
	icon_state = "ridingboots"
	item_state = "ridingboots"
	sellprice = 10

	armor = ARMOR_LEATHER
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STRONGER

///obj/item/clothing/shoes/roguetown/ridingboots/Initialize()
//	. = ..()
//	AddComponent(/datum/component/squeak, list('sound/foley/spurs (1).ogg'sound/blank.ogg'=1), 50)

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "shoes"
	desc = "Simple shoes worn by about anyone."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = CLOTHING_OLD_LEATHER

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null


/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "shoes"
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "shoes"
	desc = "Shoes typically worn by the Lord himself."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = CLOTHING_ASH_GREY
	sellprice = 20

/obj/item/clothing/shoes/roguetown/gladiator
	name = "leather sandals"
	desc = "Open design sandals made from sturdy leather. Can be typically seen worn by gladiators."
	gender = PLURAL
	icon_state = "gladiator"
	item_state = "gladiator"

/obj/item/clothing/shoes/roguetown/sandals
	name = "sandals"
	desc = "Standard sandals."
	gender = PLURAL
	icon_state = "sandals"
	item_state = "sandals"

/obj/item/clothing/shoes/roguetown/hoplite
	name = "ancient sandals"
	desc = "Worn sandals lined with bronze, ready to march ever onwards."
	icon_state = "aasimarfeet"
	item_state = "aasimarfeet"
	sellprice = 20

/obj/item/clothing/shoes/roguetown/shalal
	name = "babouche"
	desc = "Leather slippers of zybantean origin."
	gender = PLURAL
	icon_state = "shalal"
	item_state = "shalal"
	sellprice = 15

	armor = ARMOR_LEATHER_BAD //Unique to a rare adventurer class
	prevent_crits = MINOR_CRITICALS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/shoes/roguetown/tribal
	name = "tribal shoes"
	desc = "Haphazardly-made slippers of creecher leather worn by primitives, or those who don't care about fashion and just want to protect their feet."
	icon_state = "tribalshoes"
	item_state = "tribalshoes"
	sellprice = 3

	armor = ARMOR_LEATHER_BAD
	prevent_crits = MINOR_CRITICALS
	max_integrity = INTEGRITY_POOR

/obj/item/clothing/shoes/roguetown/boots/armor
	name = "plated boots"
	desc = "Armored boots made from steel offering heavy protection against both melee and ranged attacks."
	body_parts_covered = FEET
	icon_state = "armorboots"
	item_state = "armorboots"
	color = null
	blocksound = PLATEHIT
	clothing_flags = CANT_SLEEP_IN
	anvilrepair = /datum/skill/craft/armorsmithing
	resistance_flags = FIRE_PROOF
	pickup_sound = "rustle"
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	break_sound = 'sound/foley/breaksound.ogg'
	sellprice = 25

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG-50 //Peripheral piece, good for 7~ halberd stabs. Minorly penetrated by halberds.

/obj/item/clothing/shoes/roguetown/boots/armor/light
	name = "light plate boots"
	icon_state = "soldierboots"
	item_state = "soldierboots"
	desc = "Lightly armored boots made from iron offering protection against both melee and ranged attacks."
	sellprice = 20

	armor_class = AC_MEDIUM
	armor = ARMOR_PLATE_BAD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STANDARD //Peripheral piece, good for 5~ halberd stabs. Will be pretty badly penetrated by polearms.

/obj/item/clothing/shoes/roguetown/boots/leather
	name = "leather boots"
	//dropshrink = 0.75
	desc = "Boots made out of sturdy leather. Providing light protection against melee attacks."
	gender = PLURAL
	icon_state = "leatherboots"
	item_state = "leatherboots"
	resistance_flags = FLAMMABLE
	sellprice = 10

	armor = ARMOR_LEATHER
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STANDARD //Slightly thicker, less durable than riding or noble boots.

/obj/item/clothing/shoes/roguetown/boots/furlinedboots
	name = "fur lined boots"
	desc = "Leather boots lined with fur."
	gender = PLURAL
	icon_state = "furlinedboots"
	item_state = "furlinedboots"
	sewrepair = TRUE

	armor = ARMOR_LEATHER
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG

/obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	name = "fur lined anklets"
	desc = "Leather anklets lined with fur, foot remains bare."
	gender = PLURAL
	icon_state = "furlinedanklets"
	item_state = "furlinedanklets"
	sewrepair = TRUE
	is_barefoot = TRUE

	armor = ARMOR_LEATHER_BAD
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_POOR



/obj/item/clothing/shoes/roguetown/boots/clothlinedanklets
	name = "cloth lined anklets"
	desc = "Cloth anklets lined with with fibers, foot remains bare."
	gender = PLURAL
	icon_state = "clothlinedanklets"
	item_state = "furlinedanklets"
	is_barefoot = TRUE
	sewrepair = TRUE

	armor = ARMOR_PADDED_BAD
	prevent_crits = MINOR_CRITICALS
	max_integrity = INTEGRITY_POOR


/obj/item/clothing/shoes/roguetown/jester
	name = "funny shoes"
	desc = "Shoes typically worn by a Jester."
	icon_state = "jestershoes"
	resistance_flags = null
	sellprice = 10

/obj/item/clothing/shoes/roguetown/grenzelhoft
	name = "grenzelhoft boots"
	icon_state = "grenzelboots"
	item_state = "grenzelboots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	sellprice = 20

	armor = ARMOR_LEATHER_GOOD
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB
	max_integrity = INTEGRITY_STRONG

/obj/item/clothing/shoes/roguetown/boots/rare
	icon = 'icons/roguetown/clothing/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleevetype = null
	resistance_flags = FIRE_PROOF // All of these are plated
	pickup_sound = "rustle"
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	break_sound = 'sound/foley/breaksound.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	clothing_flags = CANT_SLEEP_IN
	sellprice = 30

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE_GOOD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGER //Peripheral piece, still good for 8~ halberd stabs.

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate
	name = "dark elvish plated boots"
	desc = "Bizzarrely shaped boots of exquisite dark elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other race."
	icon_state = "elfshoes"
	item_state = "elfshoes"
	allowed_race = list("elf", "half-elf", "dark elf")
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	desc = "Bizzarrely shaped boots of exquisite elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other race."
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/roguetown/boots/rare/dwarfplate
	name = "decorated dwarven plate boots"
	allowed_race = list("dwarf")
	allowed_sex = list(MALE, FEMALE)
	desc = "Laced with golden bands, these dwarven plated boots glitter with glory as they are used to kick enemy's shins."
	icon_state = "dwarfshoe"
	item_state = "dwarfshoe"
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/grenzelplate
	name = "grenzelhoft \"Elvenbane\" sabatons"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	desc = "The sabatons that march to the tune of a glorious nation. It is said that the boots \
			are gilded with the tears of once native elves of the Grenzeholft lands, \
			eradicated via humen conquest." //Maybe consider getting a more serious name and description for this please.
	icon_state = "human_swordshoes"
	item_state = "human_swordshoes"
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/zybanplate
	name = "zybantean segmented plate boots"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	desc = "The segmented plate boots are a recent alteration to the Zybantu Elite, \
			many old warriors decorate their own by tieing ribbons and other knick-knacks \
			as a homage to the colorful socks they wore in simpler times."
	icon_state = "human_spearshoe"
	item_state = "human_spearshoe"
	color = null
	blocksound = PLATEHIT

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	name = "kusari tabi"
	icon_state = "kusaritabi"
	item_state = "kusaritabi"
	desc = "The riveted chainmail version of the unarmored Tabi footwear."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'

/obj/item/clothing/shoes/roguetown/boots/armor/suneate
	name = "suneate boots"
	desc = "Armored suneate made from steel offering heavy protection against both melee and ranged attacks."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "suneate"
	item_state = "suneate"

/obj/item/clothing/shoes/roguetown/boots/armor/suneate/cursed/Initialize()
	. = ..()
	name = "soulbinded suneate"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/shoes/roguetown/boots/jikatabi
	name = "jikatabi"
	desc = "A standard tabi that keeps the toes flexible and healthy, avoiding calluses of long expeditions. However, it looks rather goofy for the non-islanders."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "jikatabi"
	item_state = "jikatabi"

/obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/shoes/roguetown/boots/jikatabi/dragontabi
	name = "dragontabi"
	icon_state = "dragontabi"
	item_state = "dragontabi"
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	desc = "A tabi reinforced in dragon bones and asbestos, making it fire immune. Not very protective against physical damage, but still fairly durable."
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	max_integrity = 250
	armor_class = AC_MEDIUM
	heat_protection = LEGS|FEET
	body_parts_covered = LEGS|FEET
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/shoes/roguetown/sandals/geta
	name = "geta"
	desc = "A normal wooden geta most suitable for those who need to wander where the mud absorbs pressure."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "geta"
	item_state = "geta"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	name = "cloudhead shoes"
	desc = "A traditional shoes with distinctive upturned toe design that resembles the shape of clouds, to symbolize connection to the skies."
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	icon_state = "cloudhead_shoes"
	item_state = "cloudhead_shoes"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/kabukimono
	name = "kabuki-maru cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich yellow tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#9b874f"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/toweryakkos
	name = "tower-yakko cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich purple tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#804d97"

/obj/item/clothing/shoes/roguetown/ridingboots/gutal
	name = "leather gutal"
	desc = "The boots used by Abyssariad cavalry with upturned toes and durable, oil-boiled leather."
	icon_state = "leathergutal"
	item_state = "leathergutal"
	icon = 'icons/roguetown/kaizoku/clothingicon/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/feet.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/feet.dmi'
