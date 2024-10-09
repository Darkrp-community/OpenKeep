/obj/structure/flora/newtree
	name = "tree"
	desc = "The thick core of a tree."
	icon = 'icons/roguetown/misc/tree.dmi'
	icon_state = "tree1"
	var/tree_type = 1
	var/base_state
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = -100, "acid" = 50)
	blade_dulling = DULLING_CUT
	opacity = 1
	density = 1
	attacked_sound = 'sound/misc/woodhit.ogg'
	destroy_sound = 'sound/misc/woodhit.ogg'
	climbable = FALSE
	static_debris = list(/obj/item/grown/log/tree = 1)
	obj_flags = CAN_BE_HIT | BLOCK_Z_IN_UP | BLOCK_Z_OUT_DOWN
	max_integrity = 300
	//If the tree has been burn beforehand.
	var/burnt = FALSE

/obj/structure/flora/newtree/Initialize()
	. = ..()
	GenerateTree()

/obj/structure/flora/newtree/update_icon()
	if(burnt)
		icon_state = "burnt"
		cut_overlays()
		return
	icon_state = ""
	cut_overlays()
	var/mutable_appearance/M
	if(base_state)
		M = mutable_appearance(icon, "[base_state]")
		add_overlay(M)
	M = mutable_appearance(icon, "tree[tree_type]")
	M.dir = dir
	add_overlay(M)

/*
* get_complex_damage comes from item_attack.dm
* Its purpose is to alter damage based on several
* factors and apply dulling to weapons.
*/

/obj/structure/flora/newtree/attack_right(mob/user)
	if(user.mind && isliving(user))
		if(user.mind.special_items && user.mind.special_items.len)
			var/item = input(user, "What will I take?", "STASH") as null|anything in user.mind.special_items
			if(item)
				if(user.Adjacent(src))
					if(user.mind.special_items[item])
						var/path2item = user.mind.special_items[item]
						user.mind.special_items -= item
						var/obj/item/I = new path2item(user.loc)
						user.put_in_hands(I)
			return

