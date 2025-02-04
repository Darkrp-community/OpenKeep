/* BLUNT - low-ish damage, limited defense, good AP
==========================================================*/
//................ Mace ............... //
/obj/item/rogueweapon/mace
	force = DAMAGE_MACE
	force_wielded = DAMAGE_MACE_WIELD
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "iron mace"
	desc = "A heavy iron mace, prefered by those with a grudge against knightly whoresons."
	icon_state = "mace"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "mace_greyscale"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	equip_sound = "rustle"
	sharpness = IS_BLUNT
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ingot/iron
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED
	max_integrity = 300
	minstr = 7
	wdefense = AVERAGE_PARRY
	wbalance = EASY_TO_DODGE
	sellprice = 20
	blade_dulling = DULLING_BASHCHOP

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

/*--------------\
| Strike intent |	moderate AP
\--------------*/
/datum/intent/mace/strike
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = AP_CLUB_STRIKE
	swingdelay = 0
	icon_state = "instrike"
	misscost = 5

/datum/intent/mace/strike/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')

/datum/intent/mace/strike/heavy
	penfactor = AP_CLUB_STRIKE+10
	swingdelay = 2
	icon_state = "instrike"
	misscost = 12


/*--------------\
| Smash intent |	10% force increase and moderate+ AP, has slightly higher penalties
\--------------*/
/datum/intent/mace/smash
	name = "smash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	penfactor = AP_CLUB_SMASH
	damfactor = 1.1
	swingdelay = 0
	icon_state = "insmash"
	misscost = 5

/datum/intent/mace/smash/wood
	hitsound = list('sound/combat/hits/blunt/woodblunt (1).ogg', 'sound/combat/hits/blunt/woodblunt (2).ogg')

/datum/intent/mace/smash/heavy
	penfactor = AP_HEAVY_SMASH
	damfactor = 1.2
	chargetime = 3
	swingdelay = 3
	misscost = 22
	warnie = "mobwarning"


/*--------------\
| Thrust intent |	Godendag stab
\--------------*/
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


//................ Bell ringer ............... //
/obj/item/rogueweapon/mace/church
	force = DAMAGE_MACE+3
	force_wielded = DAMAGE_MACE_WIELD+3
	name = "bell ringer"
	desc = "Faith is sometimes best administered with steel and blood."
	icon_state = "churchmace"
	smeltresult = /obj/item/ingot/steel
	blade_dulling = DULLING_BASH
	sellprice = 100
	wdefense = GOOD_PARRY


//................ Steel mace ............... //	Better wbalance and wdefense
/obj/item/rogueweapon/mace/steel
	name = "steel mace"
	desc = "A well-crafted mace with a steel head. Easier to control and hits just as hard."
	icon_state = "smace"
	blade_dulling = DULLING_BASH
	smeltresult = /obj/item/ingot/steel
	wbalance = DODGE_CHANCE_NORMAL
	sellprice = 60
	wdefense = GOOD_PARRY


//................ Spiked club ............... //
/obj/item/rogueweapon/mace/spiked
	force = DAMAGE_MACE+2
	force_wielded = DAMAGE_MACE_WIELD+3
	name = "spiked mace"
	icon_state = "spikedmace"
	max_integrity = 200


//................ Morningstar ............... //
/obj/item/rogueweapon/mace/steel/morningstar
	force = DAMAGE_MACE+2
	force_wielded = DAMAGE_MACE_WIELD+3
	name = "morningstar"
	icon_state = "spiked_club_old"
	max_integrity = 300


//................ Club ............... //
/obj/item/rogueweapon/mace/woodclub
	force = DAMAGE_CLUB
	force_wielded = DAMAGE_CLUB_WIELD
	name = "club"
	desc = "A weapon older than recorded time itself."
	icon_state = "club1"
	max_integrity = 120
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 2
	sellprice = 5
	wdefense = MEDIOCRE_PARRY

/obj/item/rogueweapon/mace/woodclub/Initialize(mapload)
	. = ..()
	if(icon_state == "club1")
		icon_state = "club[rand(1,2)]"

//................ Rolling Pin ............... //
/obj/item/rogueweapon/mace/woodclub/rollingpin
	name = "rolling pin"
	desc = "For rolling dough or teaching beggars who steal a lesson."
	icon = 'modular/Neu_Food/icons/cooking.dmi'
	icon_state = "rolling_pin"
	item_state = "rolling_pin"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE

