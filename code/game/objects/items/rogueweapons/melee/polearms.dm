/* POLEARMS
==========================================================*/

/obj/item/rogueweapon/polearm
	throwforce = DAMAGE_STAFF
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_blade_int = 100
	max_integrity = INTEGRITY_STANDARD
	minstr = 8
	smeltresult = /obj/item/ash
	associated_skill = /datum/skill/combat/polearms
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	dropshrink = 0.8
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = GREAT_PARRY
	thrown_bclass = BCLASS_STAB
	sellprice = 20

/obj/item/rogueweapon/polearm/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/*--------------\
| Thrust intent |
\--------------*/
/datum/intent/polearm/thrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = AP_POLEARM_THRUST
	swingdelay = 1
	misscost = 10

/datum/intent/polearm/thrust/poke
	name = "poke"
	penfactor = AP_SPEAR_POKE
	chargetime = 0
	misscost = 7

/datum/intent/polearm/thrust/spear
	penfactor = AP_POLEARM_THRUST-10

/*------------\
| Bash intent |
\------------*/
/datum/intent/polearm/bash
	name = "bash"
	blade_class = BCLASS_BLUNT
	icon_state = "inbash"
	attack_verb = list("bashes", "strikes")
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = AP_POLEARM_BASH
	damfactor = 0.8 //Bashing with a weapon not meant for it.
	swingdelay = 1
	misscost = 5

/*-------------\
| Swing intent |
\-------------*/
/datum/intent/polearm/bash/swing//AYAYAYAYA BONK BONK BONK
	name = "swing"
	attack_verb = list("bashes", "strikes", "swings")
	penfactor = AP_CLUB_STRIKE //30 combined AP, for reference an iron maille is 50 armor.
	damfactor = 1 //Full-power, charged 2-range swings. The gimmick intent of quarterstaffs.
	reach = 2
	chargetime = 1

/*-----------\
| Cut intent |
\-----------*/
/datum/intent/polearm/cut
	name = "cut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	icon_state = "incut"
	damfactor = 0.8
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	reach = 2
	swingdelay = 1
	misscost = 10

/*------------\
| Chop intent |
\------------*/
/datum/intent/polearm/chop
	name = "chop"
	icon_state = "inchop"
	attack_verb = list("chops", "hacks")
	animname = "chop"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = AP_POLEARM_CHOP
	chargetime = 1.5
	damfactor = 1.2
	swingdelay = 2
	misscost = 20
	warnie = "mobwarning"

/*-----------\
| Mancatching |
\-----------*/

/datum/intent/polearm/thrust/mancatcher //giving it pain, because it having a 'struggle system' to endure stun was a bit too much.
	name = "grabbing thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "grab"
	icon_state = "ingrab"
	reach = 2
	chargetime = 10
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	damfactor = 0.5
	candodge = FALSE
	penfactor = 100
	swingdelay = 1
	misscost = 10

//................ Wooden Staff ............... //
/obj/item/rogueweapon/polearm/woodstaff
	force =  DAMAGE_STAFF
	force_wielded =  DAMAGE_STAFF_WIELD-3 //20 damage, at the threshold where 9 strenght makes it significantly worse.
	possible_item_intents = list(POLEARM_BASH)
	gripped_intents = list(POLEARM_BASH, /datum/intent/mace/smash/wood)
	name = "wooden staff"
	desc = "The ultimate tool of travel for weary wanderers, support your weight or crack the heads that don't support you."
	icon_state = "woodstaff"
	wlength = WLENGTH_LONG
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_BLUNT
	max_integrity = 200
	wdefense = ULTMATE_PARRY
	minstr = 6
	sellprice = 5

/obj/item/rogueweapon/polearm/woodstaff/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//................ Quarterstaff ............... //!
/obj/item/rogueweapon/polearm/woodstaff/quarterstaff
	force_wielded =  DAMAGE_STAFF_WIELD
	gripped_intents = list(POLEARM_SWING, POLEARM_BASH, /datum/intent/mace/smash/wood)
	name = "wooden quarterstaff"
	desc = "A staff that makes any journey easier. Durable and swift, capable of bludgeoning stray volves and ruffians alike."
	icon_state = "quarterstaff"
	max_integrity = INTEGRITY_STRONG
	sellprice = 10


