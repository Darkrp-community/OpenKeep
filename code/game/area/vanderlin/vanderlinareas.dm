GLOBAL_LIST_EMPTY(chosen_music)

/area/vanderlin/start
	name = "start vdl"
	icon_state = "start"
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = STANDARD_GRAVITY

/area/vanderlin
	name = "base vdl"
	icon_state = "rogue"
	has_gravity = STANDARD_GRAVITY
	ambientsounds = null
	dynamic_lighting = DYNAMIC_LIGHTING_FORCED
//	var/previous_ambient = ""

/area/vanderlin/indoors
	name = "indoors vdl"
	icon_state = "indoors"
	ambientrain = RAIN_IN
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/indoor.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	plane = INDOOR_PLANE
	converted_type = /area/rogue/outdoors

/area/vanderlin/indoors/cave
	name = "safe cave (no craft) vdl"
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	soundenv = 8

/area/rogue/indoors/cave/can_craft_here()
	return FALSE


///// OUTDOORS AREAS //////

/area/vanderlin/outdoors
	name = "outdoors vdl"
	icon_state = "outdoors"
	outdoors = TRUE
	ambientrain = RAIN_OUT
	ambientsounds = AMB_TOWNDAY
	ambientnight = AMB_TOWNNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/vanderlin/indoors/shelter

/area/vanderlin/indoors/shelter
	icon_state = "shelter"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/outdoors/mountains
	name = "mountains"
	icon_state = "mountains"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 17
	converted_type = /area/vanderlin/indoors/shelter/mountains

/area/vanderlin/indoors/shelter/mountains
	icon_state = "mountains"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

// Malum's Anvil Areas
/area/vanderlin/outdoors/mountains/lower
	name = "malum's anvil lower"
	icon_state = "deception"
	first_time_text = "MALUM'S ANVIL"
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/floor/rogue/cobblerock)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/mole = 40,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 30,
				/mob/living/carbon/human/species/orc/ambush = 20)

/area/vanderlin/outdoors/mountains/peak
	name = "malum's anvil peak"
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "THE PEAK OF MALUM'S ANVIL"

/area/vanderlin/outdoors/rtfield
	name = "rockhill basin"
	icon_state = "rtfield"
	soundenv = 19
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/carbon/human/species/goblin/npc/ambush/hell = 50,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 50,
				/mob/living/carbon/human/species/goblin/npc/ambush = 50)
	first_time_text = "ROCKHILL BASIN"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/rogue/indoors/shelter/rtfield

/area/vanderlin/indoors/shelter/rtfield
	icon_state = "rtfield"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/outdoors/woods
	name = "wilderness"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/wolf = 60,
				/mob/living/simple_animal/hostile/retaliate/rogue/troll = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 45,
				/mob/living/simple_animal/hostile/retaliate/rogue/mole = 25)
	first_time_text = "THE MURDERWOOD"
	converted_type = /area/vanderlin/indoors/shelter/woods

/area/vanderlin/indoors/shelter/woods
	icon_state = "woods"
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'

/area/vanderlin/outdoors/woods_safe
	name = "woods"
	icon_state = "woods"
	ambientsounds = AMB_FORESTDAY
	ambientnight = AMB_FORESTNIGHT
	spookysounds = SPOOKY_CROWS
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	converted_type = /area/vanderlin/indoors/shelter/woods



/area/vanderlin/outdoors/river
	name = "river"
	icon_state = "river"
	ambientsounds = AMB_RIVERDAY
	ambientnight = AMB_RIVERNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_FOREST
	droning_sound = 'sound/music/area/forest.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/forestnight.ogg'
	converted_type = /area/vanderlin/indoors/shelter/woods

/area/vanderlin/outdoors/bog
	name = "the bog"
	icon_state = "bog"
	ambientsounds = AMB_BOGDAY
	ambientnight = AMB_BOGNIGHT
	spookysounds = SPOOKY_FROG
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt,
				/turf/open/water)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 20,
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 80,
				/mob/living/carbon/human/species/goblin/npc/ambush/sea = 50,
				/mob/living/simple_animal/hostile/retaliate/rogue/trollbog = 35)	//Bogbugs bugged bigtime, so removed for now.

	first_time_text = "THE TERRORBOG"
	converted_type = /area/vanderlin/indoors/shelter/bog

