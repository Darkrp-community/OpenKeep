/* KNIVES - Low damage, bad parry, ok AP
==========================================================*/

/obj/item/rogueweapon/knife
	force = DAMAGE_KNIFE
	throwforce = DAMAGE_KNIFE
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	icon = 'icons/roguetown/weapons/32.dmi'
	gripsprite = FALSE
	dropshrink = 0.8
	thrown_bclass = BCLASS_CUT
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	max_blade_int = 140
	max_integrity = INTEGRITY_STANDARD
	associated_skill = /datum/skill/combat/knives
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	equip_sound = 'sound/foley/dropsound/holster_sword.ogg'
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	wdefense = MEDIOCRE_PARRY
	wbalance = HARD_TO_DODGE
	smeltresult = /obj/item/ingot/steel
	sharpness = IS_SHARP
	sellprice = 30

/obj/item/rogueweapon/knife/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -8,"sy" = 0,"nx" = 9,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/dagger
	clickcd = 8

/*-----------\
| Cut intent |	small AP, fast
\-----------*/
/datum/intent/dagger/cut
	name = "cut"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	penfactor = 10
	chargetime = 0
	swingdelay = 1
	clickcd = 10	// between normal and fast

/*------------\
| Stab intent |	good AP, fast
\---------.--*/
/datum/intent/dagger/thrust
	name = "stab"
	icon_state = "instab"
	attack_verb = list("stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = AP_DAGGER_STAB
	chargetime = 0
	clickcd = CLICK_CD_FAST
	swingdelay = 1

/*------------\
| Pick intent |	great AP. Not actually used anywhere.
\------------*/
/datum/intent/dagger/thrust/pick
	name = "thrust"
	attack_verb = list("stabs", "impales")
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = AP_DAGGER_PICK
	clickcd = CLICK_CD_MELEE
	swingdelay = 1
	blade_class = BCLASS_PICK

/*------------\
| Chop intent |	small AP, bonus damage
\------------*/
/datum/intent/dagger/chop
	name = "chop"
	icon_state = "inchop"
	attack_verb = list("chops")
	animname = "chop"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	penfactor = 10
	damfactor = 1.5
	swingdelay = 1
	clickcd = CLICK_CD_MELEE

/datum/intent/dagger/chop/cleaver
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	damfactor = 2

//................ Hunting Knife ............... //
/obj/item/rogueweapon/knife/hunting
	force = DAMAGE_KNIFE+1
	throwforce = DAMAGE_KNIFE
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	name = "hunting knife"
	desc = "Loyal companion to hunters and poachers, from humble bone to truest steel, disembowel your prey with glee."
	icon_state = "huntingknife"
	max_blade_int = 140
	max_integrity = INTEGRITY_STRONG
	wdefense = MEDIOCRE_PARRY
	wbalance = HARD_TO_DODGE
	smeltresult = /obj/item/ingot/steel
	sellprice = 30


//................ Cleaver ............... //
/obj/item/rogueweapon/knife/cleaver
	name = "cleaver"
	desc = "A chef's tool turned armament, cleave off cumbersome flesh with rudimentary ease."
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	icon_state = "cleav"
	item_state = "cleav"
	experimental_inhand = FALSE
	experimental_onhip = FALSE
	experimental_onback = FALSE
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver)
	parrysound = list('sound/combat/parry/bladed/bladedmedium (1).ogg','sound/combat/parry/bladed/bladedmedium (2).ogg','sound/combat/parry/bladed/bladedmedium (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	throwforce = 15
	max_integrity = 150
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CHOP
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/steel
	wbalance = 0 // Except this one, too huge and used to chop
	dropshrink = 0.9

//................ Hack-Knife ............... //
/obj/item/rogueweapon/knife/cleaver/combat
	name = "hack-knife"
	desc = "A short blade that even the weakest of hands can aspire to do harm with."
	force = DAMAGE_KNIFE
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop)
	icon_state = "combatknife"
	throwforce = 16
	max_integrity = 180
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/iron
	wbalance = 1
	sellprice = 15