//................ Iron-shod Staff ............... //
/obj/item/rogueweapon/polearm/woodstaff/quarterstaff/iron
	force_wielded =  DAMAGE_STAFF_WIELD+1
	name = "iron quarterstaff"
	desc = "A perfect tool for bounty hunters who prefer their prisoners broken and bruised but not slain. This reinforced staff is capable of clubbing even an armed opponent into submission with some carefully placed strikes."
	icon_state = "ironstaff"
	minstr = 7
	max_integrity = INTEGRITY_STRONG

/obj/item/rogueweapon/polearm/woodstaff/quarterstaff/steel
	force_wielded =  DAMAGE_STAFF_WIELD+2 //25 damage. Still a bit gimmicky of a weapon.
	name = "steel quarterstaff"
	desc = "An unusual sight, a knightly combat staff made out of worked steel and reinforced wood. It is a heavy and powerful weapon, more than capable of beating the living daylights out of any brigand."
	icon_state = "steelstaff"
	minstr = 7
	max_integrity = INTEGRITY_STRONGEST

//................ Staff of the Testimonium ............... //
/obj/item/rogueweapon/polearm/woodstaff/aries
	force_wielded =  DAMAGE_STAFF_WIELD
	name = "staff of the testimonium"
	desc = "A symbolic staff, granted to graduating acolyte's who have achieved and bear witnessed to the miracles of the Gods."
	icon_state = "aries"
	resistance_flags = FIRE_PROOF // Leniency for unique items
	dropshrink = 0.6
	sellprice = 100


//................ Spear ............... //
/obj/item/rogueweapon/polearm/spear
	force = DAMAGE_SPEAR
	force_wielded = DAMAGE_SPEAR_WIELD
	throwforce = DAMAGE_SPEAR_WIELD
	possible_item_intents = list(SPEAR_POKE, POLEARM_BASH)
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, SPEAR_POKE, POLEARM_BASH)
	name = "spear"
	desc = "The humble spear, use the pointy end."
	icon_state = "spear"
	slot_flags = ITEM_SLOT_BACK
	max_blade_int = 100
	smeltresult = /obj/item/ingot/iron
	dropshrink = 0.8
	thrown_bclass = BCLASS_STAB
	sellprice = 20

/obj/item/rogueweapon/polearm/spear/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

//................ Billhook ............... //
/obj/item/rogueweapon/polearm/spear/billhook
	force_wielded = DAMAGE_SPEAR_WIELD+3 //28 damage VS the halberd's 35. Just a little extra something, in addition to the proper polearm thrust.
	throwforce = DAMAGE_SPEAR //Unbalanced for throwing.
	name = "billhook"
	desc = "A polearm with a curved krag, a Valorian design for dismounting mounted warriors and to strike down monstrous beasts."
	icon_state = "billhook"
	possible_item_intents = list(POLEARM_THRUST, POLEARM_BASH)
	gripped_intents = list(POLEARM_THRUST, SPEAR_CUT, /datum/intent/polearm/chop, POLEARM_BASH)
	resistance_flags = FIRE_PROOF
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	max_blade_int = 100
	smeltresult = /obj/item/ingot/steel
	max_integrity = INTEGRITY_STRONG
	wdefense = ULTMATE_PARRY
	wbalance = EASY_TO_DODGE
	sellprice = 60


//................ Stone Short Spear ............... //		- Short spears got shorter reach and worse wield effect, made for one handed and throwing
/obj/item/rogueweapon/polearm/spear/stone
	force = DAMAGE_SPEAR
	force_wielded = DAMAGE_SPEAR+2
	throwforce = DAMAGE_SPEAR
	name = "simple spear"
	desc = "With this weapon, the tribes of humenity became the chosen people of the Forgotten God."
	icon_state = "stonespear"
	minstr = 6
	max_blade_int = 50
	smeltresult = /obj/item/ash
	dropshrink = 0.7
	wlength = WLENGTH_LONG
	wdefense = AVERAGE_PARRY
	max_integrity = INTEGRITY_WORST
	sellprice = 5

