/obj/machinery/dye_bin
	name = "expensive dye bin"
	desc = "Precious extracts, oils, powders, will transform your plain clothes to displays of wealth and extravagance!"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "dye_bin_full"
	density = TRUE
	anchored = FALSE
	max_integrity = 80
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	var/atom/movable/inserted
	var/activecolor = "#FFFFFF"
	/// Allow holder'd mobs
	var/allow_mobs = TRUE
	var/list/allowed_types = list(
			/obj/item/clothing/suit/roguetown/shirt/robe,
			/obj/item/clothing/suit/roguetown/shirt/dress,
			/obj/item/clothing/suit/roguetown/shirt/undershirt,
			/obj/item/clothing/suit/roguetown/shirt/shortshirt,
			/obj/item/clothing/suit/roguetown/shirt/tunic,
			/obj/item/clothing/under/roguetown/tights,
			/obj/item/clothing/cloak/raincloak,
			/obj/item/clothing/cloak/cape,
			/obj/item/clothing/cloak/half,
			/obj/item/clothing/head/roguetown/roguehood,
			/obj/item/clothing/head/roguetown/headband,
			/obj/item/clothing/head/roguetown/armingcap,
			/obj/item/clothing/head/roguetown/chaperon,
			/obj/item/clothing/head/roguetown/cookhat,
			/obj/item/clothing/neck/roguetown/coif/cloth,
			/obj/item/clothing/cloak/apron/cook,
			/obj/item/clothing/cloak/apron/waist,
			/obj/item/storage/belt/rogue/leather/rope,
			/obj/item/storage/belt/rogue/leather/cloth,
			/obj/item/clothing/shoes/roguetown/simpleshoes,
			/obj/item/clothing/suit/roguetown/armor/gambeson,
			/obj/item/clothing/suit/roguetown/armor/gambeson/light,
			/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			)
	var/static/list/selectable_colors = list(
		"White" ="#ffffff",
		"Ash Grey" ="#999999",
		"Chalk White" ="#c7c0b5",
		"Cream" ="#b0ae80",
		"Blood Red" ="#5d1d1d",
		"Royal Purple" ="#4c305e",
		"Dark Ink" ="#392f2f",
		"Forest Green" ="#336022",
		"Sky Blue" ="#203459",
		"Mustard Yellow" ="#76740c",
		"Teal" ="#244f4a",
		"Fyritius Orange" ="#85521b",
		"Majenta" ="#5a1c38",
		"Salmon" ="#603f49",
		"Russet" ="#7a4c29",
		"Chestnut" ="#5f3d21",
		"Yellow Ochre" ="#6b550d",
		"Red Ochre" = "#5e2c28",
		"Maroon" ="#5a1010"
		)


/obj/machinery/dye_bin/Destroy()
	inserted?.forceMove(drop_location())
	return ..()

/obj/machinery/dye_bin/Destroy()
	icon_state = "washbin_destroy"
	density = FALSE
	GLOB.machines.Remove(src)
	if(!speed_process)
		STOP_PROCESSING(SSmachines, src)
	else
		STOP_PROCESSING(SSfastprocess, src)
	dropContents()
	playsound(get_turf(src), 'sound/combat/hits/onwood/destroywalldoor.ogg', 40, TRUE, -1)
	return ..()

/obj/machinery/dye_bin/attackby(obj/item/I, mob/living/user)
	if(allow_mobs && istype(I, /obj/item/clothing/head/mob_holder))
		var/obj/item/clothing/head/mob_holder/H = I
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>[I] is stuck to your hand!</span>")
			return
		if(!QDELETED(H))
			H.release()

	if(is_type_in_list(I, allowed_types) && is_operational())
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>[I] is stuck to your hand!</span>")
			return
		user.visible_message("<span class='notice'>[user] inserts [I] into [src]'s receptable.</span>")

		inserted = I
	else
		return ..()

/obj/machinery/dye_bin/AllowDrop()
	return FALSE