/area/vanderlin/indoors/shelter/bog
	icon_state = "bog"
	droning_sound = 'sound/music/area/bog.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/outdoors/beach
	name = "sophia's cry"
	icon_state = "beach"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'


//// UNDER AREAS (no indoor rain sound usually)

// these don't get a rain sound because they're underground
/area/vanderlin/under
	name = "basement"
	icon_state = "under"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	soundenv = 8
	plane = INDOOR_PLANE
	converted_type = /area/vanderlin/outdoors/exposed

/area/vanderlin/outdoors/exposed
	icon_state = "exposed"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/under/cave
	name = "cave"
	icon_state = "cave"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 20,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10)
	converted_type = /area/vanderlin/outdoors/caves

/area/vanderlin/outdoors/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/cavewet
	name = "cavewet"
	icon_state = "cavewet"
	first_time_text = "The Undersea"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/goblin/npc/sea = 20)
	converted_type = /area/vanderlin/outdoors/caves

/area/vanderlin/under/cave/spider
	icon_state = "spider"
	first_time_text = "ARAIGNÉE"
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/spider = 100)
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/rogue/outdoors/spidercave

/area/vanderlin/outdoors/spidercave
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/spiderbase
	name = "spiderbase"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	icon_state = "spiderbase"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/spidercave

/area/vanderlin/outdoors/spidercave
	icon_state = "spidercave"
	droning_sound = 'sound/music/area/spidercave.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/cavelava
	name = "cavelava"
	icon_state = "cavelava"
	first_time_text = "MOUNT DECAPITATION"
	ambientsounds = AMB_CAVELAVA
	ambientnight = AMB_CAVELAVA
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/rogue/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/rogue/bigrat = 30,
				/mob/living/carbon/human/species/skeleton/npc/ambush = 10,
				/mob/living/carbon/human/species/goblin/npc/hell = 20)
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/decap

/area/vanderlin/outdoors/exposed/decap
	icon_state = "decap"
	droning_sound = 'sound/music/area/decap.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/lake
	name = "underground lake"
	icon_state = "lake"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_GEN




///// TOWN AREAS //////

/area/vanderlin/indoors/town
	name = "indoors"
	icon_state = "indoor_town"
	droning_sound = 'sound/music/area/indoor.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'
	converted_type = /area/vanderlin/outdoors/exposed/town

/area/vanderlin/outdoors/exposed/town
	icon_state = "town"
	droning_sound = 'sound/music/area/towngen.ogg'
	droning_sound_dusk = null
//	droning_sound_night = 'sound/music/area/night.ogg'

/area/vanderlin/indoors/town/manor
	name = "Manor"
	icon_state = "manor"
	droning_sound = list('sound/music/area/manor.ogg', 'sound/music/area/manor2.ogg')
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/manorgarri
	first_time_text = "THE KEEP OF ROCKHILL"

/area/vanderlin/outdoors/exposed/manorgarri
	icon_state = "manorgarri"
	droning_sound = 'sound/music/area/manor.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/indoors/town/magician
	name = "Wizard's Tower"
	icon_state = "magician"
	spookysounds = SPOOKY_MYSTICAL
	spookynight = SPOOKY_MYSTICAL
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/magiciantower

/area/vanderlin/outdoors/exposed/magiciantower
	icon_state = "magiciantower"
	droning_sound = 'sound/music/area/magiciantower.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/indoors/town/shop
	name = "Shop"
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/shop

/area/vanderlin/outdoors/exposed/shop
	icon_state = "shop"
	droning_sound = 'sound/music/area/shop.ogg'

/area/vanderlin/indoors/town/bath
	name = "Baths"
	icon_state = "bath"
	droning_sound = 'sound/music/area/bath.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/bath

/area/vanderlin/outdoors/exposed/bath
	icon_state = "bath"
	droning_sound = 'sound/music/area/bath.ogg'

/area/vanderlin/indoors/town/garrison
	name = "Garrison"
	icon_state = "garrison"
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	droning_sound_dusk = null
	droning_sound_night = vanderlin
	converted_type = /area/rogue/outdoors/exposed/manorgarri

/area/vanderlin/indoors/town/cell
	name = "dungeon cell"
	icon_state = "cell"
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/manorgarri.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/manorgarri

/area/vanderlin/indoors/town/tavern
	name = "tavern"
	icon_state = "tavern"
	first_time_text = "Skullcrack Inn"
	ambientsounds = AMB_INGEN
	ambientnight = AMB_INGEN
	droning_sound = 'sound/music/jukeboxes/tavern1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/jukeboxes/tavern2.ogg'
	converted_type = /area/vanderlin/outdoors/exposed/tavern

