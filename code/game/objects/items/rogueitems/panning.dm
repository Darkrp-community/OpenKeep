/obj/item/panning
	name = "panning"
	icon_state = "iron"
	icon = 'icons/roguetown/items/panning.dmi'
	force = 5
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	obj_flags = CAN_BE_HIT
	var/mob/living/carbon/holder // Used to delete when dropped


/obj/item/panning/filter
	name = "panning"
	icon_state = "iron"
	icon = 'icons/roguetown/items/panning.dmi'
	force = 5
	throwforce = 10

//Trash Items: Essentially useless items that exists merely to occupy user's time. Exception only to Glass Shard.

/*
/obj/item/natural/panning/trash/New(var/loc, var/mob/living/carbon/user)
	..()
	holder = user
	START_PROCESSING(SSobj, src)
*/

/obj/item/natural/panning/trash/dropped(mob/user)
	visible_message("[src] is forsaken, as it must.")
	qdel(src)
	return

/obj/item/panning/trash/attack_self(mob/user)
	user.visible_message("[user] discards the trash.")
	qdel(src)
	return

/obj/item/natural/panning/trash/fishbones
	name = "Fish Bones"
	desc = "metal-infused bones from an bog fish."
	icon_state = "fishbones"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/natural/panning/trash/oldboots
	name = "old boots"
	desc = "old cloth boots, useless."
	icon_state = "boots"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/natural/panning/trash/seaweed
	name = "baneful seaweed"
	desc = "toxic and filled with dense metals. Useless."
	icon_state = "badseaweed"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/natural/panning/trash/corrodedmetal
	name = "corroded metal"
	desc = "powdery, worn and frail. Useless."
	icon_state = "corroded"
	icon = 'icons/roguetown/items/panning.dmi'

//Arrowheads can be broken into their source material (iron becomes bog iron) or used to craft new arrows.

/obj/item/panning/arrowhead/copper
	name = "copper arrowhead"
	desc = "old piece of sharp copper. The metal is green and brittle, but still recyclable."
	icon_state = "carrowhead"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/panning/arrowhead/iron
	name = "iron arrowhead"
	desc = "old piece of sharp iron. The impurities covering the surface kept it from rusting. Still usable."
	icon_state = "iarrowhead"
	icon = 'icons/roguetown/items/panning.dmi'

//Material Items

/obj/item/natural/panning/gravel
	name = "gravel"
	desc = "gravel from gravel beds, containing accumulations of heavy metallic minerals."
	icon_state = "gravel"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/panning/bone
	name = "bones"
	desc = "thick bones from an animal."
	icon_state = "bones"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/panning/coppernugget
	name = "copper nugget"
	desc = "small piece of impure malachite."
	icon_state = "malachite"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/panning/bogiron
	name = "bog iron"
	desc = "porous iron metal used only by struggling, marshland societies."
	icon_state = "japaneseiron"
	icon = 'icons/roguetown/items/panning.dmi'

