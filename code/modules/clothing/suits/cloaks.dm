//Cloaks. No, not THAT kind of cloak.

/obj/item/clothing/neck/cloak
	name = "brown cloak"
	desc = ""
	icon = 'icons/obj/clothing/cloaks.dmi'
	icon_state = "qmcloak"
	item_state = "qmcloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	flags_inv = HIDESUITSTORAGE

/obj/item/clothing/neck/cloak/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is strangling [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(OXYLOSS)

/obj/item/clothing/neck/cloak/hos
	name = "head of security's cloak"
	desc = ""
	icon_state = "hoscloak"

/obj/item/clothing/neck/cloak/qm
	name = "quartermaster's cloak"
	desc = ""

/obj/item/clothing/neck/cloak/cmo
	name = "chief medical officer's cloak"
	desc = ""
	icon_state = "cmocloak"

/obj/item/clothing/neck/cloak/ce
	name = "chief engineer's cloak"
	desc = ""
	icon_state = "cecloak"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/cloak/rd
	name = "research director's cloak"
	desc = ""
	icon_state = "rdcloak"

/obj/item/clothing/neck/cloak/cap
	name = "captain's cloak"
	desc = ""
	icon_state = "capcloak"

/obj/item/clothing/neck/cloak/hop
	name = "head of personnel's cloak"
	desc = ""
	icon_state = "hopcloak"

/obj/item/clothing/suit/hooded/cloak/goliath
	name = "goliath cloak"
	icon_state = "goliath_cloak"
	desc = ""
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/pickaxe, /obj/item/twohanded/spear, /obj/item/organ/regenerative_core/legion, /obj/item/kitchen/knife/combat/bone, /obj/item/kitchen/knife/combat/survival)
	armor = list("melee" = 35, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60) //a fair alternative to bone armor, requiring alternative materials and gaining a suit slot
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/goliath
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/head/hooded/cloakhood/goliath
	name = "goliath cloak hood"
	icon_state = "golhood"
	desc = ""
	armor = list("melee" = 35, "bullet" = 10, "laser" = 25, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 60, "acid" = 60)
	clothing_flags = SNUG_FIT
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR|HIDEFACIALHAIR
	transparent_protection = HIDEMASK

/obj/item/clothing/suit/hooded/cloak/drake
	name = "drake armour"
	icon_state = "dragon"
	desc = ""
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/pickaxe, /obj/item/twohanded/spear)
	armor = list("melee" = 70, "bullet" = 30, "laser" = 50, "energy" = 40, "bomb" = 70, "bio" = 60, "rad" = 50, "fire" = 100, "acid" = 100)
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/drake
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	transparent_protection = HIDEGLOVES|HIDESUITSTORAGE|HIDEJUMPSUIT|HIDESHOES

/obj/item/clothing/head/hooded/cloakhood/drake
	name = "drake helm"
	icon_state = "dragon"
	desc = ""
	armor = list("melee" = 70, "bullet" = 30, "laser" = 50, "energy" = 40, "bomb" = 70, "bio" = 60, "rad" = 50, "fire" = 100, "acid" = 100)
	clothing_flags = SNUG_FIT
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/cloak/raincloak/mino
	name = "mino cloak"
	desc = "An abyssariad raincoat made out of straw that covers the entire body."
	icon_state = "mino"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'

/obj/item/clothing/cloak/raincloak/guardiancloak
	name = "guardian cloak"
	desc = "The design of cloaks from Guardians of old. The symbol of the Eternity Eagle remains binding the cloth on the user, for those who protects the skies and oceans."
	icon_state = "guardiancloak"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'

/obj/item/clothing/cloak/raincloak/guardiancloak/black
	color = CLOTHING_SOOT_BLACK

/obj/item/clothing/cloak/raincloak/guardiancloak/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/cloak/raincloak/guardiancloak/red
	color = CLOTHING_BLOOD_RED

/obj/item/clothing/cloak/raincloak/guardiancloak/guard
	color = CLOTHING_BLOOD_RED

/obj/item/clothing/cloak/raincloak/guardiancloak/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src
/obj/item/clothing/cloak/raincloak/guardiancloak/lordcolor(primary,secondary)
	color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
/obj/item/clothing/cloak/raincloak/guardiancloak/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/raincloak/horocloak
	name = "horo cloak"
	desc = "A billowing cloak of war designed to catch the wind and scatter arrows that hit its user from the back."
	icon_state = "horocloak"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'

/obj/item/clothing/cloak/raincloak/horocloak/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/cloak/raincloak/horocloak/toweryakko
	color = "#804d97"

/obj/item/clothing/cloak/raincloak/horocloak/kabukimono
	color = "#9b874f"

/obj/item/clothing/cloak/odoshisohei
	name = "senior sohei odoshi"
	desc = "Tightly packed lacing patterns usually used for binding leather and metal scales, now used to show affiliation to clans or shrines."
	icon_state = "odoshisohei"
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	slot_flags = ITEM_SLOT_CLOAK
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/haramaki
	name = "haramaki"
	icon_state = "haramaki"
	desc = "Tightly packed lacing patterns usually used for binding leather and metal scales."
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	var/picked