/obj/item/rogueweapon/knife/cleaver/combat/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = 0,"nx" = 13,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 5,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 21,"sturn" = -18,"wturn" = -18,"eturn" = 21,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//................ Iron Dagger ............... //
/obj/item/rogueweapon/knife/dagger
	force = DAMAGE_DAGGER
	possible_item_intents = list(/datum/intent/dagger/thrust, /datum/intent/dagger/cut) //Stabbing is the first intent, for convenience.
	name = "iron dagger"
	desc = "Thin, sharp, pointed death."
	icon_state = "idagger"
	smeltresult = null
	sellprice = 15

//................ Steel Dagger ............... //
/obj/item/rogueweapon/knife/dagger/steel
	force = DAMAGE_GOOD_DAGGER
	name = "steel dagger"
	desc = "A dagger made of refined steel."
	icon_state = "sdagger"
	smeltresult = null
	wdefense = AVERAGE_PARRY
	wbalance = VERY_HARD_TO_DODGE
	sellprice = 20

/obj/item/rogueweapon/knife/dagger/steel/special
	icon_state = "sdaggeralt"
	desc = "A dagger of refined steel, and even more refined appearance."
	sellprice = 25

//................ Fanged dagger ............... //
/obj/item/rogueweapon/knife/dagger/steel/dirk
	name = "fanged dagger"
	desc = "A dagger modeled after the fang of an anthrax spider."
	icon_state = "spiderdagger"
	smeltresult = null

//................ Silver Dagger ............... //
/obj/item/rogueweapon/knife/dagger/silver
	name = "silver dagger"
	desc = "A dagger made of fine silver, the bane of the undead."
	icon_state = "sildagger"
	smeltresult = null
	max_blade_int = 112 // .8 of steel
	max_integrity = 240 // .8 of steel
	sellprice = 45
	last_used = 0
	is_silver = TRUE

/obj/item/rogueweapon/knife/dagger/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.Paralyze(1)
			H.adjustFireLoss(40)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(1)

/obj/item/rogueweapon/knife/dagger/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(40)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)

//................ Profane Dagger ............... //
/obj/item/rogueweapon/knife/dagger/steel/profane
//	name = "profane dagger"
	desc = "A profane dagger made of cursed black steel. Whispers emanate from the gem on its hilt."
	sellprice = 250
	icon_state = "pdagger"
	smeltresult = null
	embedding = list("embed_chance" = 0) // Embedding the cursed dagger has the potential to cause duping issues. Keep it like this unless you want to do a lot of bug hunting.

/obj/item/rogueweapon/knife/dagger/steel/profane/pickup(mob/living/M)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if (!HAS_TRAIT(H, TRAIT_ASSASSIN)) // Non-assassins don't like holding the profane dagger.
			H.add_stress(/datum/stressevent/profane)
			to_chat(M, "<span class='danger'>Your breath chills as you pick up the dagger. You feel a sense of morbid wrongness!</span>")
			var/message = pick(
				"<span class='danger'>Help me...</span>",
				"<span class='danger'>Save me...</span>",
				"<span class='danger'>It's cold...</span>",
				"<span class='danger'>Free us...please...</span>",
				"<span class='danger'>Necra...deliver...us...</span>")
//			H.visible_message("profane dagger whispers, \"[message]\"")
			to_chat(M, ">profane dagger whispers,<span class='danger' \"[message]\"</span>")
		else
			var/message = pick(
				"<span class='danger'>Why...</span>",
				"<span class='danger'>...Who sent you?</span>",
				"<span class='danger'>...You will burn for what you've done...</span>",
				"<span class='danger'>I hate you...</span>",
				"<span class='danger'>Someone stop them!</span>",
				"<span class='danger'>Guards! Help!</span>",
				"<span class='danger'>...What's that in your hand?</span>",
				"<span class='danger'>...You love me...don't you?</span>",
				"<span class='danger'>Wait...don't I know you?</span>",
				"<span class='danger'>I thought you were...my friend...</span>",
				"<span class='danger'>How long have I been in here...</span>")
