/obj/item/rogueweapon/mace
	force = 20
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "iron mace"
	desc = "A heavy iron mace, prefered by those with a grudge against knightly whoresons."
	icon_state = "mace"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	max_integrity = 300
	minstr = 7
	wdefense = 2
	wbalance = -1
	sellprice = 20
	blade_dulling = DULLING_BASHCHOP

/obj/item/rogueweapon/mace/smithy
	force = 20
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "iron sledgehammer"
	desc = "A heavy iron hammer, a tool used by workers."
	icon_state = "sledge"
	smeltresult = /obj/item/ingot/iron
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "sledge"
	max_integrity = 300
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
/obj/item/rogueweapon/smithy/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/smithywar
	force = 20
	force_wielded = 30
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash, /datum/intent/mace/thrust)
	name = "steel warhammer"
	desc = "A heavy steel warhammer, a weapon designed to make knights run in fear, the best option for a common soldier against a knight."
	icon_state = "bonkhammer"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "bonkhammer"
	max_integrity = 450
	smeltresult = /obj/item/ingot/steel
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
/obj/item/rogueweapon/smithywar/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/church
	force = 25
	force_wielded = 30
	name = "bell ringer"
	desc = "Faith is sometimes best administered with steel and blood."
	icon_state = "churchmace"
	smeltresult = /obj/item/ingot/steel
	blade_dulling = DULLING_BASH
	wdefense = 3
	sellprice = 100

/obj/item/rogueweapon/mace/steel
	name = "steel mace"
	desc = "A well-crafted mace with a steel head. Easier to control and hits just as hard."
	icon_state = "smace"
	wbalance = 0
	smeltresult = /obj/item/ingot/steel
	blade_dulling = DULLING_BASH
	wdefense = 3
	sellprice = 60

/obj/item/rogueweapon/mace/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -6,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()


/datum/intent/mace/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 20
	swingdelay = 0
	icon_state = "instrike"
	misscost = 5

/datum/intent/mace/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	penfactor = 30
	damfactor = 1.1
	swingdelay = 0
	icon_state = "insmash"
	misscost = 5

/obj/item/rogueweapon/mace/woodclub
	force = 15
	force_wielded = 20
	name = "club"
	desc = "A weapon older than recorded time itself."
	icon_state = "club1"
	//dropshrink = 0.75
	wdefense = 1
	max_integrity = 120
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 0
	sellprice = 5

/obj/item/rogueweapon/mace/woodclub/New()
	..()
	icon_state = "club[rand(1,2)]"

/datum/intent/mace/strike/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = 20
	swingdelay = 0
	misscost = 5

/datum/intent/mace/smash/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')
	penfactor = 30
	swingdelay = 0
	misscost = 5

/obj/item/rogueweapon/mace/spiked
	icon_state = "spiked_club"
	max_integrity = 200
	force = 20
	force_wielded = 30

/obj/item/rogueweapon/mace/steel/morningstar
	icon_state = "morningstar"
	max_integrity = 300
	force = 20
	force_wielded = 30

/obj/item/rogueweapon/mace/cudgel
	force = 15
	force_wielded = 20
	name = "cudgel"
	icon_state = "cudgel"
	desc = "A stubby little club favored for thwacking thieves and smart-mouthed peasant folk."
	gripped_intents = null
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	smeltresult = /obj/item/ash
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 180
	wbalance = 1
	minstr = 0
	wdefense = 3
	sellprice = 15

/obj/item/rogueweapon/mace/cudgel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -8,"sy" = -7,"nx" = 10,"ny" = -7,"wx" = -1,"wy" = -8,"ex" = 1,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 91,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -3,"sy" = -4,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 70,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)

/obj/item/rogueweapon/mace/wsword
	force = 5
	force_wielded = 8
	name = "wooden sword"
	desc = "Crude wood assembled into the shape of a sword, a terrible weapon to be on the recieving end of during a training spat."
	icon_state = "wsword"
	//dropshrink = 0.75
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_integrity = 100
	minstr = 0
	wdefense = 5
	wbalance = 0
	associated_skill = /datum/skill/combat/swords
	sellprice = 5


/obj/item/rogueweapon/mace/wsword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)


/obj/item/rogueweapon/mace/goden
	force = 15
	force_wielded = 35
	possible_item_intents = list(/datum/intent/mace/heavy/strike)
	gripped_intents = list(/datum/intent/mace/heavy/smash, /datum/intent/mace/thrust)
	name = "warclub"
	desc = "A two handed club, decorated with a spiked cap crown. A perfect way to say Good Morning to any would be noble-knight."
	icon_state = "goedendag"
	icon = 'icons/roguetown/weapons/64.dmi'
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	max_integrity = 400
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wbalance = 0
	sellprice = 35