//................ Javelin ............... //
/obj/item/rogueweapon/polearm/spear/stone/copper
	throwforce = DAMAGE_SPEAR_WIELD
	name = "javelin"
	desc = "Made for throwing, long out of favor and using inferior metals, it still can kill when the aim is true."
	icon_state = "cspear"
	max_blade_int = 70
	max_integrity = INTEGRITY_POOR
	minstr = 7
	smeltresult = /obj/item/ingot/copper
	dropshrink = 0.9
	sellprice = 15

/obj/item/rogueweapon/polearm/spear/stone/copper/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)


//................ Halberd ............... //
/obj/item/rogueweapon/polearm/halberd
	force = DAMAGE_SPEAR
	force_wielded = DAMAGE_HALBERD_WIELD
	possible_item_intents = list(POLEARM_THRUST, POLEARM_BASH)
	gripped_intents = list(POLEARM_THRUST, SPEAR_CUT, /datum/intent/polearm/chop, POLEARM_BASH)
	name = "halberd"
	desc = "A reinforced polearm for clobbering ordained with a crested ax head, pick and sharp point, a royal arm for defence and aggression."
	icon_state = "halberd"
	slot_flags = FALSE
	max_blade_int = 300
	max_integrity = INTEGRITY_STRONGEST
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	smeltresult = /obj/item/ingot/steel
	dropshrink = 0.8
	wdefense = ULTMATE_PARRY
	wbalance = EASY_TO_DODGE
	sellprice = 90

/obj/item/rogueweapon/polearm/halberd/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


//................ Bardiche ............... //
/obj/item/rogueweapon/polearm/halberd/bardiche
	force = DAMAGE_AXE
	force_wielded = DAMAGE_HEAVYAXE_WIELD
	possible_item_intents = list(/datum/intent/axe/cut)
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop/great, /datum/intent/axe/thrust)
	name = "bardiche"
	desc = "A grand axe of northernly design, renowned for easily chopping off limbs clean with brutal strength."
	icon_state = "bardiche"
	smeltresult = /obj/item/ingot/iron
	swingsound = BLADEWOOSH_MED
	wbalance = VERY_EASY_TO_DODGE
	max_blade_int = 200
	max_integrity = INTEGRITY_STRONG
	dropshrink = 0.95
	minstr = 10
	wdefense = AVERAGE_PARRY
	axe_cut = 10
	sellprice = 30

//................ Eagle Beak ............... //
/obj/item/rogueweapon/polearm/eaglebeak
	force = DAMAGE_SPEAR
	force_wielded = DAMAGE_SPEAR_WIELD+3 //Same as billhook. Worse damage than a dedicated two-handed mace, added flexibility.
	possible_item_intents = list(POLEARM_BASH, /datum/intent/polearm/chop)
	gripped_intents = list(POLEARM_BASH, POLEARM_THRUST, /datum/intent/mace/smash/heavy,/datum/intent/polearm/chop)
	name = "eagle's beak"
	desc = "A reinforced pole affixed with an ornate steel eagle's head, of which it's beak is intended to pierce with great harm."
	icon_state = "eaglebeak"
	slot_flags = ITEM_SLOT_BACK
	minstr = 11
	smeltresult = /obj/item/ingot/steel
	max_blade_int = 300
	max_integrity = INTEGRITY_STRONGEST
	dropshrink = 0.8
	wbalance = EASY_TO_DODGE
	sellprice = 60

/obj/item/rogueweapon/polearm/eaglebeak/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -8,"sy" = 6,"nx" = 8,"ny" = 6,"wx" = -5,"wy" = 6,"ex" = 0,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//................ Lucerne Hammer ............... //
/obj/item/rogueweapon/polearm/eaglebeak/lucerne
	name = "lucerne"
	desc = "A polehammer of simple iron, fracture bone and dissent with simple brute force."
	icon_state = "polehammer"
	smeltresult = /obj/item/ingot/iron
	max_integrity = INTEGRITY_STRONG
	sellprice = 40
	wbalance = VERY_EASY_TO_DODGE
	wdefense = AVERAGE_PARRY