//			H.visible_message("profane dagger whispers, \"[message]\"")
			to_chat(M, ">profane dagger whispers,<span class='danger' \"[message]\"</span>")

/obj/item/rogueweapon/knife/dagger/steel/profane/pre_attack(mob/living/carbon/human/target, mob/living/user = usr, params)
	if(target.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(target, TRAIT_ZIZOID_HUNTED)) // Check to see if the dagger will do 20 damage or 14
		force = 20
	else
		force = 14
	return FALSE

/obj/item/rogueweapon/knife/dagger/steel/profane/afterattack(mob/living/carbon/human/target, mob/living/user = usr, proximity)
	. = ..()
	if(target.stat == DEAD || (target.health < target.crit_threshold)) // Trigger soul steal if the target is either dead or in crit
		if(target.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(target, TRAIT_ZIZOID_HUNTED)) // The profane dagger only thirsts for those who are hunted, by flaw or by zizoid curse.
			if(target.client == null) //See if the target's soul has left their body
				to_chat(user, "<span class='danger'>Your target's soul has already escaped its corpse...you try to call it back!</span>")
				get_profane_ghost(target,user) //Proc to capture a soul that has left the body.
			else
				user.adjust_triumphs(1)
				init_profane_soul(target, user) //If they are still in their body, send them to the dagger!

/obj/item/rogueweapon/knife/dagger/steel/profane/proc/init_profane_soul(mob/living/carbon/human/target, mob/user)
	var/mob/dead/observer/profane/S = new /mob/dead/observer/profane(src)
	S.AddComponent(/datum/component/profaned, src)
	S.name = "soul of [target.real_name]"
	S.real_name = "soul of [target.real_name]"
	S.deadchat_name = target.real_name
	S.ManualFollow(src)
	S.key = target.key
	S.language_holder = target.language_holder.copy(S)
	target.visible_message("<span class='danger'>[target]'s soul is pulled from their body and sucked into the profane dagger!</span>", "<span class='danger'>My soul is trapped within the profane dagger. Damnation!</span>")
	playsound(src, 'sound/magic/soulsteal.ogg', 100, extrarange = 5)
	src.blade_int = src.max_blade_int // Stealing a soul successfully sharpens the blade.
	src.obj_integrity = src.max_integrity // And fixes the dagger. No blacksmith required!

/obj/item/rogueweapon/knife/dagger/steel/profane/proc/get_profane_ghost(mob/living/carbon/human/target, mob/user)
	var/mob/dead/observer/chosen_ghost
	var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit() //Check if a soul has already gone to the underworld
	if(underworld_spirit) // If they are in the underworld, pull them back to the real world and make them a normal ghost. Necra can't save you now!
		var/mob/dead/observer/ghost = underworld_spirit.ghostize()
		chosen_ghost = ghost.get_ghost(TRUE,TRUE)
	else //Otherwise, try to get a ghost from the real world
		chosen_ghost = target.get_ghost(TRUE,TRUE)
	if(!chosen_ghost || !chosen_ghost.client) // If there is no valid ghost or if that ghost has no active player
		return FALSE
	user.adjust_triumphs(1)
	init_profane_soul(target, user) // If we got the soul, store them in the dagger.
	qdel(target) // Get rid of that ghost!
	return TRUE

/obj/item/rogueweapon/knife/dagger/steel/profane/proc/release_profane_souls(mob/user) // For ways to release the souls trapped within a profane dagger, such as a Necrite burial rite. Returns the number of freed souls.
	var/freed_souls = 0
	for(var/mob/dead/observer/profane/A in src) // for every trapped soul in the dagger, whether they have left the game or not
		to_chat(A, "<b>I have been freed from my vile prison, I await Necra's cold grasp. Salvation!</b>")
		A.returntolobby() //Send the trapped soul back to the lobby
		user.visible_message("<span class='warning'>The [A.name] flows out from the profane dagger, finally free of its grasp.</span>")
		freed_souls += 1
	user.visible_message("<span class='warning'>The profane dagger shatters into putrid smoke!</span>")
	qdel(src) // Delete the dagger. Forevermore.
	return freed_souls

