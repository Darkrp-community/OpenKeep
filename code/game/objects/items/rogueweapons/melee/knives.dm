

/obj/item/rogueweapon/huntingknife
	force = 12
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	name = "hunting knife"
	desc = "Loyal companion to hunters and poachers, from humble bone to truest steel, disembowel your prey with glee."
	icon_state = "huntingknife"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "bone_dagger"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	gripsprite = FALSE
	dropshrink = 0.75
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CUT
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	max_blade_int = 140
	max_integrity = 300
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/knives
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	throwforce = 12
	wdefense = 3
	wbalance = 1 // All knives are swift, bonus to SPD
	smeltresult = /obj/item/ingot/steel
	sellprice = 30


/obj/item/rogueweapon/huntingknife/villager
	force = 7//lowest tier thingie
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	name = "small knife"
	desc = "The loyal companion of simple peasants, able to cut hard bread and carve wood. A versatile kitchen utensil and tool."
	icon_state = "villagernife"
	icon = 'icons/roguetown/weapons/32.dmi'
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)

/datum/intent/dagger
	clickcd = 8

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
	clickcd = 10

/datum/intent/dagger/thrust
	name = "stab"
	icon_state = "instab"
	attack_verb = list("stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 30
	chargetime = 0
	clickcd = 8
	swingdelay = 1

/datum/intent/dagger/thrust/pick
	name = "thrust"
	attack_verb = list("stabs", "impales")
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 50
	clickcd = CLICK_CD_MELEE
	swingdelay = 1
	blade_class = BCLASS_PICK

/obj/item/rogueweapon/huntingknife/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -8,"sy" = 0,"nx" = 9,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


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

/obj/item/rogueweapon/huntingknife/cleaver
	name = "cleaver"
	desc = "A chef's tool turned armament, cleave off cumbersome flesh with rudimentary ease."
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver)
	icon_state = "cleav"
	icon = 'icons/roguetown/weapons/32.dmi'
	parrysound = list('sound/combat/parry/bladed/bladedmedium (1).ogg','sound/combat/parry/bladed/bladedmedium (2).ogg','sound/combat/parry/bladed/bladedmedium (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	throwforce = 15
	max_integrity = 150
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CHOP
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/steel
	wbalance = 0 // Except this one, too huge and used to chop

/obj/item/rogueweapon/huntingknife/cleaver/combat
	name = "knife"
	desc = "A short blade that even the weakest of hands can aspire to do harm with."
	force = 10
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop)
	icon_state = "combatknife"
	icon = 'icons/roguetown/weapons/32.dmi'
	parrysound = list('sound/combat/parry/bladed/bladedmedium (1).ogg','sound/combat/parry/bladed/bladedmedium (2).ogg','sound/combat/parry/bladed/bladedmedium (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	throwforce = 16
	max_integrity = 180
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CHOP
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/iron
	wbalance = 1
	sellprice = 15

/obj/item/rogueweapon/huntingknife/cleaver/combat/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = 0,"nx" = 13,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 5,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 21,"sturn" = -18,"wturn" = -18,"eturn" = 21,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/datum/intent/dagger/chop/cleaver
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 30

/obj/item/rogueweapon/huntingknife/idagger
	possible_item_intents = list(/datum/intent/dagger/thrust,/datum/intent/dagger/cut)
	name = "iron dagger"
	desc = "Thin, sharp, pointed death."
	force = 10
	icon_state = "idagger"
	smeltresult = null
	sellprice = 15

/obj/item/rogueweapon/huntingknife/idagger/steel
	name = "steel dagger"
	desc = "A dagger made of refined steel."
	force = 14
	icon_state = "sdagger"
	smeltresult = null

/obj/item/rogueweapon/huntingknife/idagger/steel/special
	icon_state = "sdaggeralt"
	desc = "A dagger of refined steel, and even more refined appearance."

/obj/item/rogueweapon/huntingknife/idagger/silver
	name = "silver dagger"
	desc = "A dagger made of fine silver, the bane of the undead."
	force = 13 // .9 of steel
	icon_state = "sildagger"
	smeltresult = null
	max_blade_int = 112 // .8 of steel
	max_integrity = 240 // .8 of steel
	sellprice = 45
	var/last_used = 0

/obj/item/rogueweapon/huntingknife/idagger/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/huntingknife/idagger/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/huntingknife/idagger/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return



	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V =  H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(10)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't hurt me, I HAVE TRANSCENDED!</span>")
		return
	//I hate that i have to add a unique line of this code to EVERY silver weapon because they dont share a universal unique damage. -IP
	//if is non carbon undead burn the fuck.
	if((target.mob_biotypes & MOB_UNDEAD))
		target.adjustFireLoss(25)
		return

/obj/item/rogueweapon/huntingknife/idagger/steel/profane
	name = "profane dagger"
	desc = "A dagger made of cursed black steel. Whispers emanate from the gem on its hilt."
	sellprice = 250
	icon_state = "pdagger"
	smeltresult = null
	embedding = list("embed_chance" = 0) // Embedding the cursed dagger has the potential to cause duping issues. Keep it like this unless you want to do a lot of bug hunting.

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/pickup(mob/living/M)
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
			H.visible_message("profane dagger whispers, \"[message]\"")
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
			H.visible_message("profane dagger whispers, \"[message]\"")

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/pre_attack(mob/living/carbon/human/target, mob/living/user = usr, params)
	if(target.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(target, TRAIT_ZIZOID_HUNTED)) // Check to see if the dagger will do 20 damage or 14
		force = 20
	else
		force = 14
	return FALSE

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/afterattack(mob/living/carbon/human/target, mob/living/user = usr, proximity)
	. = ..()
	if(target.stat == DEAD || (target.health < target.crit_threshold)) // Trigger soul steal if the target is either dead or in crit
		if(target.has_flaw(/datum/charflaw/hunted) || HAS_TRAIT(target, TRAIT_ZIZOID_HUNTED)) // The profane dagger only thirsts for those who are hunted, by flaw or by zizoid curse.
			if(target.client == null) //See if the target's soul has left their body
				to_chat(user, "<span class='danger'>Your target's soul has already escaped its corpse...you try to call it back!</span>")
				get_profane_ghost(target,user) //Proc to capture a soul that has left the body.
			else
				user.adjust_triumphs(1)
				init_profane_soul(target, user) //If they are still in their body, send them to the dagger!

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/proc/init_profane_soul(mob/living/carbon/human/target, mob/user)
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

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/proc/get_profane_ghost(mob/living/carbon/human/target, mob/user)
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

/obj/item/rogueweapon/huntingknife/idagger/steel/profane/proc/release_profane_souls(mob/user) // For ways to release the souls trapped within a profane dagger, such as a Necrite burial rite. Returns the number of freed souls.
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

/obj/item/rogueweapon/huntingknife/stoneknife
	possible_item_intents = list(/datum/intent/dagger/cut,/datum/intent/dagger/chop)
	name = "stone knife"
	desc = "A tool favored by the wood-elves, easy to make, useful for skinning the flesh of beast and man alike."
	icon_state = "stone_knife"
	force = 8
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_integrity = 15
	max_blade_int = 15
	wdefense = 1
	smeltresult = /obj/item/ash
	sellprice = 5

/obj/item/rogueweapon/knife/copperdagger
	force = 8
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	name = "copper dagger"
	desc = "A dagger of an older design, the copper serves decent enough."
	icon_state = "cdagger"
	icon = 'icons/roguetown/weapons/32.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	gripsprite = FALSE
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CUT
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_SMALL
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	max_blade_int = 50
	max_integrity = 50
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	associated_skill = /datum/skill/combat/knives
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	throwforce = 12
	wdefense = 3
	smeltresult = /obj/item/ingot/copper
	sellprice = 10