//................ Hoplite Spear ............... //
/obj/item/rogueweapon/polearm/spear/hoplite
	force = DAMAGE_SPEARPLUS
	name = "ancient spear"
	desc = "A humble spear with a bronze head, a rare survivor from the battles long past that nearly destroyed Grimoria."
	icon_state = "bronzespear"
	max_blade_int = 300
	max_integrity = INTEGRITY_STRONG
	smeltresult = /obj/item/ash
	sellprice = 120 // A noble collector would love to get his/her hands on one of these spears

/obj/item/rogueweapon/polearm/spear/hoplite/winged // Winged version has +1 weapon defence and sells for a bit more, but is identical otherwise
	name = "ancient winged spear"
	desc = "A spear with a winged bronze head, a rare survivor from the battles long past that nearly destroyed Grimoria."
	icon_state = "bronzespear_winged"
	wdefense = ULTMATE_PARRY
	sellprice = 150 // A noble collector would love to get his/her hands on one of these spears




//scythe
/obj/item/rogueweapon/sickle/scythe
	force = 12
	force_wielded = 25 //The only intent on this thing has a 0.8 damage factor, so 20 damage in practice. Worth noting the intent has no AP attached either.
	possible_item_intents = list(SPEAR_CUT) //truly just a long knife
	gripped_intents = list(SPEAR_CUT)
	name = "scythe"
	desc = "A humble farming tool with long reach, traditionally used to cut grass or wheat."
	icon_state = "scythe"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_blade_int = 100
	max_integrity = 300
	minstr = 5
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	dropshrink = 0.75
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 2
	thrown_bclass = BCLASS_CUT
	throwforce = 25
	sellprice = 10

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/rogueweapon/polearm/mancatcher
	force = 10
	force_wielded = 20
	possible_item_intents = list(POLEARM_BASH)
	gripped_intents = list(POLEARM_BASH,MANCATCHER)
	name = "sasumata"
	desc = "A unique polearm featuring a spring-action pincer on the end, lined with spikes designed to cause extreme pain, rather than extreme injury. Referred to as a man-catcher in the Humen tongue due to coastal kidnappings performed by abyssariad Wokous."
	icon_state = "sasumata"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	max_blade_int = 120
	max_integrity = 200
	wdefense = 5
	bigboy = TRUE
	gripsprite = TRUE
	associated_skill = /datum/skill/combat/polearms
	walking_stick = TRUE
	embedding = list(
		"embed_chance" = 75,
		"embedded_pain_multiplier" = 10,
		"embedded_fall_chance" = 0,
	)

/obj/item/rogueweapon/polearm/spear/yari
	name = "su yari"
	desc = "A long, straight-headed spear of Abyssariad design, often used by sea raiders to fend off light cavalry on in-land offensives. Well know for the 'Yari wall' strategy and for being 'Yarimazing' among Abyssariads."
	icon_state = "suyari"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	smeltresult = /obj/item/ingot/iron
	dropshrink = 0.8
	blade_dulling = DULLING_BASHCHOP

/obj/item/rogueweapon/polearm/spear/yari/katakama
	name = "katakama yari"
	desc = "An evolution of the su yari, recognizable for a single scythe-like tang perpendicular to the main point that allows for better defense against the likes of naginata."
	icon_state = "katakamayari"
	wdefense = 5
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 150
	max_integrity = 400

/obj/item/rogueweapon/polearm/spear/billhook/jumonji
	name = "jumonji yari"
	desc = "The design of the katakama yari taken to its logical conclusion, the jumonji yari features an elongated tang on each side that is the same length as the forward point. There is no polearms that offers better defense without harming efficiency."
	icon_state = "jumonjiyari"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'

/obj/item/rogueweapon/polearm/halberd/bardiche/naginata
	name = "naginata"
	desc = "Its earliest form being a tachi blade mounted upon a long wooden pole, the naginata was the first polearm to come into widespread use by the Abyssariad, who developed the weapon in order to better combat Humen and Elven cavalry."
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	icon_state = "naginata"
	dropshrink = 0.8