//................ Cudgel ............... //
/obj/item/rogueweapon/mace/cudgel
	force = DAMAGE_CLUB
	force_wielded = DAMAGE_CLUB_WIELD
	name = "cudgel"
	icon_state = "cudgel"
	desc = "A stubby little club favored for thwacking thieves and smart-mouthed peasant folk."
	gripped_intents = null
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	smeltresult = /obj/item/ash
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 180
	minstr = 2
	wbalance = HARD_TO_DODGE
	sellprice = 15
	wdefense = MEDIOCRE_PARRY

/obj/item/rogueweapon/mace/cudgel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -8,"sy" = -7,"nx" = 10,"ny" = -7,"wx" = -1,"wy" = -8,"ex" = 1,"ey" = -7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 91,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -3,"sy" = -4,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 70,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)

//................ Alt cudgel ............... //
/obj/item/rogueweapon/mace/cudgel/carpenter
	name = "peasant cudgel"
	icon_state = "carpentercudgel"
	desc = "A stubby club reinforced with iron bits, popular among village watchmen and peasant militias. Despite being reinforced and hard-hitting, it still cannot compare to a proper mace."

//................ Bludgeon ............... // (Copper cudgel)
/obj/item/rogueweapon/mace/cudgel/bludgeon
	name = "bludgeon"
	icon = 'icons/roguetown/weapons/custom.dmi'
	icon_state = "bludgeon"
	desc = "Old wooden club with copper nails in it."
	max_integrity = INTEGRITY_POOR
	sellprice = VALUE_DIRT_CHEAP


//................ Wooden sword ............... //
/obj/item/rogueweapon/mace/woodclub/train_sword
	force = 5
	force_wielded = 8
	name = "wooden sword"
	desc = "Crude wood assembled into the shape of a sword, a terrible weapon to be on the recieving end of during a training spat."
	icon_state = "wsword"
	wbalance = 0
	associated_skill = /datum/skill/combat/swords
	wdefense = ULTMATE_PARRY

/obj/item/rogueweapon/mace/woodclub/train_sword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)



//................ Goedendag ............... //
/obj/item/rogueweapon/mace/goden
	force = DAMAGE_CLUB
	force_wielded = DAMAGE_HEAVYCLUB_WIELD
	possible_item_intents = list(/datum/intent/mace/strike/heavy)
	gripped_intents = list(/datum/intent/mace/smash/heavy, /datum/intent/mace/thrust)
	name = "warclub"
	desc = "A two handed club, decorated with a spiked cap crown. A perfect way to say Good Morning to any would be noble-knight."
	icon_state = "goedendag"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	minstr = 10
	parrysound = "parrywood"
	max_integrity = 300
	wbalance = EASY_TO_DODGE
	sellprice = 35
	wdefense = GOOD_PARRY

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

//................ Grand mace ............... //
/obj/item/rogueweapon/mace/goden/steel
	gripped_intents = list(/datum/intent/mace/smash/heavy) // It's a 2h flanged mace, not a goedendag.
	name = "grand mace"
	desc = "A casted polearm, rumored to be the weapon-design used by the Forgotten God himself."
	icon_state = "polemace"
	resistance_flags = FIRE_PROOF
	smeltresult = /obj/item/ingot/steel
	max_integrity = INTEGRITY_STRONGEST
//	slowdown = 1
	sellprice = 60
	wbalance = DODGE_CHANCE_NORMAL

/obj/item/rogueweapon/mace/goden/steel/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -8,"sy" = 6,"nx" = 8,"ny" = 6,"wx" = -5,"wy" = 6,"ex" = 0,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -24,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)

//................ Shillelagh ............... //
/obj/item/rogueweapon/mace/goden/shillelagh		// The Briar signature weapon. Sturdy oak war club.
	gripped_intents = list(/datum/intent/mace/smash/heavy)
	name = "shillelagh"
	desc = "Big old oak branch, carved to a deadly weapon."
	icon_state = "shillelagh"
	icon = 'icons/roguetown/weapons/custom.dmi'
	pixel_y = 0
	pixel_x = 0
	bigboy = FALSE
	gripsprite = TRUE
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_BELT
	walking_stick = TRUE
	max_integrity = 200
	minstr = 8
	sellprice = 5


/obj/item/rogueweapon/mace/goden/shillelagh/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -10,"sy" = 0,"nx" = 11,"ny" = 0,"wx" = -5,"wy" = -1,"ex" = 6,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -15,"sturn" = 12,"wturn" = 0,"eturn" = 354,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 6,"sy" = -6,"nx" = -5,"ny" = -6,"wx" = 2,"wy" = -6,"ex" = 6,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 20,"eturn" = -20,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.7,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 2,"wy" = -5,"ex" = 8,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