/area/vanderlin/outdoors/exposed/tavern
	icon_state = "tavern"
	droning_sound = 'sound/music/jukeboxes/tavern1.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/jukeboxes/tavern2.ogg'

/area/vanderlin/indoors/town/church
	name = "church"
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/churchnight.ogg'
	converted_type = /area/vanderlin/outdoors/exposed/church

/area/vanderlin/outdoors/exposed/church
	icon_state = "church"
	droning_sound = 'sound/music/area/church.ogg'
	droning_sound_dusk = null
	droning_sound_night = 'sound/music/area/churchnight.ogg'

/area/vanderlin/indoors/town/church/chapel
	icon_state = "chapel"
	first_time_text = "THE HOUSE OF THE TEN"

/area/vanderlin/indoors/town/church/inquisition
	name = "inquisition"
	first_time_text = "INQUISITIONS LAIR"

/area/vanderlin/indoors/town/fire_chamber
	name = "incinerator (no craft)"
	icon_state = "fire_chamber"

/area/vanderlin/indoors/town/fire_chamber/can_craft_here()
	return FALSE

/area/vanderlin/indoors/town/warehouse
	name = "dock warehouse import (no craft)"
	icon_state = "warehouse"

/area/vanderlin/indoors/town/warehouse/can_craft_here()
	return FALSE

/area/vanderlin/indoors/town/vault
	name = "vault (no craft)"
	icon_state = "vault"

/area/vanderlin/indoors/town/vault/can_craft_here()
	return FALSE

/area/vanderlin/indoors/town/entrance
	first_time_text = "Roguetown"
	icon_state = "entrance"

/area/vanderlin/indoors/town/clocktower
	first_time_text = "Clocktower"
	icon_state = "clocktower"

/area/vanderlin/indoors/town/orphanage
	first_time_text = "The Orphanage"
	icon_state = "orphanage"

/area/vanderlin/indoors/town/clinic_large
	first_time_text = "Physickers Clinic"
	icon_state = "clinic_large"

/area/vanderlin/indoors/town/thieves_guild
	first_time_text = "Thieves Guild"
	icon_state = "thieves_guild"

/area/vanderlin/indoors/town/merc_guild
	first_time_text = "Mercenary Guild"
	icon_state = "merc_guild"

/area/vanderlin/indoors/town/steward
	first_time_text = "Stewards Office"
	icon_state = "steward"

/area/vanderlin/indoors/town/smithy
	name = "Smithy"
	icon_state = "smithy"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Smithy"
	converted_type = /area/rogue/outdoors/exposed/dwarf

/area/vanderlin/indoors/town/dwarfin
	name = "makers quarter"
	icon_state = "dwarfin"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Makers' Quarter"
	converted_type = /area/rogue/outdoors/exposed/dwarf

/area/vanderlin/outdoors/exposed/dwarf
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

// so you can teleport to the farm
/area/vanderlin/indoors/soilsons
	name = "soilsons"

/area/vanderlin/indoors/butchershop
	name = "butcher shop"

/area/vanderlin/indoors/villagegarrison
	name = "village garrison"

/area/vanderlin/indoors/ship
	name = "the ship"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/night.ogg'

/area/vanderlin/outdoors/coast
	name = "the coast"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

///// OUTDOORS AREAS (again, for some reason)

/area/vanderlin/outdoors/town
	name = "outdoors"
	icon_state = "town"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
//	droning_sound_night = 'sound/music/area/night.ogg'	Too much guitar honestly
	converted_type = /area/vanderlin/indoors/shelter/town
	first_time_text = "THE TOWN OF ROCKHILL"

/area/vanderlin/indoors/shelter/town
	icon_state = "town"
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/outdoors/town/sargoth
	name = "outdoors"
	icon_state = "sargoth"
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = null
	converted_type = /area/vanderlin/indoors/shelter/town/sargoth

/area/vanderlin/indoors/shelter/town/sargoth
	icon_state = "sargoth"
	droning_sound = 'sound/music/area/sargoth.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/outdoors/town/roofs
	name = "roofs"
	icon_state = "roofs"
	ambientsounds = AMB_MOUNTAIN
	ambientnight = AMB_MOUNTAIN
	spookysounds = SPOOKY_GEN
	spookynight = SPOOKY_GEN
	droning_sound = 'sound/music/area/field.ogg'
	converted_type = /area/vanderlin/indoors/shelter/town/roofs