/obj/item/clothing/cloak/haramaki/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/haramaki/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Select a design.","Tabard Design") as null|anything in list("None", "Symbol", "Split", "Quadrants", "Boxes", "Diamonds", "Middle-split")
	if(!design)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	if(design == "Symbol")
		design = null
		design = input(user, "Select a symbol.","Tabard Design") as null|anything in list("chalice","psy","peace","z","imp","skull","widow","arrow")
		if(!design)
			return
		design = "_[design]"
	var/colorone = input(user, "Select a primary color.","Tabard Design") as null|anything in CLOTHING_COLOR_NAMES
	if(!colorone)
		return
	var/colortwo
	if(design != "None")
		colortwo = input(user, "Select a primary color.","Tabard Design") as null|anything in CLOTHING_COLOR_NAMES
		if(!colortwo)
			return
	if(world.time > (the_time + 30 SECONDS))
		return
	picked = TRUE
	if(design != "None")
		detail_tag = design
	switch(design)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
		if("Middle-split")
			detail_tag = "_spl2"
	color = clothing_color2hex(colorone)
	if(colortwo)
		detail_color = clothing_color2hex(colortwo)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/haramaki/odoshi
	name = "odoshi"
	icon_state = "odoshi"

/obj/item/clothing/cloak/newheartfelt
	name = "heartfelt cloak"
	desc = "Luxurious silk cloak adorned in regal red, the protective garment that has long portrayed the fiery spirit of the Heartfelt people, and their dutiful lords."
	icon_state = "heartfelt_cloak"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	allowed_sex = list(MALE, FEMALE)
	allowed_race = list("human", "tiefling", "aasimar", "abyssariad")
	sellprice = 50
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/jinbaori
	name = "jinbaori"
	icon_state = "jinbaori"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	sleeved = 'icons/roguetown/kaizoku/clothing/cloaks.dmi'
	icon = 'icons/roguetown/kaizoku/clothingicon/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	var/picked

/obj/item/clothing/cloak/jinbaori/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/jinbaori/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Select a design.","Tabard Design") as null|anything in list("None", "Split", "Quadrants", "Boxes", "Diamonds", "Middle-split")
	if(!design)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	if(design == "Symbol")
		design = null
		design = input(user, "Select a symbol.","Tabard Design") as null|anything in list("chalice","psy","peace","z","imp","skull","widow","arrow")
		if(!design)
			return
		design = "_[design]"
	var/colorone = input(user, "Select a primary color.","Tabard Design") as null|anything in CLOTHING_COLOR_NAMES
	if(!colorone)
		return
	var/colortwo
	if(design != "None")
		colortwo = input(user, "Select a primary color.","Tabard Design") as null|anything in CLOTHING_COLOR_NAMES
		if(!colortwo)
			return
	if(world.time > (the_time + 30 SECONDS))
		return
	picked = TRUE
	if(design != "None")
		detail_tag = design
	switch(design)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
		if("Middle-split")
			detail_tag = "_spl2"
	color = clothing_color2hex(colorone)
	if(colortwo)
		detail_color = clothing_color2hex(colortwo)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/jinbaori/guard
	desc = "A jinbaori with the lord's heraldic colors. This one is worn typically by ashigarus retainers adquired by the lords of rockhill from a pact with the Fog Islands."
	color = CLOTHING_BLOOD_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PLUM_PURPLE

/obj/item/clothing/cloak/jinbaori/raider
	name = "raider jinbaori"
	desc = "A jinbaori used by the traditional abyssanctum ashigaru retainers. Relentless as the ocean who brew them."
	color = CLOTHING_DARK_INK
	detail_tag = "_spl"
	detail_color = CLOTHING_ROYAL_PURPLE

/obj/item/clothing/cloak/jinbaori/guard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Select a design.","Tabard Design") as null|anything in list("Split", "Quadrants", "Boxes", "Diamonds", "Middle-split")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	picked = TRUE
	switch(chosen)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
		if("Middle-split")
			detail_tag = "_spl2"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/jinbaori/guard/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/haramaki/odoshi/zamurai
	desc = "The odoshi used by Foglander Zamurais bond to Rockhill's lords. It uses said lord's heraldic colors."
	color = CLOTHING_BLOOD_RED
	detail_tag = "_spl2"
	detail_color = CLOTHING_PLUM_PURPLE

/obj/item/clothing/cloak/haramaki/odoshi/zamurai/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Select a design.","Tabard Design") as null|anything in list("Split", "Quadrants", "Boxes", "Diamonds", "Middle-split")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	picked = TRUE
	switch(chosen)
		if("Split")
			detail_tag = "_spl"
		if("Quadrants")
			detail_tag = "_quad"
		if("Boxes")
			detail_tag = "_box"
		if("Diamonds")
			detail_tag = "_dim"
		if("Middle-split")
			detail_tag = "_spl2"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/haramaki/odoshi/zamurai/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/haramaki/odoshi/zamurai/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/haramaki/odoshi/zamurai/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/haramaki/odoshi/zamurai/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/haramaki/odoshi/toweryakko
	color = "#804d97"

/obj/item/clothing/cloak/haramaki/odoshi/toweryakko/attack_right(mob/user)
	return

/obj/item/clothing/cloak/haramaki/odoshi/raider
	name = "raider odoshi"
	desc = "A odoshi used by the traditional abyssanctum zamurai retainers. Relentless as the ocean who brew them."
	color = CLOTHING_DARK_INK
	detail_tag = "_spl"
	detail_color = CLOTHING_ROYAL_PURPLE

/obj/item/clothing/cloak/raincloak/guardiancloak/dragonslayer
	name = "dragonslayer guardian cloak"
	desc = "Fireproof asbestos cloak processed in copal and frankincense resin, enclosed within dragonscales to prevent direct contact with asbestos fibers. The cloak almost completely prevents warmth from reaching the user."
	edelay_type = 4
	equip_delay_self = 20
	heat_protection = FULL_BODY
	body_parts_covered = FULL_BODY
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	color = "#7e0707"