/obj/structure/flora/newtree/attack_hand(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		var/turf/target = get_step_multiz(user, UP)
		if(!istype(target, /turf/open/transparent/openspace))
			to_chat(user, "<span class='warning'>I can't climb here.</span>")
			return
		if(!L.can_zTravel(target, UP))
			to_chat(user, "<span class='warning'>I can't climb there.</span>")
			return
		var/used_time = 0
		var/exp_to_gain = 0
		if(L.mind)
			var/myskill = L.mind.get_skill_level(/datum/skill/misc/climbing)
			exp_to_gain = (L.STAINT/2) * L.mind.get_learning_boon(/datum/skill/misc/climbing)
			var/obj/structure/table/TA = locate() in L.loc
			if(TA)
				myskill += 1
			else
				var/obj/structure/chair/CH = locate() in L.loc
				if(CH)
					myskill += 1
			used_time = max(70 - (myskill * 10) - (L.STASPD * 3), 30)
		playsound(user, 'sound/foley/climb.ogg', 100, TRUE)
		user.visible_message("<span class='warning'>[user] starts to climb [src].</span>", "<span class='warning'>I start to climb [src]...</span>")
		if(do_after(L, used_time, target = src))
			var/pulling = user.pulling
			if(ismob(pulling))
				user.pulling.forceMove(target)
			user.forceMove(target)
			user.start_pulling(pulling,supress_message = TRUE)
			playsound(user, 'sound/foley/climb.ogg', 100, TRUE)
			if(L.mind)
				L.mind.adjust_experience(/datum/skill/misc/climbing, exp_to_gain, FALSE)

/obj/structure/flora/newtree/fire_act(added, maxstacks)
	. = ..()
	if(.)
		burnt = TRUE
		if(icon_state != "burnt")
			name = "burnt tree"
			update_icon()

//The root of this is not very modular so i have to override it.
/obj/structure/flora/newtree/obj_destruction(damage_flag)
	obj_destroyed = TRUE
	//Sloppy code but it works.
	if(burnt)
		damage_flag = "fire"
	FellTree(damage_flag)
	if(damage_flag == "acid")
		acid_melt()
	else if(damage_flag == "fire")
		burn()
	else
		if(destroy_sound)
			playsound(src, destroy_sound, 100, TRUE)
		if(destroy_message)
			visible_message(destroy_message)
		//This right here? I had to change it to TRUE.
		deconstruct(TRUE)
	return TRUE

/*
* Okay so the root of this proc defines dissasemble
* but doesnt do anything with it. This means despite
* burn() calling deconstruct(FALSE) it will still
* spawn the debris.
*/
/obj/structure/flora/newtree/deconstruct(disassembled = TRUE)
	if(disassembled)
		return ..()
	qdel(src)

//Used to be at initialize but i want to override it for burnt trees
/obj/structure/flora/newtree/proc/GenerateTree()
	tree_type = rand(1,2)
	dir = pick(GLOB.cardinals)
	SStreesetup.initialize_me |= src
	build_trees()
	update_icon()
	if(istype(loc, /turf/open/floor/rogue/grass))
		var/turf/T = loc
		T.ChangeTurf(/turf/open/floor/rogue/dirt)

/obj/structure/flora/newtree/proc/FellTree(damage_type)
	var/turf/NT = get_turf(src)
	var/turf/UPNT = get_step_multiz(src, UP)
	src.obj_flags = CAN_BE_HIT | BLOCK_Z_IN_UP //so the logs actually fall when pulled by zfall

	for(var/obj/structure/flora/newtree/D in UPNT)//theoretically you'd be able to break trees through a floor but no one is building floors under a tree so this is probably fine
		D.obj_destruction(damage_type)
	for(var/obj/item/grown/log/tree/I in UPNT)
		UPNT.zFall(I)

	for(var/DI in GLOB.cardinals)
		var/turf/B = get_step(src, DI)
		for(var/obj/structure/flora/newbranch/BRANCH in B)//i straight up can't use locate here, it does not work
			if(BRANCH.dir == DI)
				var/turf/BI = get_step(B, DI)
				for(var/obj/structure/flora/newbranch/bi in BI)//2 tile end branch
					if(bi.dir == DI)
						bi.obj_flags = CAN_BE_HIT
						bi.obj_destruction(damage_type)
					for(var/atom/bio in BI)
						BI.zFall(bio)
				for(var/obj/structure/flora/newleaf/bil in BI)//2 tile end leaf
					bil.obj_destruction(damage_type)
				BRANCH.obj_flags = CAN_BE_HIT
				BRANCH.obj_destruction(damage_type)
			for(var/atom/BRA in B)//unload a sack of rocks on a branch and stand under it, it'll be funny bro
				B.zFall(BRA)

	for(var/turf/DIA in block(get_step(src, SOUTHWEST), get_step(src, NORTHEAST)))
		for(var/obj/structure/flora/newleaf/LEAF in DIA)
			LEAF.obj_destruction(damage_type)

	if(!istype(NT, /turf/open/transparent/openspace) && !(locate(/obj/structure/table/wood/treestump) in NT))//if i don't add the stump check it spawns however many zlevels it goes up because of src recursion
		new /obj/structure/table/wood/treestump(NT)
	playsound(src, 'sound/misc/treefall.ogg', 100, FALSE)

/obj/structure/flora/newtree/proc/build_trees()
	var/turf/target = get_step_multiz(src, UP)
	if(istype(target, /turf/open/transparent/openspace))
		var/obj/structure/flora/newtree/T = new(target)
		T.base_state = "center-leaf[rand(1,2)]"
		T.update_icon()

/obj/structure/flora/newtree/proc/build_leafs()
	for(var/D in GLOB.diagonals)
		var/turf/NT = get_step(src, D)
		if(istype(NT, /turf/open/transparent/openspace))
			if(!locate(/obj/structure) in NT)
				var/obj/structure/flora/newleaf/corner/T = new(NT)
				T.dir = D

/obj/structure/flora/newtree/proc/build_branches()
	for(var/D in GLOB.cardinals)
		var/turf/NT = get_step(src, D)
		if(istype(NT, /turf/open/transparent/openspace))
			var/turf/NB = get_step(NT, D)
			if(istype(NB, /turf/open/transparent/openspace) && prob(50))//make an ending branch
				if(prob(50))
					if(!locate(/obj/structure) in NB)
						var/obj/structure/flora/newbranch/T = new(NB)
						T.dir = D
					if(!locate(/obj/structure) in NT)
						var/obj/structure/flora/newbranch/connector/TC = new(NT)
						TC.dir = D
				else
					if(!locate(/obj/structure) in NB)
						new /obj/structure/flora/newleaf(NB)
					if(!locate(/obj/structure) in NT)
						var/obj/structure/flora/newbranch/TC = new(NT)
						TC.dir = D
			else
				if(!locate(/obj/structure) in NT)
					var/obj/structure/flora/newbranch/TC = new(NT)
					TC.dir = D
		else
			if(prob(70))
				if(isopenturf(NT))
					if(!istype(loc, /turf/open/transparent/openspace)) //must be lowest
						if(!locate(/obj/structure) in NT)
							var/obj/structure/flora/newbranch/leafless/T = new(NT)
							T.dir = D

///BURNT TREE SPAWNER
/obj/structure/flora/newtree/scorched
	name = "scorched tree"
	desc = "A tree trunk scorched to ruin."
	icon = 'icons/roguetown/misc/tree.dmi'
	icon_state = "burnt"
	burnt = TRUE

//I dont really understand the purpose of adding a duplicate icon overlay ontop of the overlay.
/obj/structure/flora/newtree/scorched/update_icon()
	icon_state = "burnt"
	cut_overlays()

/obj/structure/flora/newtree/scorched/build_trees()
	var/turf/target = get_step_multiz(src, UP)
	if(istype(target, /turf/open/transparent/openspace))
		new /obj/structure/flora/newtree/scorched(target)

//The leaves became embers long ago. All thats left is the whispers of ash.
/obj/structure/flora/newtree/scorched/build_leafs()
	return

/obj/structure/flora/newtree/scorched/build_branches()
	for(var/D in GLOB.cardinals)
		var/turf/NT = get_step(src, D)
		if(istype(NT, /turf/open/transparent/openspace))
			var/turf/NB = get_step(NT, D)
			if(istype(NB, /turf/open/transparent/openspace) && prob(50))//make an ending branch
				if(prob(50))
					if(!locate(/obj/structure) in NB)
						var/obj/structure/flora/newbranch/leafless/scorched/T = new(NB)
						T.dir = D
					if(!locate(/obj/structure) in NT)
						var/obj/structure/flora/newbranch/connector/scorched/TC = new(NT)
						TC.dir = D
				else
					if(!locate(/obj/structure) in NT)
						var/obj/structure/flora/newbranch/leafless/scorched/TC = new(NT)
						TC.dir = D
			else
				if(!locate(/obj/structure) in NT)
					var/obj/structure/flora/newbranch/leafless/scorched/TC = new(NT)
					TC.dir = D
		else
			if(prob(70))
				if(isopenturf(NT))
					if(!istype(loc, /turf/open/transparent/openspace)) //must be lowest
						if(!locate(/obj/structure) in NT)
							var/obj/structure/flora/newbranch/leafless/scorched/T = new(NT)
							T.dir = D

///BRANCHES

/obj/structure/flora/newbranch
	name = "branch"
	desc = "A stable branch, should be safe to walk on."
	icon = 'icons/roguetown/misc/tree.dmi'
	icon_state = "branch-end1"
	attacked_sound = 'sound/misc/woodhit.ogg'
//	var/tree_type = 1
	var/base_state = TRUE
	obj_flags = CAN_BE_HIT | BLOCK_Z_OUT_DOWN
	static_debris = list(/obj/item/grown/log/tree/stick = 1)
	density = FALSE
	max_integrity = 30

/obj/structure/flora/newbranch/update_icon()
	icon_state = ""
	cut_overlays()
	var/mutable_appearance/M
	if(base_state)
		M = mutable_appearance(icon, "[base_state]")
		M.dir = pick(GLOB.cardinals)
		add_overlay(M)
	M = mutable_appearance(icon, "branch-end[rand(1,2)]")
	M.dir = dir
	add_overlay(M)

/obj/structure/flora/newbranch/Initialize()
	. = ..()
	if(base_state)
		AddComponent(/datum/component/squeak, list('sound/foley/plantcross1.ogg','sound/foley/plantcross2.ogg','sound/foley/plantcross3.ogg','sound/foley/plantcross4.ogg'), 100)
		base_state = "center-leaf[rand(1,2)]"
	update_icon()

/obj/structure/flora/newbranch/connector
	icon_state = "branch-extend"

/obj/structure/flora/newbranch/connector/update_icon()
	icon_state = ""
	cut_overlays()
	var/mutable_appearance/M
	if(base_state)
		M = mutable_appearance(icon, "[base_state]")
		M.dir = pick(GLOB.cardinals)
		add_overlay(M)
	M = mutable_appearance(icon, "branch-extend")
	M.dir = dir
	add_overlay(M)

//BURNT SUBTYPE
/obj/structure/flora/newbranch/connector/scorched
	name = "burnt branch"
	desc = "Cracked and hardened from a terrible fire."
	icon_state = "branchburnt-extend"
	base_state = FALSE

/obj/structure/flora/newbranch/connector/scorched/update_icon()
	return

//Normal
/obj/structure/flora/newbranch/leafless
	base_state = FALSE

/obj/structure/flora/newbranch/leafless/update_icon()
	icon_state = ""
	cut_overlays()
	var/mutable_appearance/M = mutable_appearance(icon, "branch-end[rand(1,2)]")
	M.dir = dir
	add_overlay(M)

//BURNT SUBTYPE
/obj/structure/flora/newbranch/leafless/scorched
	name = "burnt branch"
	desc = "Cracked and hardened from a terrible fire."
	static_debris = list()

/obj/structure/flora/newbranch/leafless/scorched/Initialize()
	. = ..()
	icon_state = "branchburnt-end[rand(1,2)]"
	update_icon()

/obj/structure/flora/newbranch/leafless/scorched/update_icon()
	return

/// LEAF


/obj/structure/flora/newleaf/corner
	icon = 'icons/roguetown/misc/tree.dmi'
	icon_state = "corner-leaf1"


/obj/structure/flora/newleaf/corner/Initialize()
	. = ..()
	icon_state = "corner-leaf[rand(1,2)]"
	update_icon()

/obj/structure/flora/newleaf
	name = "leaves"
	icon = 'icons/roguetown/misc/tree.dmi'
	icon_state = "center-leaf1"
	density = FALSE
	max_integrity = 10

/obj/structure/flora/newleaf/Initialize()
	. = ..()
	icon_state = "center-leaf[rand(1,2)]"
	update_icon()