/obj/item/rogueweapon/mace/goden/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/mace/goden/steel
	name = "grand mace"
	desc = "A casted polearm, rumored to be the weapon-design used by the Forgotten God himself."
	gripped_intents = list(/datum/intent/mace/heavy/smash) // It's a 2h flanged mace, not a goedendag., added it strike intent for weaker attacks. okay removing it because hits too fast and hard.
	icon_state = "polemace"
	resistance_flags = FIRE_PROOF
	smeltresult = /obj/item/ingot/steel
	max_integrity = 500
	force = 15
	force_wielded = 35
	slowdown = 1
	wbalance = -1
	sellprice = 60

/obj/item/rogueweapon/mace/goden/steel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -8,"sy" = 6,"nx" = 8,"ny" = 6,"wx" = -5,"wy" = 6,"ex" = 0,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)

/datum/intent/mace/heavy/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 30
	swingdelay = 2
	icon_state = "instrike"
	misscost = 15

/datum/intent/mace/heavy/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	penfactor = 50
	damfactor = 1.2
	chargetime = 3
	swingdelay = 3
	icon_state = "insmash"
	misscost = 30
	warnie = "mobwarning"

// For the Goedendag. If it applies to the grand mace, use this one instead.
/datum/intent/mace/thrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 40
	swingdelay = 1
	misscost = 15

// Copper Bludgeon

/obj/item/rogueweapon/mace/copperbludgeon
	force = 12
	force_wielded = 18
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "copper bludgeon"
	desc = "An extremely crude weapon for cruder bastards."
	icon_state = "cbludgeon"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/axesmaces
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	max_integrity = 80
	minstr = 5
	wdefense = 1
	smeltresult = /obj/item/ingot/copper
	blade_dulling = DULLING_BASHCHOP
	smeltresult = /obj/item/ingot/copper
	sellprice = 10

// Copper War-Mace
/obj/item/rogueweapon/mace/coppermace
	force = 15
	force_wielded = 20
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "copper mace"
	desc = "Simple and indelicate lover of skulls."
	icon_state = "cclub"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/axesmaces
	gripped_intents = list(/datum/intent/mace/strike,/datum/intent/mace/smash)
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	max_integrity = 140
	smeltresult = /obj/item/ingot/copper
	minstr = 6
	wdefense = 2
	blade_dulling = DULLING_BASHCHOP
	smeltresult = /obj/item/ingot/copper
	sellprice = 10

/obj/item/rogueweapon/mace/coppermace/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -8,"sy" = 6,"nx" = 8,"ny" = 6,"wx" = -5,"wy" = 6,"ex" = 0,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)

/datum/intent/mace/smash/warhamm
	reach = 2

// Unique longbeard hammer.
/obj/item/rogueweapon/mace/warhammer
	force = 10
	force_wielded = 25//this gets a slight buff since it was weaker than an iron mace...
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/heavy/strike, /datum/intent/mace/heavy/smash)//adding it strike intent since it didn't had one in first place?
	name = "warhammer"
	desc = "A great dwarven warhammer made of stern steel, enscratched with oaths of battle and time."
	icon_state = "warhammer"
	icon = 'icons/roguetown/weapons/64.dmi'
	//dropshrink = 0.75
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ingot/steel
	swingsound = BLUNTWOOSH_HUGE
	max_integrity = 500
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	sellprice = 100

/obj/item/rogueweapon/mace/warhammer/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//Copper and Bronze Weapons
/obj/item/rogueweapon/mace/goden/copper
	force = 12
	force_wielded = 20
	possible_item_intents = list(/datum/intent/mace/heavy/strike)
	gripped_intents = list(/datum/intent/mace/heavy/smash, /datum/intent/mace/thrust)
	name = "copper warclub"
	desc = "A two handed club, decorated with a crown of spikes. A barbaric besign, good enough to be used as a weapon."
	icon_state = "coppergoden"
	icon = 'icons/roguetown/weapons/64.dmi'
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	max_integrity = 100
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wbalance = 0
	sellprice = 35

/obj/item/rogueweapon/mace/bronze
	force = 14
	force_wielded = 20//fair for antag lizardmen weaponry
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "bronze mace"
	desc ="An extremely crude bronze weapon, most effective at killing enemies clad in equally crude armor."
	icon_state = "bmace"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/axesmaces
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	max_integrity = 100
	minstr = 5
	wdefense = 1
	smeltresult = /obj/item/ingot/bronze
	blade_dulling = DULLING_BASHCHOP
	smeltresult = /obj/item/ingot/bronze
	sellprice = 25

/obj/item/rogueweapon/mace/goden/bronze
	force = 14
	force_wielded = 28
	possible_item_intents = list(/datum/intent/mace/heavy/strike)
	gripped_intents = list(/datum/intent/mace/heavy/smash, /datum/intent/mace/thrust)
	name = "bronze warclub"
	desc = "A two handed club, decorated with a spiked sharpened flange head. An antique design good enough to continue being used as a weapon against armored enemies."
	icon_state = "bigbronze"
	icon = 'icons/roguetown/weapons/64.dmi'
	//dropshrink = 0.75
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	max_integrity = 300
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wbalance = 0
	sellprice = 35

/obj/item/rogueweapon/mace/goden/bronze/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
