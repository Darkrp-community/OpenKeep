/obj/item/reagent_containers/food/snacks/grown/mushroom
	name = "mushroom"
	bitesize_mod = 2
	foodtype = VEGETABLES
	//wine_power = 40


/obj/item/reagent_containers/food/snacks/grown/mushroom/reishi
//	seed = /obj/item/seeds/reishi
	name = "reishi"
	desc = ""
	icon_state = "reishi"
	filling_color = "#FF4500"



/obj/item/reagent_containers/food/snacks/grown/mushroom/amanita
//	seed = /obj/item/seeds/amanita
	name = "fly amanita"
	desc = ""
	icon_state = "amanita"
	filling_color = "#FF0000"


/obj/item/reagent_containers/food/snacks/grown/mushroom/angel
//	seed = /obj/item/seeds/angel
	name = "destroying angel"
	desc = ""
	icon_state = "angel"
	filling_color = "#C0C0C0"
	//wine_power = 60


/obj/item/reagent_containers/food/snacks/grown/mushroom/libertycap
//	seed = /obj/item/seeds/liberty
	name = "liberty-cap"
	desc = ""
	icon_state = "libertycap"
	filling_color = "#DAA520"
	//wine_power = 80


/obj/item/reagent_containers/food/snacks/grown/mushroom/plumphelmet
//	seed = /obj/item/seeds/plump
	name = "plump-helmet"
	desc = ""
	icon_state = "plumphelmet"
	filling_color = "#9370DB"
	distill_reagent = /datum/reagent/consumable/ethanol/manly_dorf

/obj/item/reagent_containers/food/snacks/grown/mushroom/walkingmushroom
//	seed = /obj/item/seeds/plump/walkingmushroom
	name = "walking mushroom"
	desc = ""
	icon_state = "walkingmushroom"
	filling_color = "#9370DB"
	can_distill = FALSE

/obj/item/reagent_containers/food/snacks/grown/mushroom/walkingmushroom/attack_self(mob/user)
	if(isspaceturf(user.loc))
		return
	var/mob/living/simple_animal/hostile/mushroom/M = new /mob/living/simple_animal/hostile/mushroom(user.loc)
//	M.maxHealth += round(seed.endurance / 4)
//	M.melee_damage_lower += round(seed.potency / 20)
//	M.melee_damage_upper += round(seed.potency / 20)
//	M.move_to_delay -= round(seed.production / 50)
	M.health = M.maxHealth
	qdel(src)
	to_chat(user, "<span class='notice'>I plant the walking mushroom.</span>")


/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle
//	seed = /obj/item/seeds/chanter
	name = "chanterelle cluster"
	desc = ""
	icon_state = "chanterelle"
	filling_color = "#FFA500"

/*
/obj/item/seeds/chanterelle/jupitercup/Initialize(mapload,nogenes)
	. = ..()
	if(!nogenes)
		unset_mutability(/datum/plant_gene/reagent/liquidelectricity, PLANT_GENE_EXTRACTABLE)
		unset_mutability(/datum/plant_gene/trait/plant_type/carnivory, PLANT_GENE_REMOVABLE)

/obj/item/reagent_containers/food/snacks/grown/mushroom/jupitercup
//	seed = /obj/item/seeds/chanterelle/jupitercup
	name = "jupiter cup"
	desc = ""
	icon_state = "jupitercup"
	filling_color = "#B5003D"
*/
// Glowshroom

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom
//	seed = /obj/item/seeds/glowshroom
	name = "glowshroom cluster"
	desc = ""
	icon_state = "glowshroom"
	filling_color = "#00FA9A"
	var/effect_path = /obj/structure/glowshroom
	//wine_power = 50

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/attack_self(mob/user)
	if(isspaceturf(user.loc))
		return FALSE
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>I need more space to plant [src].</span>")
		return FALSE
	var/count = 0
	var/maxcount = 1
	for(var/tempdir in GLOB.cardinals)
		var/turf/closed/wall = get_step(user.loc, tempdir)
		if(istype(wall))
			maxcount++
	for(var/obj/structure/glowshroom/G in user.loc)
		count++
	if(count >= maxcount)
		to_chat(user, "<span class='warning'>There are too many shrooms here to plant [src].</span>")
		return FALSE
	new effect_path(user.loc, seed)
	to_chat(user, "<span class='notice'>I plant [src].</span>")
	qdel(src)
	return TRUE


/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/glowcap
//	seed = /obj/item/seeds/glowshroom/glowcap
	name = "glowcap cluster"
	desc = ""
	icon_state = "glowcap"
	filling_color = "#00FA9A"
	effect_path = /obj/structure/glowshroom/glowcap
	tastes = list("glowcap" = 1)


/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/shadowshroom
//	seed = /obj/item/seeds/glowshroom/shadowshroom
	name = "shadowshroom cluster"
	desc = ""
	icon_state = "shadowshroom"
	effect_path = /obj/structure/glowshroom/shadowshroom
	tastes = list("shadow" = 1, "mushroom" = 1)
	//wine_power = 60

/obj/item/reagent_containers/food/snacks/grown/mushroom/glowshroom/shadowshroom/attack_self(mob/user)
	. = ..()
	if(.)
		investigate_log("was planted by [key_name(user)] at [AREACOORD(user)]", INVESTIGATE_BOTANY)
