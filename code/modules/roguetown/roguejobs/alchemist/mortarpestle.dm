/obj/item
	var/dust_result//  check if it can be used by the mortar/pestle.

/obj/item/pestle
	name = "pestle"
	desc = ""
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "pestle"
	force = 7
	dropshrink = 0.5

/obj/item/mortar
	name = "mortar"
	desc = ""
	icon = 'icons/roguetown/misc/alchemy.dmi'
	icon_state = "mortar"
	dropshrink = 0.5
	var/obj/item/to_grind

/obj/item/mortar/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	if(to_grind)
		var/obj/item/N = to_grind
		N.loc = src.loc
		to_chat(user, "<span class='notice'>I remove the [to_grind] from the mortar.</span>")
		to_grind = null
		return
	to_chat(user, "<span class='notice'>It's empty.</span>")

/obj/item/mortar/attackby(obj/item/I, mob/living/carbon/human/user)
	if(istype(I,/obj/item/pestle))
		if(!to_grind)
			to_chat(user, "<span class='warning'>There's nothing to grind.</span>")
			return
		user.visible_message("<span class='info'>[user] begins grinding up [I].</span>")
		playsound(loc, 'sound/foley/mortarpestle.ogg', 100, FALSE)
		if(do_after(user, 10, target = src))
			var/obj/item/N = new to_grind.dust_result(src)
			if(istype(N,/obj/item/rogueore) || istype(N,/obj/item/ingot))
				user.flash_fullscreen("whiteflash")
				var/datum/effect_system/spark_spread/S = new()
				var/turf/front = get_turf(src)
				S.set_up(1, 1, front)
				S.start()
			N.loc = src.loc
			to_grind = null
			if(user.mind)
				user.mind.adjust_experience(/datum/skill/craft/alchemy, 25, FALSE)
		return
	else if(I.dust_result)
		if(to_grind)
			to_chat(user, "<span class='warning'>The mortar is full.</span>")
			return
		if(!user.transferItemToLoc(I,src))
			to_chat(user, "<span class='warning'>[I] is stuck to my hand!</span>")
			return
		to_chat(user, "<span class='info'>I add [I] to [src].</span>")
		to_grind = I
		return
	..()

/datum/crafting_recipe/roguetown/mortar
	name = "mortar"
	result = /obj/item/mortar
	reqs = list(/obj/item/natural/stone = 3)
	verbage = "crafts"
	time = 20
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/pestle
	name = "pestle"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 2)
	verbage = "crafts"
	time = 20
	skillcraft = /datum/skill/craft/masonry