/obj/machinery/dye_bin/ui_interact(mob/user)
	if( user.used_intent.type == /datum/intent/grab )
		return
	if( user.used_intent.type == /datum/intent/unarmed/shove )
		return ..()
	if(!is_operational())
		return ..()
	user.set_machine(src)
	var/list/dat = list("<TITLE>Dye Station Control Panel</TITLE><BR>")
	if(!inserted)
		dat += "No item inserted."
	else
		dat += "Item inserted: [inserted]<HR>"
		dat += "<A href='?src=\ref[src];select=1'>Select new color.</A><BR>"
		dat += "Color: <font color='[activecolor]'>&#9899;</font>"
		dat += "<A href='?src=\ref[src];paint=1'>Apply new dye.</A><BR><BR>"
		dat += "<A href='?src=\ref[src];clear=1'>Bleach out the color.</A><BR><BR>"
		dat += "<A href='?src=\ref[src];eject=1'>Remove item.</A><BR><BR>"

	var/datum/browser/menu = new(user, "colormate","Dye Station", 400, 400, src)
	menu.set_content(dat.Join(""))
	menu.open()

/obj/machinery/dye_bin/Topic(href, href_list)
	if((. = ..()))
		return

	add_fingerprint(usr)

	if(href_list["close"])
		usr << browse(null, "window=colormate")
		return

	if(href_list["select"])
		var/choice = input(usr,"Choose your dye:","Dyes",null) as null|anything in selectable_colors
		if(!choice)
			return
		activecolor = selectable_colors[choice]
		updateUsrDialog()

	if(href_list["paint"])
		if(!inserted)
			return
		inserted.add_atom_colour(activecolor, FIXED_COLOUR_PRIORITY)
		playsound(src, "bubbles", 50, 1)
		updateUsrDialog()

	if(href_list["clear"])
		if(!inserted)
			return
		inserted.remove_atom_colour(FIXED_COLOUR_PRIORITY)
		playsound(src, "bubbles", 50, 1)
		updateUsrDialog()

	if(href_list["eject"])
		if(!inserted)
			return
		inserted.forceMove(drop_location())
		inserted = null
		updateUsrDialog()






/obj/machinery/simple_dye_bin
	name = "simple dye bin"
	desc = "A barrel with a selection of cheap things that will stain your clothes in muted colors. Ash, clods of dirt, jacksberries and swampweed provides all the colors any peasant could want!"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "dye_bin_full"
	density = TRUE
	anchored = FALSE
	max_integrity = 80
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	var/atom/movable/inserted
	var/activecolor = "#FFFFFF"
	/// Allow holder'd mobs
	var/allow_mobs = TRUE
	var/list/allowed_types = list(
			/obj/item/clothing/suit/roguetown/shirt/robe,
			/obj/item/clothing/suit/roguetown/shirt/dress,
			/obj/item/clothing/suit/roguetown/shirt/undershirt,
			/obj/item/clothing/suit/roguetown/shirt/shortshirt,
			/obj/item/clothing/suit/roguetown/shirt/tunic,
			/obj/item/clothing/under/roguetown/tights,
			/obj/item/clothing/cloak/raincloak,
			/obj/item/clothing/cloak/cape,
			/obj/item/clothing/cloak/half,
			/obj/item/clothing/head/roguetown/roguehood,
			/obj/item/clothing/head/roguetown/headband,
			/obj/item/clothing/head/roguetown/armingcap,
			/obj/item/clothing/head/roguetown/chaperon,
			/obj/item/clothing/head/roguetown/cookhat,
			/obj/item/clothing/neck/roguetown/coif/cloth,
			/obj/item/clothing/cloak/apron/cook,
			/obj/item/clothing/cloak/apron/waist,
			/obj/item/storage/belt/rogue/leather/rope,
			/obj/item/storage/belt/rogue/leather/cloth,
			/obj/item/clothing/shoes/roguetown/simpleshoes,
			/obj/item/clothing/suit/roguetown/armor/gambeson,
			/obj/item/clothing/suit/roguetown/armor/gambeson/light,
			/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
			)
	var/static/list/selectable_colors = list(
		"White" ="#ffffff",
		"Ash Grey" ="#999999",
		"Chalk White" ="#c7c0b5",
		"Cream" ="#b0ae80",
		"Soot Black" ="#4b4b50",
		"Winestain Red" ="#5a3232",
		"Berry Blue" ="#363f4f",
		"Pear Yellow" ="#545530",
		"Bark Brown"="#483931",
		"Peasant Brown" ="#422c26",
		"Mud Brown" ="#4c4636",
		"Spring Green" ="#2d3f30",
		"Bog Green" ="#475335"
		)

