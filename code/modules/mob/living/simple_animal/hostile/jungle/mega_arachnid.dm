//Large and powerful, but timid. It won't engage anything above 50 health, or anything without legcuffs.
//It can fire fleshy snares that legcuff anyone that it hits, making them look especially tasty to the arachnid.
/mob/living/simple_animal/hostile/jungle/mega_arachnid
	name = "Mutated Archanid"
	desc = ""
	icon = 'icons/mob/jungle/arachnid.dmi'
	icon_state = "arachnid"
	icon_living = "arachnid"
	icon_dead = "dead_green"
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	melee_damage_lower = 40
	melee_damage_upper = 60
	maxHealth = 2500
	health = 2500
	STACON = 19
	STASTR = 18
	STASPD = 10
	STAEND = 19
	defprob = 30
	defdrain = 15
	ranged = 1
	pixel_x = -16
	move_to_delay = 2
	aggro_vision_range = 9
	speak_emote = list("aggro")
	attack_sound = list('sound/vo/mobs/spider/attack (1).ogg','sound/vo/mobs/spider/attack (2).ogg','sound/vo/mobs/spider/attack (3).ogg','sound/vo/mobs/spider/attack (4).ogg')
	faction = list("bugs")
	ranged_cooldown_time = 20
	base_intents = list(/datum/intent/simple/stab, /datum/intent/simple/bigbite)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/rawcutlet/spider = 1, /obj/item/reagent_containers/food/snacks/spiderleg = 8)
	projectiletype = /obj/projectile/mega_arachnid
	projectilesound = 'sound/foley/flesh_rem2.ogg'
	alpha = 50
	footstep_type = FOOTSTEP_MOB_HEAVY

/mob/living/simple_animal/hostile/jungle/mega_arachnid/Life()
	..()
	if(target && ranged_cooldown > world.time && iscarbon(target))
		var/mob/living/carbon/C = target
		if(!C.legcuffed && C.health < 50)
			retreat_distance = 9
			minimum_distance = 9
			alpha = 125
			return
	retreat_distance = 0
	minimum_distance = 0
	alpha = 255


/mob/living/simple_animal/hostile/jungle/mega_arachnid/Aggro()
	..()
	alpha = 255

/mob/living/simple_animal/hostile/jungle/mega_arachnid/LoseAggro()
	..()
	alpha = 50

/obj/projectile/mega_arachnid
	name = "Fleshy Spear"
	nodamage = FALSE
	damage = 15
	icon_state = "tentacle_end"

/obj/projectile/mega_arachnid/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target) && blocked < 100)
		var/obj/item/restraints/legcuffs/beartrap/mega_arachnid/B = new /obj/item/restraints/legcuffs/beartrap/mega_arachnid(get_turf(target))
		B.Crossed(target)
	..()

/obj/item/restraints/legcuffs/beartrap/mega_arachnid
	name = "fleshy restraints"
	desc = ""
	item_flags = DROPDEL
	flags_1 = NONE
	icon_state = "tentacle_end"
	icon = 'icons/obj/projectiles.dmi'

/mob/living/simple_animal/hostile/jungle/mega_arachnid/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/spider/aggro (1).ogg','sound/vo/mobs/spider/aggro (2).ogg','sound/vo/mobs/spider/aggro (3).ogg')
		if("pain")
			return pick('sound/vo/mobs/spider/pain.ogg')
		if("death")
			return pick('sound/vo/mobs/spider/death.ogg')
		if("idle")
			return pick('sound/vo/mobs/spider/idle (1).ogg','sound/vo/mobs/spider/idle (2).ogg','sound/vo/mobs/spider/idle (3).ogg','sound/vo/mobs/spider/idle (4).ogg')
