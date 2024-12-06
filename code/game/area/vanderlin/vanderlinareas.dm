// Malum's Anvil Areas

/area/rogue/under/mountains/anvil
	name = "malum's anvil generic"
	icon_state = "deception"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/outdoors/mountains/anvil/snowy
	soundenv = 8
	plane = INDOOR_PLANE

/area/rogue/under/mountains/anvil/lower
	name = "malum's anvil lower"
	icon_state = "deception"
	first_time_text = "MALUM'S ANVIL"
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/cobblerock)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/mole = 40,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30,
				/mob/living/carbon/human/species/orc/ambush = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 5)

/area/rogue/outdoors/mountains/anvil/peak
	name = "malum's anvil peak"
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "THE PEAK OF MALUM'S ANVIL"

/area/rogue/outdoors/mountains/anvil/snowy
	name = "malum's anvil snow"
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/rogue/outdoors/mountains/anvil/snowyforest
	name = "malum's anvil forest"
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_types = list(
				/turf/open/floor/rogue/grass/cold,
				/turf/open/floor/rogue/snow/patchy)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 40,
				/mob/living/carbon/human/species/goblin/npc/ambush = 30,
				/mob/living/carbon/human/species/orc/ambush = 20)
