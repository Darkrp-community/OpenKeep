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
			/obj/item/clothing/neck/roguetown/keffiyeh,
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
		"Dark Ink" ="#372b2b",
		"Royal Black" ="#2f352f",
		"Winestain Red" ="#6b3737",
		"Blood Red" ="#770d0d",
		"Royal Red" ="#8f3636",
		"Royal Majenta" ="#822b52",
		"Red Ochre" = "#6f2d28",
		"Maroon" ="#672c0d",
		"Salmon" ="#a56176",
		"Russet" ="#733f18",
		"Peasant Brown" ="#705243",
		"Chestnut" ="#5f3d21",

		"Bark Brown"="#685542",
		"Mud Brown" ="#685542",
		"Old Leather" ="#473a30",
		"Spring Green" ="#435436",
		"Forest Green" ="#3f8b24",
		"Bog Green" ="#58793f",
		"Mage Green" ="#759259",
		"Royal Teal" ="#249589",
		"Berry Blue" ="#38455b",
		"Pear Yellow" ="#b5b004",
		"Mage Yellow" ="#d2bc2b",
		"Mustard Yellow" ="#979044",
		"Yellow Ochre" ="#9b7a02",
		"Fyritius Orange" ="#b47011",
		"Mage Orange" ="#ad5e29",
		"Royal Purple" ="#865c9c",
		"Plum Purple" ="#4b2265",
		"Mage Blue" ="#4756d8",
		"Sky Blue" ="#1b3c7a",
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
		if(inserted)
			user.visible_message("<span class='notice'>[src] is already full.</span>")
			return
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>[I] is stuck to your hand!</span>")
			return
		user.visible_message("<span class='notice'>[user] inserts [I] into [src].</span>")

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

/obj/machinery/dye_bin/onkick(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(prob(L.STASTR * 8))
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message("<span class='warning'>[user] kicks over [src], ruining the contents!</span>", \
				"<span class='warning'>I kick over [src], ruining the contents!</span>")
			var/obj/item/roguebin/I = new /obj/item/roguebin (loc)
			I.kover = TRUE
			I.update_icon()
			qdel(src)

		else
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message("<span class='warning'>[user] kicks [src]!</span>", \
				"<span class='warning'>I kick [src]!</span>")


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
			/obj/item/clothing/neck/roguetown/keffiyeh,
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
		"Royal Black" ="#2f352f",
		"Winestain Red" ="#6b3737",
		"Royal Red" ="#8f3636",
		"Royal Majenta" ="#822b52",
		"Peasant Brown" ="#705243",
		"Chestnut" ="#5f3d21",
		"Bark Brown"="#685542",
		"Mud Brown" ="#685542",
		"Old Leather" ="#473a30",
		"Spring Green" ="#435436",
		"Bog Green" ="#58793f",
		"Royal Teal" ="#249589",
		"Berry Blue" ="#38455b",
		"Pear Yellow" ="#b5b004",
		"Fyritius Orange" ="#b47011",
		"Royal Purple" ="#865c9c"
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
	if(istype(I, /obj/item/luxury_dyes))
		playsound(src, "bubbles", 50, 1)
		if(do_after(user, 3 SECONDS))
			user.visible_message("<span class='notice'>[user] adds the [I].</span>")
			new /obj/machinery/dye_bin(get_turf(src.loc))
			qdel(I)
			qdel(src)

	if(allow_mobs && istype(I, /obj/item/clothing/head/mob_holder))
		var/obj/item/clothing/head/mob_holder/H = I
		if(inserted)
			user.visible_message("<span class='notice'>[src] is already full.</span>")
			return
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



/obj/machinery/simple_dye_bin/onkick(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(prob(L.STASTR * 8))
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message("<span class='warning'>[user] kicks over [src], ruining the contents!</span>", \
				"<span class='warning'>I kick over [src], ruining the contents!</span>")
			var/obj/item/roguebin/I = new /obj/item/roguebin (loc)
			I.kover = TRUE
			I.update_icon()
			qdel(src)

		else
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message("<span class='warning'>[user] kicks [src]!</span>", \
				"<span class='warning'>I kick [src]!</span>")