//................ Dwarf Warhammer ............... // - Unique Langobardo weapon
/obj/item/rogueweapon/mace/goden/steel/warhammer
	name = "warhammer"
	desc = "A great dwarven warhammer made of stern steel, enscratched with oaths of battle and time."
	icon_state = "warhammer"
	wlength = WLENGTH_GREAT
	wdefense = GREAT_PARRY //Signature weapon.
	swingsound = BLUNTWOOSH_HUGE
	sellprice = 100

/obj/item/rogueweapon/mace/goden/steel/warhammer/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)



// Obsolete
//................ Copper bludgeon ............... //
/obj/item/rogueweapon/mace/copperbludgeon
	force = DAMAGE_CLUB
	force_wielded = DAMAGE_CLUB_WIELD
	name = "copper bludgeon"
	desc = "An extremely crude weapon for cruder bastards."
	icon_state = "cbludgeon"
	max_integrity = 80
	minstr = 5
	smeltresult = /obj/item/ingot/copper
	sellprice = 10
	wdefense = MEDIOCRE_PARRY

//................ Copper goden ............... //
/obj/item/rogueweapon/mace/goden/copper
	force = 10
	force_wielded = 20
	slowdown = 1
	name = "copper warclub"
	desc = "A two handed club, decorated with a crown of spikes. A barbaric besign, good enough to be used as a weapon."
	icon_state = "cwarclub"
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	parrysound = "parrywood"
	max_integrity = 150
	minstr = 10
	sellprice = 35

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/rogueweapon/mace/goden/otsuchi
	force = 10
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike/heavy, /datum/intent/mace/smash/heavy)
	name = "otsuchi"
	desc = "A wooden greathammer of Abyssariad make, heavy enough to give any warrior pause. Often used by Yamabushi warriors."
	icon_state = "otsuchi"
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	sharpness = IS_BLUNT
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	smeltresult = /obj/item/ash
	swingsound = BLUNTWOOSH_HUGE
	max_integrity = 250
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/kanabo
	name = "kanabo"
	desc = "A heavy two handed club, reinforced with an iron sleeve. Most commonly seen in the hands of Onis and Yamabushis."
	icon_state = "kanabo"
	possible_item_intents = list(/datum/intent/mace/strike/heavy)
	gripped_intents = list(/datum/intent/mace/smash/heavy) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	slowdown = 1

/obj/item/rogueweapon/mace/goden/kanabo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse kanabo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/goden/steel/tetsubo
	name = "tetsubo"
	desc = "A heavier variant of the kanabo, fitted with a steel sleeve bearing menacing spikes and favored by Ogrun Warlords. Requires immense strength to use, but hits like a raging bull."
	icon_state = "tetsubo"
	possible_item_intents = list(/datum/intent/mace/strike/heavy)
	gripped_intents = list(/datum/intent/mace/smash/heavy) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'icons/roguetown/kaizoku/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/rogueweapon/mace/goden/steel/tetsubo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse tetsubo"
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo
	name = "ararebo"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "ararebo"
	desc = "A large, iron-capped club used by Abyssariads as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo/obsidian
	name = "obsidian club"
	icon_state = "obsidian_club"
	desc = "A large, wooden club with sharp flakes of obsidian embedded into it. Its appearance is similar to a flanged mace, but it inflicts deep cuts."
	max_integrity = 150
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP
	wbalance = -1
	minstr = 0
	wdefense = 3

/obj/item/rogueweapon/mace/steel/ararebo
	name = "steel ararebo"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "sararebo"
	desc = "A large, steel-capped club used by Abyssariads as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/steel/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse steel ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/cudgel/rungu
	force = 15
	force_wielded = 20
	name = "rungu club"
	desc = "A more well defined, chiseled and ashed wooden club that can be throw at enemies. Used by Undine warriors."
	icon_state = "rungu"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	wbalance = 0
	wdefense = 1
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 150
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 0
	throwforce = 25

/obj/item/rogueweapon/mace/cudgel/jitte
	name = "jitte"
	desc = "An abyssariad Ashigaru guard weapon. The hook along the shaft allows the club to arrest a blade that has been parried, increasing the defensive utility of a otherwise simple baton."
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "jitte"
	wdefense = 4
