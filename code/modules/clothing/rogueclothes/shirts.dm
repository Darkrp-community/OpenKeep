/obj/item/clothing/suit/roguetown/shirt
	slot_flags = ITEM_SLOT_SHIRT
	body_parts_covered = CHEST|VITALS
	prevent_crits = list(BCLASS_LASHING)
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	sleevetype = "shirt"
	edelay_type = 1
	equip_delay_self = 25
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	sewrepair = TRUE
	anvilrepair = null
	smeltresult = /obj/item/ash

/obj/item/clothing/suit/roguetown/shirt/undershirt
	name = "shirt"
	desc = ""
	icon_state = "undershirt"
	item_state = "undershirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	name = "undervestments"
	desc = ""
	icon_state = "priestunder"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'

/obj/item/clothing/suit/roguetown/shirt/undershirt/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/undershirt/lord
	desc = ""
	color = "#616898"

/obj/item/clothing/suit/roguetown/shirt/undershirt/red
	color = "#851a16"

/obj/item/clothing/suit/roguetown/shirt/undershirt/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/green
	color = "#3c693c"

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()


/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/lordcolor(primary,secondary)
	if(secondary)
		color = secondary

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	name = "formal silks"
	icon_state = "puritan_shirt"
	allowed_race = list("human", "tiefling", "elf", "dwarf", "aasimar")

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	icon_state = "sailorblues"

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	icon_state = "sailorreds"

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_LEFT|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_RIGHT|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt
	name = "shirt"
	desc = "A simple shirt."
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/shortshirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	name = "shirt"
	desc = ""
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_TORN
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/shadowshirt
	name = "silk shirt"
	desc = "A sleeveless shirt woven of glossy material."
	icon_state = "shadowshirt"
	item_state = "shadowshirt"
	r_sleeve_status = SLEEVE_TORN
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|VITALS
	allowed_race = list("elf", "dark elf")

/obj/item/clothing/suit/roguetown/shirt/rags
	slot_flags = ITEM_SLOT_ARMOR
	name = "rags"
	desc = "Better than going naked? You be the judge."
	body_parts_covered = CHEST|GROIN|VITALS
	color = "#b0b0b0"
	icon_state = "rags"
	item_state = "rags"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/tunic
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "tunic"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	boobed = FALSE
	icon_state = "tunic"
	item_state = "undershirt"
	sleevetype = "tunic"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/tunic/green
	color = CLOTHING_GREEN

/obj/item/clothing/suit/roguetown/shirt/tunic/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/tunic/red
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/tunic/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/tunic/ucolored
	color = COLOR_GRAY

/obj/item/clothing/suit/roguetown/shirt/tunic/random/Initialize()
	color = pick(CLOTHING_PURPLE, CLOTHING_RED, CLOTHING_BLUE, CLOTHING_GREEN)
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/tunicprimary
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/tunic/tunicprimary/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/tunic/tunicprimary/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dress"
	item_state = "dress"
	allowed_sex = list(FEMALE)
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/dress/gen
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dressgen"
	item_state = "dressgen"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/brown
	color = "#6b5445"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/green
	color = "#3c693c"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/maid
	color = COLOR_RED

/obj/item/clothing/suit/roguetown/shirt/dress/gen/maid/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/gen/maid/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress/gen/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f", CLOTHING_BLUE)
	..()

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "chemise"
	desc = "Comfortable yet elegant, it offers both style and comfort for everyday wear"
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "silkdress"
	item_state = "silkdress"
	color = "#e6e5e5"

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess
	color = CLOTHING_WHITE

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/princess/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random/Initialize()
	color = pick("#e6e5e5", "#52BE80", "#C39BD3", "#EC7063","#5DADE2")
	..()

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/silkdressprimary
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/silkdressprimary/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/silkdressprimary/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = null
	icon_state = "sexydress"
	item_state = "sexydress"
	sleevetype = null
	sleeved = null
	color = "#a90707"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/Initialize()
	color = pick("#a90707", "#16239a", "#d68fbd", CLOTHING_BLACK)
	..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/webs
	name = "webbed shirt"
	desc = "Exotic silk finely woven into.. this? Might as well be wearing a spiderweb."
	icon_state = "webs"
	item_state = "webs"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS
	color = null