/datum/component/profaned
	var/atom/movable/container

/datum/component/profaned/Initialize(atom/movable/container)
	if(!istype(parent, /mob/dead/observer/profane))
		return COMPONENT_INCOMPATIBLE
	var/mob/dead/observer/profane/S = parent

	src.container = container

	S.forceMove(container)

//................ Stone Knife ............... //
/obj/item/rogueweapon/knife/stone
	force = DAMAGE_WEAK_KNIFE
	throwforce = DAMAGE_KNIFE
	possible_item_intents = list(/datum/intent/dagger/cut,/datum/intent/dagger/chop)
	name = "stone knife"
	desc = "A tool favored by poor woodland inhabitants, easy to make, useful for skinning the flesh of beast and man alike."
	icon_state = "stone_knife"
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_integrity = 28
	max_blade_int = 28
	wdefense = TERRIBLE_PARRY
	smeltresult = /obj/item/ash
	sellprice = 5


//................ Villager Knife ............... //
/obj/item/rogueweapon/knife/villager
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	name = "villager knife"
	desc = "The loyal companion of simple peasants, for cutting hard bread and carving wood."
	icon_state = "villagernife"
	force = DAMAGE_WEAK_KNIFE
	smeltresult = null // Enough of this exploit. Three can be crafted or more ordered, so no smelting them.

/obj/item/rogueweapon/knife/copper
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	name = "copper dagger"
	desc = "A dagger of an older design, the copper serves decent enough."
	icon_state = "cdagger"
	max_blade_int = 50
	max_integrity = 50
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/knives
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	smeltresult = /obj/item/ash
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

// Parent Kaizoku knife, for all intents and purposes of checks for seppuku and such.
/obj/item/rogueweapon/knife/kaizoku
	name = "parent Kaizoku knife"
	desc = "You should not see be seeing this. Yell at coders or mappers for fucking up."
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust) // None of them have chop
	smeltresult = null // As every dagger craftable by pairs made of good metal


/obj/item/rogueweapon/knife/kaizoku/kunai //Practically a villager knife with more utility. It helps others to climb walls.
	name = "kunai"
	desc = "A simple stabbing weapon made of iron which originated as a masonry or gardening tool, useful for climbing walls in similar ways to pitons."
	icon_state = "kunai"
	force = DAMAGE_WEAK_KNIFE
	wbalance = VERY_HARD_TO_DODGE

/obj/item/rogueweapon/knife/kaizoku/kaiken
	name = "iron kaiken"
	desc = "The weapon laws in colonized Abyssariad islands, with high humen or elven population, forbade non-warriors from carrying blades in public, so abyssariad colonists made weapons such as this."
	icon_state = "kaiken"
	force = DAMAGE_DAGGER
	max_integrity = INTEGRITY_STRONG
	sellprice = 15

/obj/item/rogueweapon/knife/kaizoku/tanto
	name = "steel tanto"
	desc = "Initially a companion blade to the tachi in a zamurai's daisho, the tanto was later replaced by the wakizashi with the shift to infantry tactics after the Bloody Apotheosis."
	icon_state = "tanto"
	force = DAMAGE_GOOD_DAGGER
	max_integrity = INTEGRITY_STRONGER
	w_class = WEIGHT_CLASS_NORMAL
	wdefense = AVERAGE_PARRY
	wbalance = VERY_HARD_TO_DODGE
	sellprice = 20

/obj/item/rogueweapon/knife/kaizoku/sai //I love gundam for helping me on my request on this sai. I love HIM!!!!!!!!!!!!! -Monochrome
	name = "sai"
	desc = "Recognizable by its uniqueness and typically carried in pairs, the sai features a sharply-tapered central rod with two prongs at the cross-guards. It lacks blade for cutting, but it excels in jabbing and defending against other weapons."
	icon_state = "sai"
	w_class = WEIGHT_CLASS_NORMAL
	force = DAMAGE_KNIFE+1
	max_integrity = INTEGRITY_STRONG
	smeltresult = null
	wdefense = 5
	wbalance = VERY_HARD_TO_DODGE