/obj/item/rogueweapon/polearm/halberd/bardiche/naginata/dustcurse/dropped()
	. = ..()
	name = "Dustcurse naginata"
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/polearm/halberd/bardiche/naginata/tsukushi //make two instead of only one
	name = "tsukushi naginata"
	desc = "A cheaper, easier to construct iron Naginata with a blade held by its guard instead of its tang. Likely developed from a scythe, the blade is easily found on poor, wandering monks."
	force_wielded = DAMAGE_SPEAR_WIELD+3
	icon_state = "surplusnaginata"
	smeltresult = /obj/item/ingot/iron
	dropshrink = 0.8
	wdefense = 4
	slot_flags = ITEM_SLOT_BACK

/obj/item/rogueweapon/polearm/halberd/bisento //Giving the Bisento storeable 'back' because, otherwise, people will SUFFER spawning with it. Too bugged for my taste.
	name = "bisento"
	desc = "The Bisento is the direct evolution of the old, outdated Champion Guandao. Akin to a large cleaver or a broad axe."
	icon_state = "bisento"
	dropshrink = 0.8
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'

/obj/item/rogueweapon/polearm/halberd/bisento/dustcurse/dropped()
	. = ..()
	name = "Dustcurse bisento"
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/polearm/spear/stone/obsidian //direct upgrade to the stone one.
	force = DAMAGE_SPEAR+2
	force_wielded = DAMAGE_SPEAR+4
	throwforce = DAMAGE_SPEAR
	name = "obsidian spear"
	desc = "A spear with a surprisingly sharp edge from vulcanic glass. Used by Undine tribes."
	icon_state = "obsidian_spear"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	smeltresult = /obj/item/ash
	max_blade_int = 100

/obj/item/rogueweapon/polearm/woodstaff/quarterstaff/bostaff
	name = "bo staff"
	desc = "the bo, or 'abyssariad quarterstaff', is a simple weapon used in martial arts to entrap, strike and sweep the enemy."
	icon_state = "bostaff"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	bigboy = TRUE

/obj/item/rogueweapon/polearm/firelance
	name = "sanctiflux firelance"
	desc = "The new iteration of the ancient abyssariad 'Widowmaker', the harbinger of purification against zizodemons, tieflings and grezenhoft. \
	Used safely by the hundred thousand march, by hands whom holds purifying intentions from the abyss." //Hundred thousand march is the definition of champions. But after bloody apotheosis, its just anyone islander-cultured.
	icon = 'icons/roguetown/kaizoku/weapons/firelance.dmi'
	icon_state = "firelance"
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	can_parry = TRUE
	wlength = WLENGTH_GREAT
	bigboy = TRUE
	gripsprite = FALSE
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_integrity = INTEGRITY_STANDARD
	minstr = 8
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	dropshrink = 0.8
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wlength = WLENGTH_LONG
	sharpness = IS_BLUNT
	minstr = 8
	sellprice = 400

	var/cocked = FALSE
	var/lit = FALSE
	var/range = 5
	var/fuel_source = FALSE
	var/fuze = 30

/obj/item/rogueweapon/polearm/firelance/proc/ignite(mob/living/user)
	if(lit)
		to_chat(user.loc, "<span class='warning'>The Firelance's fuse is already ignited and fierce as a bull.</span>")
		return

	if(!fuel_source)
		to_chat(user.loc, "<span class='warning'>You cannot burn your enemies without a gourd with sanctiflux.</span>")
		return

	to_chat(src.loc, "<span class='info'>The firelance's fuze starts to rebel in sparking lights.</span>")
	playsound(src.loc, 'sound/music/kaizoku/spells/firelance_cooking.ogg', 100)
	lit = TRUE
	spawn(20) // 2 seconds
		if(lit)
			to_chat(src.loc, "<span class='warning'>The fuze reaches the composite, building deadly pressure.</span>")
	spawn(40) // 4 seconds
		if(lit)
			to_chat(src.loc, "<span class='danger'>The Firelance is about to release purifying death!</span>")
	spawn(60) // 6 seconds
		if(lit)
			flamefire(user)
			fuel_source = FALSE
			lit = FALSE
			update_icon()