/obj/machinery/simple_dye_bin/Destroy()
	inserted?.forceMove(drop_location())
	return ..()

/obj/machinery/simple_dye_bin/Destroy()
	icon_state = "washbin_destroy"
	density = FALSE
	GLOB.machines.Remove(src)
	if(!speed_process)
		STOP_PROCESSING(SSmachines, src)
	else
		STOP_PROCESSING(SSfastprocess, src)
	dropContents()
	playsound(get_turf(src), 'sound/combat/hits/onwood/destroywalldoor.ogg', 40, TRUE, -1)
	return ..()

/obj/machinery/simple_dye_bin/attackby(obj/item/I, mob/living/user)
	if(allow_mobs && istype(I, /obj/item/clothing/head/mob_holder))
		var/obj/item/clothing/head/mob_holder/H = I
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>[I] is stuck to your hand!</span>")
			return
		if(!QDELETED(H))
			H.release()

	if(is_type_in_list(I, allowed_types) && is_operational())
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>[I] is stuck to your hand!</span>")
			return
		user.visible_message("<span class='notice'>[user] inserts [I] into [src]'s receptable.</span>")

		inserted = I
	else
		return ..()

/obj/machinery/simple_dye_bin/AllowDrop()
	return FALSE

/obj/machinery/simple_dye_bin/ui_interact(mob/user)
	if( user.used_intent.type == /datum/intent/grab )
		return
	if( user.used_intent.type == /datum/intent/unarmed/shove )
		return ..()
	if(!is_operational())
		return ..()
	user.set_machine(src)
	var/list/dat = list("<TITLE>Dye Station Control Panel</TITLE><BR>")
	if(!inserted)
		dat += "No item inserted."
	else
		dat += "Item inserted: [inserted]<HR>"
		dat += "<A href='?src=\ref[src];select=1'>Select new color.</A><BR>"
		dat += "Color: <font color='[activecolor]'>&#9899;</font>"
		dat += "<A href='?src=\ref[src];paint=1'>Apply new dye.</A><BR><BR>"
		dat += "<A href='?src=\ref[src];clear=1'>Bleach out the color.</A><BR><BR>"
		dat += "<A href='?src=\ref[src];eject=1'>Remove item.</A><BR><BR>"

	var/datum/browser/menu = new(user, "colormate","Dye Station", 400, 400, src)
	menu.set_content(dat.Join(""))
	menu.open()

/obj/machinery/simple_dye_bin/Topic(href, href_list)
	if((. = ..()))
		return

	add_fingerprint(usr)

	if(href_list["close"])
		usr << browse(null, "window=colormate")
		return

	if(href_list["select"])
		var/choice = input(usr,"Choose your dye:","Dyes",null) as null|anything in selectable_colors
		if(!choice)
			return
		activecolor = selectable_colors[choice]
		updateUsrDialog()

	if(href_list["paint"])
		if(!inserted)
			return
		inserted.add_atom_colour(activecolor, FIXED_COLOUR_PRIORITY)
		playsound(src, "bubbles", 50, 1)
		updateUsrDialog()

	if(href_list["clear"])
		if(!inserted)
			return
		inserted.remove_atom_colour(FIXED_COLOUR_PRIORITY)
		playsound(src, "bubbles", 50, 1)
		updateUsrDialog()

	if(href_list["eject"])
		if(!inserted)
			return
		inserted.forceMove(drop_location())
		inserted = null
		updateUsrDialog()