//Casting place
/*
/datum/crafting_recipe/roguetown/sbait
	name = "sweetbait (b)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 2)
	req_table = TRUE
	subtype_reqs = TRUE

/datum/anvil_recipe/weapons/idagger
	name = "iron dagger"
	appro_skill = /datum/skill/craft/weaponsmithing
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/rogueweapon/huntingknife/idagger,
	/obj/item/rogueweapon/huntingknife/idagger)

/datum/crafting_recipe/roguetown/structure/barrel
	name = "wooden barrel"
	result = /obj/structure/fermenting_barrel/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage = "barrelmakes"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry



/datum/casting_recipe
	var/name
	var/list/additional_items = list()
	var/appro_skill = /datum/skill/craft/casting
	var/req_bar
	var/created_item

	var/needed_item
	var/needed_item_text
	var/quality_mod = 0
	var/progress

	var/datum/parent

/datum/anvil_recipe/New(datum/P, ...)
	parent = P
	. = ..()

/datum/anvil_recipe/proc/advance(mob/user)
	if(progress == 100)
		to_chat(user, "<span class='info'>It's ready.</span>")
		user.visible_message("<span class='warning'>[user] strikes the bar!</span>")
		return FALSE
	if(needed_item)
		to_chat(user, "<span class='info'>Now it's time to add a [needed_item_text].</span>")
		user.visible_message("<span class='warning'>[user] strikes the bar!</span>")
		return FALSE
	var/moveup = 1
	var/proab = 3
	if(user.mind)
		moveup = moveup + (user.mind.get_skill_level(appro_skill) * 6)
		if(!user.mind.get_skill_level(appro_skill))
			proab = 23
	if(prob(proab))
		moveup = 0
	progress = min(progress + moveup, 100)
	if(progress == 100)
		if(additional_items.len)
			needed_item = pick(additional_items)
			var/obj/item/I = new needed_item()
			needed_item_text = I.name
			qdel(I)
			additional_items -= needed_item
			progress = 0
	if(!moveup)
		if(prob(round(proab/2)))
			user.visible_message("<span class='warning'>[user] spoils the bar!</span>")
			if(parent)
				var/obj/item/P = parent
				qdel(P)
			return FALSE
		else
			user.visible_message("<span class='warning'>[user] strikes the bar!</span>")
			return FALSE
	else
		if(user.mind)
			if(isliving(user))
				var/mob/living/L = user
				var/amt2raise = L.STAINT/2
				if(amt2raise > 0)
					user.mind.adjust_experience(appro_skill, amt2raise, FALSE)
		user.visible_message("<span class='info'>[user] strikes the bar!</span>")
		return TRUE

/datum/anvil_recipe/proc/item_added(mob/user)
	needed_item = null
	user.visible_message("<span class='info'>[user] adds [needed_item_text]</span>")
	needed_item_text = null
*/

//temporary clay place

/obj/item/ceramic/messer
	name = "messer mold"
	desc = "mold to cast a single edged sword that is wider in the hilt and tapers gradually to the point."
	icon_state = "messerm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/speardagger
	name = "sharp blade mold"
	desc = "mold to cast a double edged blade to stab people at as a dagger, or as a spear with a stick."
	icon_state = "speardaggerm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/axe
	name = "axe mold"
	desc = "mold to cast a edged blade to chop people, or just trees."
	icon_state = "axem"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/arrowhead
	name = "arrowheads mold"
	desc = "mold to cast some edged blades to stab people at... in range."
	icon_state = "arrowheadm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/mace
	name = "mace mold"
	desc = "mold to cast a circle to be filled with a dense material for a mace, which can be added arrowheads for a bludgeon."
	icon_state = "macem"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/scalemold
	name = "scale mold"
	desc = "mold to cast individual scales that will be attached into a backing material."
	icon_state = "scalem"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/lamellarmold
	name = "lamellar mold"
	desc = "mold to cast small rectangular plates that will be attached in rows."
	icon_state = "lamellarm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/segmentatamold
	name = "segmentata mold"
	desc = "mold to cast overlapping metal strips that will attached to a fabric backing."
	icon_state = "segmentatam"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/cuirassmold
	name = "cuirass mold"
	desc = "mold to cast a cuirass. Very costy and heavy."
	icon_state = "cuirassm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/jambeaumold
	name = "jambeau mold"
	desc = "mold to cast a jambeau, to protect the tibia from being hendered useless."
	icon_state = "jambeaum"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/manica
	name = "manica armguard mold"
	desc = "mold to cast a curved and overlapping metal segments, to be fastened to leather straps"
	icon_state = "manicam"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/sode
	name = "sode pauldron mold"
	desc = "mold to cast a large, rectangular shoulder protection to protect against arrows, inefficient against melee weapons."
	icon_state = "sodem"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/crested
	name = "crested helm mold"
	desc = "mold to cast a helmet with crest running from front to back. You better find feathers somewhere."
	icon_state = "crestedm"
	icon = 'icons/roguetown/items/panning.dmi'

/obj/item/ceramic/ribbed
	name = "crested helm mold"
	desc = "a helmet with horizontal ridges encircling the helmet."
	icon_state = "ribbedm"
	icon = 'icons/roguetown/items/panning.dmi'
