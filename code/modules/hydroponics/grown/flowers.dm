/obj/item/reagent_containers/food/snacks/grown/poppy
//	seed = /obj/item/seeds/poppy
	name = "poppy"
	desc = ""
	icon_state = "poppy"
	slot_flags = ITEM_SLOT_HEAD
	filling_color = "#FF6347"
	bitesize_mod = 3
	foodtype = VEGETABLES | GROSS
	distill_reagent = /datum/reagent/consumable/ethanol/vermouth

/obj/item/reagent_containers/food/snacks/grown/poppy/lily
//	seed = /obj/item/seeds/poppy/lily
	name = "lily"
	desc = ""
	icon_state = "lily"
	filling_color = "#FFA500"

/obj/item/reagent_containers/food/snacks/grown/trumpet
//	seed = /obj/item/seeds/poppy/lily/trumpet
	name = "spaceman's trumpet"
	desc = ""
	icon_state = "spacemanstrumpet"
	filling_color = "#FF6347"
	bitesize_mod = 3
	foodtype = VEGETABLES

/obj/item/reagent_containers/food/snacks/grown/poppy/geranium
//	seed = /obj/item/seeds/poppy/geranium
	name = "geranium"
	desc = ""
	icon_state = "geranium"
	filling_color = "#008B8B"


/obj/item/reagent_containers/food/snacks/grown/harebell
//	seed = /obj/item/seeds/harebell
	name = "harebell"
	desc = ""
	icon_state = "harebell"
	slot_flags = ITEM_SLOT_HEAD
	filling_color = "#E6E6FA"
	bitesize_mod = 3
	distill_reagent = /datum/reagent/consumable/ethanol/vermouth

/obj/item/reagent_containers/food/snacks/grown/moonflower
//	seed = /obj/item/seeds/sunflower/moonflower
	name = "moonflower"
	desc = ""
	icon_state = "moonflower"
	slot_flags = ITEM_SLOT_HEAD
	filling_color = "#E6E6FA"
	bitesize_mod = 2
	distill_reagent = /datum/reagent/consumable/ethanol/absinthe //It's made from flowers.


/obj/item/grown/novaflower
//	seed = /obj/item/seeds/sunflower/novaflower
	name = "novaflower"
	desc = ""
	icon_state = "novaflower"
	lefthand_file = 'icons/mob/inhands/weapons/plants_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/plants_righthand.dmi'
	damtype = "fire"
	force = 0
	slot_flags = ITEM_SLOT_HEAD
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3
	attack_verb = list("roasted", "scorched", "burned")
	grind_results = list(/datum/reagent/consumable/capsaicin = 0, /datum/reagent/consumable/condensedcapsaicin = 0)


/obj/item/grown/novaflower/attack(mob/living/carbon/M, mob/user)
	if(!..())
		return
	if(isliving(M))
		to_chat(M, "<span class='danger'>I are lit on fire from the intense heat of the [name]!</span>")
	//	M.adjust_fire_stacks(seed.potency / 20)
		if(M.IgniteMob())
			message_admins("[ADMIN_LOOKUPFLW(user)] set [ADMIN_LOOKUPFLW(M)] on fire with [src] at [AREACOORD(user)]")
			log_game("[key_name(user)] set [key_name(M)] on fire with [src] at [AREACOORD(user)]")

/obj/item/grown/novaflower/afterattack(atom/A as mob|obj, mob/user,proximity)
	. = ..()
	if(!proximity)
		return
	if(force > 0)
		force -= rand(1, (force / 3) + 1)
	else
		to_chat(usr, "<span class='warning'>All the petals have fallen off the [name] from violent whacking!</span>")
		qdel(src)

/obj/item/grown/novaflower/pickup(mob/living/carbon/human/user)
	..()
	if(!user.gloves)
		to_chat(user, "<span class='danger'>The [name] burns my bare hand!</span>")
		user.adjustFireLoss(rand(1, 5))