/obj/item/clothing/suit/roguetown/shirt/jester
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "jester's tunick"
	desc = "Just remember that the last laugh is on you."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "jestershirt"
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/shirts.dmi'
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "grenzelhoftian hip-shirt"
	desc = "A true fashion statement worn by Grenzelhoftian swordsmen."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	armor = list("melee" = 20, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "grenzelshirt"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_WHITE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	var/picked = FALSE
	colorgrenz = TRUE

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/proc/get_player_input()
	if(!ishuman(loc))
		return

	var/list/colors = list(
	"PURPLE"="#865c9c",
	"RED"="#933030",
	"BROWN"="#685542",
	"GREEN"="#79763f",
	"BLUE"="#395480",
	"YELLOW"="#b5b004",
	"TEAL"="#249589",
	"WHITE"="#ffffff",
	"ORANGE"="#b86f0c",
	"MAJENTA"="#962e5c")
	var/mob/living/carbon/human/L = loc
	var/choice = input(L, "Choose a color.", "GRENZELHOFTIAN COLORPLEX") as anything in colors
	var/playerchoice = colors[choice]
	picked = TRUE
	detail_color = playerchoice
	update_icon()
	for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
		testing("clothes to color are [V]")
		if(V.colorgrenz)
			V.detail_color = playerchoice
			V.update_icon()
	L.regenerate_icons()

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/Initialize()
	. = ..()
	if(!picked)
		INVOKE_ASYNC(src, PROC_REF(get_player_input))

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


///////////////////////////////////////////////////////////////////
// Part of Kaizoku project. Usage ONLY for Stonekeep/Warmonger,  //
// If the usage is desired, ask monochrome9090 for permission.   //
// Respect the artists's will, COMMISSION them instead.          //
// This is solely for SPRITES. The code is free for the taking.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/roguetown/shirt/kaizoku
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono
	name = "traditional kimono"
	desc = "A front-wrapped garment with long sleeves made from a long, narrow bolt of cloth used as a formal garment by the poor and rich alike."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "kimono"
	item_state = "kimono"
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono/ronin
	color = "#526652"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono/dark
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kimono/kabukimono
	color = "#9b874f"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/monkgarb
	name = "monk samue"
	desc = "The Samue is the clothing used by Abyssanctum monks engaged on the act of Samu, most proper for those performing temple maintenance and mountain hiking."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "monkgarb"
	item_state = "monkgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/kaizoku/monkgarb/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo //I know this is actually a Kataginu, but it is know more as 'Kamishimo', even if lacking a Hakama. Because HAKAMA is its own thing here.
	name = "kataginu"
	desc = "A formal kimono used by men, a short sleeveless garment made of hemp which usually comes together with a hakama, and worn on top of a kosode or kimono. To use one without cloth underneath, conveys a ronin nature."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	icon_state = "kamishimo"
	item_state = "kamishimo"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo/ronin
	color = "#526652"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo/eidolon
	color = "#613a3f"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	name = "kimono jinbei"
	desc = "A summer shirt that goes along with a tobi, used during the hot summers on Fog islands."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "looseshirt"
	item_state = "looseshirt"
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/shinobi
	color = "#372161"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/dragonslayer
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	resistance_flags = FIRE_PROOF | ACID_PROOF
	color = "#7e0707"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/tribal
	name = "tribal garbs"
	desc = "Tribal clothings made from plant fiber commonly used by Undine tribesmen."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "tribalgarb"
	item_state = "tribalgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian
	name = "onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare, holding the marks of Abyssor upon the cloth."
	icon_state = "abyssaltunic"
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	allowed_race = list("human", "tiefling", "aasimar", "abyssariad")
	color = null
	sellprice = 100

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/thunder
	name = "thunder onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in yellow for the mountainous magicians and monks who praises Abyssor's thunders."
	color = "#be8b48"

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/storm
	name = "storm onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in dark blue for the lighthouse keepers of Abyssanctum's faith, who keeps the eternal fire going."
	color = "#1a2677"

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/ocean
	name = "ocean onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare.  Marked in light blue for the expeditionary magicians and monks of Abyssanctum's faith, long married to the ocean."
	color = "#56928a"

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/island
	name = "island onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in red for the soilgazers of Abyssanctum's faith, those bent in ensuring no plague shall reach their blessed islands. "
	color = "#bd3541"

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe
	slot_flags = ITEM_SLOT_ARMOR
	name = "onmyoji's garb"
	desc = "Casual abyssariad garbs usually used by magicians, or those living on the frigid, treacherous mountains on the edges of the Fog islands."
	icon_state = "loosetunic"
	icon = 'icons/roguetown/kaizoku/clothingicon/shirt.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/shirt.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE)
	allowed_race = list("human", "tiefling", "aasimar", "abyssariad")
	color = null

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/zamurai/Initialize()
	..()
	var/picked
	if(!picked)
		var/list/colors = list(
		"PURPLE"="#865c9c",
		"RED"="#933030",
		"BROWN"="#685542",
		"GREEN"="#79763f",
		"BLUE"="#395480",
		"YELLOW"="#b5b004",
		"TEAL"="#249589",
		"WHITE"="#ffffff",
		"ORANGE"="#b86f0c",
		"MAJENTA"="#962e5c")

		var/mob/living/carbon/human/L = loc
		var/choice = input(L, "Choose a color.", "ZAMURAI COLORPLEX") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		update_icon()
		for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
			testing("clothes to color are [V]")
			if(V.colorgrenz)
				V.detail_color = playerchoice
				V.update_icon()
		L.regenerate_icons()

/obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/zamurai/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)