/area/vanderlin/indoors/shelter/town/roofs
	icon_state = "roofs"
	droning_sound = 'sound/music/area/field.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/outdoors/town/dwarf
	name = "makers quarter"
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Makers' Quarter"
	converted_type = /area/vanderlin/indoors/shelter/town/dwarf

/area/vanderlin/indoors/shelter/town/dwarf
	icon_state = "dwarf"
	droning_sound = 'sound/music/area/dwarf.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

///// UNDERGROUND AREAS //////

/area/vanderlin/under/town
	name = "basement"
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/under/town

/area/vanderlin/outdoors/exposed/under/town
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/town/sewer
	name = "sewer"
	icon_state = "sewer"
	ambientsounds = AMB_CAVEWATER
	ambientnight = AMB_CAVEWATER
	spookysounds = SPOOKY_RATS
	spookynight = SPOOKY_RATS
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	ambientrain = RAIN_SEWER
	converted_type = /area/vanderlin/outdoors/exposed/under/sewer

/area/vanderlin/outdoors/exposed/under/sewer
	icon_state = "sewer"
	droning_sound = 'sound/music/area/sewers.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/town/cave
	name = "miningcave"
	icon_state = "caverogue"
	ambientsounds = AMB_GENCAVE
	ambientnight = AMB_GENCAVE
	spookysounds = SPOOKY_CAVE
	spookynight = SPOOKY_CAVE
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/under/caves

/area/vanderlin/outdoors/exposed/under/caves
	icon_state = "caves"
	droning_sound = 'sound/music/area/caves.ogg'
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/town/basement
	name = "basement"
	icon_state = "basement"
	ambientsounds = AMB_BASEMENT
	ambientnight = AMB_BASEMENT
	spookysounds = SPOOKY_DUNGEON
	spookynight = SPOOKY_DUNGEON
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	soundenv = 5
	converted_type = /area/vanderlin/outdoors/exposed/under/basement

/area/vanderlin/outdoors/exposed/under/basement
	icon_state = "basement"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null


///// UNDERWORLD AREAS //////

/area/vanderlin/underworld
	name = "underworld"
	icon_state = "underworld"
	droning_sound = 'sound/music/area/underworlddrone.ogg'
	droning_sound_dusk = null
	droning_sound_night = null
	first_time_text = "The Forest of Repentence"


///// DAKKATOWN AREAS //////

// Players should be fined for any damage they do to the Guild's property
/area/vanderlin/outdoors/beach/boat
	name = "sophia's cry"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

// Players are penalized for entering the Guild Gaptain's quarters (FAFO)
/area/vanderlin/outdoors/beach/boat/captain
	name = "guild captain"
	ambientsounds = AMB_BEACH
	ambientnight = AMB_BEACH
	droning_sound = 'sound/music/area/townstreets.ogg'
	droning_sound_dusk = 'sound/music/area/septimus.ogg'
	droning_sound_night = 'sound/music/area/sleeping.ogg'

/area/vanderlin/indoors/town/theatre
	name = "theatre"
	icon_state = "manor"
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null
	converted_type = /area/vanderlin/outdoors/exposed/theatre

/area/vanderlin/outdoors/exposed/theatre
	name = "theatre"
	icon_state = "manor"
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/indoors/town/apothecary
	name = "apothecary"
	icon_state = "manor"
	droning_sound = null
	droning_sound_dusk = null
	droning_sound_night = null

/area/vanderlin/under/town/ruin
	name = "townruin"
	icon_state = "town"
	droning_sound = 'sound/music/area/catacombs.ogg'
	droning_sound_dusk = null
	droning_sound_night = null


///// ANTAGONIST AREAS //////  - used on centcom so you can teleport there easily. Each antag area just gets one unique type, if its outdoor use generic indoors, vice versa, to avoid clutter in area list

/area/vanderlin/indoors/bandit_lair
	name = "lair (Bandits)"

/area/vanderlin/indoors/vampire_manor
	name = "lair (Vampire Lord)"

/area/vanderlin/outdoors/bog/inhumen_camp
	name = "lair (Inhumen)"
	droning_sound = 'sound/music/area/decap.ogg'
	first_time_text = "THE DEEP BOG"