/obj/item/rogueweapon/polearm/firelance/proc/flamefire(mob/living/user)
	if(!user)
		return

	var/turf/start = get_turf(user) 	// VERY important. It determine user's position and firing direction. May remove it for handmade fuels.
	if(!start)
		return

	var/delta_x = 0
	var/delta_y = 0
	switch(user.dir)
		if(NORTH) delta_y = 1
		if(EAST) delta_x = 1
		if(SOUTH) delta_y = -1
		if(WEST) delta_x = -1

	for(var/distance in 1 to range) // This fire pattern widens every second tile. This will be the Abyssariad/Heartfelt 'military' standard.
		var/width = distance / 2 // Calculate when it widens
		for(var/offset in -width to width) // Control the width itself
			var/turf/current_turf
			if(delta_x) // Horizontal spread
				current_turf = locate(start.x + (delta_x * distance), start.y + offset, start.z)
			else if(delta_y) // Vertical spread
				current_turf = locate(start.x + offset, start.y + (delta_y * distance), start.z)

			if(current_turf)
				// Ignite the tile
				new /obj/effect/oilspill(current_turf)
				current_turf.hotspot_expose(500, 30, 1)

				for(var/mob/living/L in current_turf.contents)
					if(iscarbon(L) && L != user)
						L.visible_message("<span class='danger'>[L] is engulfed in flames!</span>")
						L.adjustFireLoss(rand(10, 20)) //Enough damage to ensure the player will move away.
	playsound(src.loc, 'sound/music/kaizoku/spells/firelance.ogg', 100)
	cocked = FALSE
	fuel_source = FALSE // Consume  fuel after use
	update_icon()

/obj/item/rogueweapon/polearm/firelance/dropped(mob/living/user)
	. = ..()
	if(fuel_source)
		if(HAS_TRAIT(user, TRAIT_KAIZOKU))
			to_chat(src, "<span class='info'>[user] lowered the [usr] with care, sensing the potential calamity bound within, aware of the cost from underestimating it.</span>")
			return
		else
			to_chat(src, "<span class='info'>[user] dropped the [usr] with its gourd's cap unsealed, hissing quietly, as it tells the tales of widowmaking by doing the obvious.</span>")
			user.adjust_fire_stacks(3)
			user.IgniteMob()
			flamefire(user)

/obj/item/rogueweapon/polearm/firelance/attack_self(mob/living/user)
	if(lit) // safeguard
		return
	else
		if(cocked && !fuel_source)
			to_chat(user, "<span class='info'>You open the blades, making it suitable for use. It only requires a gourd filled with fuel.</span>")
			cocked = FALSE
			update_icon()
			return

		if(!cocked && !fuel_source)
			if(HAS_TRAIT(user, TRAIT_KAIZOKU))
				to_chat(user, "<span class='info'>You triggered the mechanism under the blades even without a gourd. No internal repair is needed.</span>")
				cocked = TRUE
				update_icon()
				return
			else
				var/obj/item/bodypart/limb
				var/list/limb_list = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM)
				for(var/zone in limb_list)
					limb = user.get_bodypart(zone)
					if(limb)
						playsound(src,'sound/misc/guillotine.ogg', rand(30,60), TRUE)
						to_chat(user, "<span class='danger'>Without a gourd, [user]'s [limb] was accidentally snatched by jagged blades, bleeding before being severed!</span>")
						limb.dismember()
						qdel(limb)
						user.emote("scream")
						cocked = TRUE
						update_icon()
						return

		if(!cocked && fuel_source)
			to_chat(user, "<span class='info'>You start spinning the mechanisms, watching the jagged blades close. The weapon is now ready, but it needs to be lit.</span>")
			if(do_after(user, 60 - user.STASTR, target = user))
				playsound(user, 'sound/combat/Ranged/crossbow_medium_reload-01.ogg', 100, FALSE)
				cocked = TRUE
				update_icon()
			return
		else
			to_chat(user, "<span class='warning'>Fuel spills due to misuse, rendering the weapon unprepared.</span>")
			cocked = FALSE
			fuel_source = FALSE
			update_icon()

/obj/item/rogueweapon/polearm/firelance/attackby(obj/item/I, mob/living/user)
	if(!istype(I, /obj/item/sanctiflux))
		to_chat(user, "<span class='warning'>[I] is not a valid fuel source!</span>")
		return
	else
		if(fuel_source) // If it already has a fuel source, you can't insert a new one.
			to_chat(user, "<span class='warning'>The firelance already has a gourd on.</span>")
			return
		if(cocked)
			to_chat(user, "<span class='warning'>I shoved the gourd against the steel blades, almost cracking it. I cannot put the gourd inside if the blades are on the way.</span>")
			return
		if(!cocked)
			fuel_source = TRUE
			update_icon()
			qdel(I)
			to_chat(user, "<span class='info'>I press the gourd against the insertion hole. I just need to adjust the mechanisms so the automata within do the rest of the job.</span>")
			..()

/obj/item/rogueweapon/polearm/firelance/spark_act()
	ignite(usr)

/obj/item/rogueweapon/polearm/firelance/fire_act()
	ignite(usr)

/obj/item/rogueweapon/polearm/firelance/update_icon()
	if(lit)
		icon_state = "firelance_lit"
	else
		if(!cocked)
			if(fuel_source)
				icon_state = "firelance_oil"
			else
				icon_state = "firelance"
		else
			if(fuel_source)
				icon_state = "firelance_cocked_oil"
			else
				icon_state = "firelance_cocked"

/obj/item/sanctiflux
	name = "sanctiflux gourd"
	desc = "The abyssariad answer to demonic corruption, purger of zizo and men, malum's essence in sanctifying form to branch with abyssal valors. An Abyssariad secret from Fog Islands."
	icon = 'icons/roguetown/kaizoku/weapons/items.dmi'
	icon_state = "gourd"

/obj/effect/oilspill
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/roguetown/kaizoku/tileset/fire.dmi'
	icon_state = "newfire"
	layer = GASFIRE_LAYER

	var/life = 120 // Lifespan of the fire in ticks. May decrease later, but I prefer to keep its area-denial use.

/obj/effect/oilspill/Initialize()
	. = ..()
	setDir(pick(GLOB.cardinals))
	START_PROCESSING(SSfastprocess, src)
	return

/obj/effect/oilspill/process()
	for(var/mob/living/carbon/human/H in view(2, src)) 	// Sate pyromaniac addiction. I don't even know if that thing works, but anyway.
		if(H.has_flaw(/datum/charflaw/addiction/pyromaniac))
			H.sate_addiction()
	life--
	if(life <= 0)
		qdel(src)
		return

/obj/effect/oilspill/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	set_light(0)
	return ..()

/obj/effect/oilspill/Crossed(atom/movable/AM, oldLoc)
	..()
	if(isliving(AM))
		var/mob/living/L = AM
		L.fire_act(20, 40)


/*
			This is for later, for when I make different types of oilfuel, all of abyssariad or heartfelt making. Possibly the handmade alternative.
	//This following code spreads the fire in a linear pattern, the first one I made.
	for(var/distance in 1 to range)
		var/turf/current_turf = locate(start.x + (delta_x * distance), start.y + (delta_y * distance), start.z)
		if(!current_turf || current_turf.density) // Stop if obstructed
			break
	// This following code spreads the fire in a triangle pattern.
	for(var/distance in 1 to range)
		for(var/offset in -distance to distance)
			var/turf/current_turf
			if(delta_x) // Horizontal spread (EAST/WEST)
				current_turf = locate(start.x + (delta_x * distance), start.y + offset, start.z)
			else if(delta_y) // Vertical spread (NORTH/SOUTH)
				current_turf = locate(start.x + offset, start.y + (delta_y * distance), start.z)
	//This following code preads the fire in diagonal around the player.
	var/list/diagonal_directions = list(
		list(1, 1),  // NORTHEAST
		list(1, -1), // SOUTHEAST
		list(-1, -1),// SOUTHWEST
		list(-1, 1)  // NORTHWEST
	)
	// Loop through each diagonal direction
	for(var/dir_offset in diagonal_directions)
		var/delta_x = dir_offset[1]
		var/delta_y = dir_offset[2]
		// Generate the fire pattern for the given direction
		for(var/distance in 1 to range)
			var/turf/current_turf = locate(start.x + (delta_x * distance), start.y + (delta_y * distance), start.z)
*/
