/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	!!WARNING!!: changing existing hair information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/
/proc/init_sprite_accessory_subtypes(prototype, list/L, list/male, list/female,roundstart = FALSE)//Roundstart argument builds a specific list for roundstart parts where some parts may be locked
	if(!istype(L))
		L = list()
	if(!istype(male))
		male = list()
	if(!istype(female))
		female = list()

	for(var/path in subtypesof(prototype))
		if(roundstart)
			var/datum/sprite_accessory/P = path
			if(initial(P.locked))
				continue
		var/datum/sprite_accessory/D = new path()

		if(D.icon_state)
			L[D.name] = D
		else
			L += D.name

		switch(D.gender)
			if(MALE)
				male += D.name
			if(FEMALE)
				female += D.name
			else
				male += D.name
				female += D.name
	return L

/datum/sprite_accessory
	var/icon			//the icon file the accessory is located in
	var/icon_state		//the icon_state of the accessory
	var/name			//the preview name of the accessory
	var/gender = NEUTER	//Determines if the accessory will be skipped or included in random hair generations
	var/gender_specific //Something that can be worn by either gender, but looks different on each
	var/use_static		//determines if the accessory will be skipped by color preferences
	var/color_src = MUTCOLORS	//Currently only used by mutantparts so don't worry about hair and stuff. This is the source that this accessory will get its color from. Default is MUTCOLOR, but can also be HAIR, FACEHAIR, EYECOLOR and 0 if none.
	var/hasinner		//Decides if this sprite has an "inner" part, such as the fleshy parts on ears.
	var/locked = FALSE		//Is this part locked from roundstart selection? Used for parts that apply effects
	var/dimension_x = 32
	var/dimension_y = 32
	var/center = FALSE	//Should we center the sprite?
	var/list/specuse = list("human") //what species can use dis
	var/additional = FALSE //added hairbands/metal in hair/beards
	var/offsetti = FALSE
	var/roundstart = TRUE
	var/under_layer = FALSE

//////////////////////
// Hair Definitions //
//////////////////////
/datum/sprite_accessory/hair
	icon = 'icons/roguetown/mob/hair.dmi'	  // default icon for all hairs

	// please make sure they're sorted alphabetically and, where needed, categorized
	// try to capitalize the names please~
	// try to spell
	// you do not need to define _s or _l sub-states, game automatically does this for you

	// each race gets four unique haircuts
	// dwarf - miner, gnomish, boss, hearth
	// elf - son, fancy, mysterious, long
	// human - adventurer, dark knight, graceful, squire, pigtails, noblesse
	// dual - nomadic, shrine 
	// aasimar - amazon, topknot, martial, forsaken
	// tiefling - junia, performer, tribal, lover

/datum/sprite_accessory/hair/bald
	name = "Bald"
	icon_state = ""
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	gender = MALE

/datum/sprite_accessory/hair/adventurer
	name = "Adventurer"
	icon_state = "adventurer"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/mohawk
	name = "Berserker"
	icon_state = "berserker"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	under_layer = TRUE

/datum/sprite_accessory/hair/hair_bog
	name = "Bog"
	icon_state = "bog"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/mohawk
	name = "Boss"
	icon_state = "boss"
	gender = MALE
	specuse = list("dwarf")
	under_layer = TRUE

/datum/sprite_accessory/hair/bowlcut
	name = "Bowlcut"
	icon_state = "bowlcut"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/brother
	name = "Brother"
	icon_state = "brother"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/thinning
	name = "Cavehead"
	icon_state = "cavehead"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	under_layer = TRUE

/datum/sprite_accessory/hair/undercut
	name = "Conscript"
	icon_state = "conscript"
	gender = MALE
	under_layer = TRUE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/dark_knight
	name = "Dark Knight"
	icon_state = "darkknight"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/thinningrear
	name = "Dome"
	icon_state = "dome"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	under_layer = TRUE

/datum/sprite_accessory/hair/scout
	name = "Druid"
	icon_state = "druid"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/noble
	name = "Courtier"
	icon_state = "courtier"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/fancy_elf
	name = "Fancy"
	icon_state = "fancy_elf"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/forsaken
	name = "Forsake"
	icon_state = "forsaken"
	gender = MALE
	specuse = list("aasimar")
	under_layer = TRUE

/datum/sprite_accessory/hair/father
	name = "Forged"
	icon_state = "forged"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	under_layer = TRUE

/datum/sprite_accessory/hair/graceful
	name = "Graceful"
	icon_state = "graceful"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/bedhead
	name = "Helmet Hair"
	icon_state = "helmet"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/heroic
	name = "Heroic"
	icon_state = "heroic"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/lover
	name = "Lover"
	icon_state = "lover_tief_m"
	gender = MALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/elfhair_long
	name = "Long"
	icon_state = "long"
	gender = MALE
	specuse = list("elf")
	
/datum/sprite_accessory/hair/manbun
	name = "Manbun"
	icon_state = "manbun"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/manbun_rows
	name = "Manbun alt"
	icon_state = "manbunrow"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/majestic
	name = "Majestic"
	icon_state = "majestic"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/merc
	name = "Mercenary"
	icon_state = "mercenary"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/miner
	name = "Miner"
	icon_state = "miner"
	gender = MALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/nobility
	name = "Nobility"
	icon_state = "noble"
	gender = MALE
	specuse = list("human")
	
/datum/sprite_accessory/hair/nomadic
	name = "Nomadic"
	icon_state = "nomadic"
	gender = MALE
	specuse = list("human", "tiefling")

/datum/sprite_accessory/hair/pirate
	name = "Pirate"
	icon_state = "pirate"
	gender = MALE
	under_layer = TRUE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/elfhair_fatherless
	name = "Princely"
	icon_state = "princely"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/rogue
	name = "Rogue"
	icon_state = "rogue"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/hair_romantic
	name = "Romantic"
	icon_state = "romantic"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/baldfade
	name = "Scribe"
	icon_state = "scribe"
	gender = MALE
	specuse = list("human", "dwarf", "aasimar", "tiefling")
	under_layer = TRUE

/datum/sprite_accessory/hair/gelled
	name = "Slicked Back"
	icon_state = "slicked"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/southern
	name = "Southern"
	icon_state = "southern"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/hair_son
	name = "Sun"
	icon_state = "sun"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/elfhair_son
	name = "Son"
	icon_state = "son_elf"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/hair/squire
	name = "Squire"
	icon_state = "squire"
	gender = MALE
	specuse = list("human")

/datum/sprite_accessory/hair/mponytail
	name = "Topknot"
	icon_state = "topknot"
	gender = MALE
	specuse = list("aasimar")

/datum/sprite_accessory/hair/mtribal
	name = "Tribal"
	icon_state = "tribal"
	gender = MALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/troubadour
	name = "Troubadour"
	icon_state = "troubadour"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/mponytail
	name = "Tied"
	icon_state = "tied"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/hair_tied
	name = "Tied long"
	icon_state = "tiedlong"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/hair_sidecut
	name = "Tied Sidecut"
	icon_state = "tsidecut"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/hair_trimmerd
	name = "Trimmed hair"
	icon_state = "trimmed"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/elfhair_tied
	name = "Warrior"
	icon_state = "warrior"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/hair_sidecut_untied
	name = "Wild Sidecut"
	icon_state = "wildside"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")


///////////(//////////////////
// UNISEX Hair Definitions  //
//////////(///////////////////

/datum/sprite_accessory/hair/martial
	name = "Martial"
	icon_state = "martial"
	gender = NEUTER
	specuse = list("aasimar")

/datum/sprite_accessory/hair/skinhead
	name = "Shaved"
	icon_state = "shaved"
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	gender = NEUTER
	under_layer = TRUE

/datum/sprite_accessory/hair/hair_runt
	name = "Runt"
	icon_state = "runt"
	gender = NEUTER
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/////////////////////////////
// GIRLY Hair Definitions  //
/////////////////////////////

/datum/sprite_accessory/hair/fazamon
	name = "Amazon"
	icon_state = "amazon_f"
	gender = FEMALE
	specuse = list("aasimar")

/datum/sprite_accessory/hair/famazon
	name = "Barbarian"
	icon_state = "barbarian_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fbuns
	name = "Buns"
	icon_state = "buns_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fbob
	name = "Bob"
	icon_state = "bob_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/shorthair
	name = "Curly Short"
	icon_state = "curly_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/fempress
	name = "Empress"
	icon_state = "empress_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/fancy_femelf
	name = "Fancy"
	icon_state = "fancy_elf_f"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/hair/gnomish_f
	name = "Gnomish"
	icon_state = "gnomish_f"
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/hearth_f
	name = "Hearth"
	icon_state = "hearth_f"
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/fhomely
	name = "Homely"
	icon_state = "homely_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/fjunia
	name = "Junia"
	icon_state = "junia_tief_f"
	gender = FEMALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/fbuns
	name = "Loose Braid"
	icon_state = "loosebraid_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fhair_barmaid
	name = "Maiden"
	icon_state = "maiden_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/dmajesty
	name = "Majestic Dwarf"
	icon_state = "majestic_dwarf_f"
	gender = FEMALE
	specuse = list("dwarf")

/datum/sprite_accessory/hair/elfmajesty
	name = "Majestic Elf"
	icon_state = "majestic_elf"
	gender = NEUTER
	specuse = list("elf")

/datum/sprite_accessory/hair/fmajesty
	name = "Majestic Human"
	icon_state = "majestic_f"
	gender = FEMALE
	specuse = list("human")

/datum/sprite_accessory/hair/fmess
	name = "Messy"
	icon_state = "messy_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/ffelfhair_hime
	name = "Mysterious"
	icon_state = "mysterious_elf"
	gender = FEMALE
	specuse = list("elf")
	
/datum/sprite_accessory/hair/fmys
	name = "Mystery"
	icon_state = "mystery_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/noblesse
	name = "Noblesse"
	icon_state = "noblesse_f"
	gender = FEMALE
	specuse = list("human")

/datum/sprite_accessory/hair/fperformer
	name = "Performer"
	icon_state = "performer_tief_f"
	gender = FEMALE
	specuse = list("tiefling")

/datum/sprite_accessory/hair/fflowers
	name = "Flowers"
	icon_state = "flowers_f"
	gender = FEMALE
	under_layer = TRUE
	specuse = list("human")

/datum/sprite_accessory/hair/fpix
	name = "Pixie"
	icon_state = "pixie_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/vlongfringe
	name = "Plain Long"
	icon_state = "plain_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fqueen
	name = "Queenly"
	icon_state = "queenly_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/flongtails
	name = "Shrine Keeper"
	icon_state = "shrine_f"
	gender = FEMALE
	specuse = list("elf", "tiefling")

/datum/sprite_accessory/hair/fsoilbride
	name = "Soilbride"
	icon_state = "soilbride_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/ftwin
	name = "Tails"
	icon_state = "tails_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fpony
	name = "Tied Ponytail"
	icon_state = "tied_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fupper
	name = "Tied Up"
	icon_state = "tiedup_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")

/datum/sprite_accessory/hair/beehive
	name = "Updo"
	icon_state = "updo_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/hair/fwisp
	name = "Wisp"
	icon_state = "wisp_f"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/*
/datum/sprite_accessory/hair/felfhair_fatherless
	name = "Fatherless"
	icon_state = "fatherless_elf_f"
	gender = FEMALE
	specuse = list("elf")*/

/////////////////////////////
// Facial Hair Definitions //
/////////////////////////////

/datum/sprite_accessory/facial_hair
	icon = 'icons/roguetown/mob/facial.dmi'
	gender = MALE

/datum/sprite_accessory/facial_hair/none
	name = "None"
	icon_state = ""
	gender = FEMALE
	specuse = ALL_RACES_LIST

/datum/sprite_accessory/facial_hair/shaved
	name = "None"
	icon_state = "facial_shaven"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/brew
	name = "Brew"
	icon_state = "facial_moonshiner"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/chops
	name = "Choppe"
	icon_state = "facial_muttonmus"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/chin
	name = "Clean Chin"
	icon_state = "facial_chin"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/manly
	name = "Drinker"
	icon_state = "facial_manly"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/fullbeard
	name = "Full Beard"
	icon_state = "facial_fullbeard"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/cousin
	name = "Fullest Beard"
	icon_state = "facial_brokenman"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/knightly
	name = "Knightly"
	icon_state = "facial_knightly"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/know
	name = "Knowledge"
	icon_state = "facial_wise"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/fiveoclockm
	name = "Mustache"
	icon_state = "facial_5oclockmoustache"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/pick
	name = "Pick"
	icon_state = "facial_longbeard"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/pipe
	name = "Pipesmoker"
	icon_state = "facial_pipe"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/viking
	name = "Raider"
	icon_state = "facial_viking"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/ranger
	name = "Ranger"
	icon_state = "facial_dwarf"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
/datum/sprite_accessory/facial_hair/vandyke
	name = "Rumata"
	icon_state = "facial_vandyke"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/burns
	name = "Sideburns"
	icon_state = "facial_burns"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "aasimar", "tiefling")
	
/datum/sprite_accessory/facial_hair/hermit
	name = "Wise Hermit"
	icon_state = "facial_moonshiner"
	gender = MALE
	specuse = list("human", "dwarf", "elf", "tiefling")
	
///////////////////////////
// Accessory Definitions //
///////////////////////////


/datum/sprite_accessory/accessories
	name = ""
	icon_state = null
	gender = NEUTER
	icon = 'icons/roguetown/mob/accessories.dmi'
	use_static = TRUE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/nothing
	name = "Nothing"
	icon_state = "nothing"
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/earrings/sil
	name = "Earrings"
	icon_state = "earrings_sil"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/earrings
	name = "Earrings (G)"
	icon_state = "earrings"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/earrings/em
	name = "Earrings (E)"
	icon_state = "earrings_em"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/choker
	name = "Neckband"
	icon_state = "choker"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/accessories/chokere
	name = "Neckband (E)"
	icon_state = "chokere"
	gender = FEMALE
	specuse = list("elf")

/datum/sprite_accessory/accessories/eyepierce
	name = "Pierced Brow (L)"
	icon_state = "eyepierce"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/accessories/eyepierce/alt
	name = "Pierced Brow (R)"
	icon_state = "eyepiercealt"
	gender = FEMALE
	specuse = list("human", "dwarf", "elf")

///////////////////////////
// Detail Definitions //
///////////////////////////


/datum/sprite_accessory/detail
	name = ""
	icon_state = null
	gender = NEUTER
	icon = 'icons/roguetown/mob/detail.dmi'
	use_static = TRUE
	specuse = list("human", "dwarf", "elf")

/datum/sprite_accessory/detail/nothing
	name = "Nothing"
	icon_state = "no tings"

/datum/sprite_accessory/detail/burnface_r
	name = "Burns (r)"
	icon_state = "burnface_r"

/datum/sprite_accessory/detail/burnface_l
	name = "Burns (l)"
	icon_state = "burnface_l"

/datum/sprite_accessory/detail/brows/dark
	name = "Dark Eyebrows"
	icon_state = "darkbrows"

/datum/sprite_accessory/detail/deadeye_r
	name = "Dead Eye (r)"
	icon_state = "deadeye_r"

/datum/sprite_accessory/detail/deadeye_l
	name = "Dead Eye (l)"
	icon_state = "deadeye_l"

/datum/sprite_accessory/detail/scar
	name = "Scar"
	icon_state = "scar"

/datum/sprite_accessory/detail/scart
	name = "Scar2"
	icon_state = "scar2"

/datum/sprite_accessory/detail/brows
	name = "Thick Eyebrows"
	icon_state = "brows"
	color_src = HAIR
	use_static = FALSE

///////////////////////////
// Underwear Definitions //
///////////////////////////

/datum/sprite_accessory/underwear
	icon = 'icons/mob/clothing/underwear.dmi'
	use_static = FALSE
/*#ifdef MATURESERVER
/datum/sprite_accessory/underwear/nude
	name = "None"
	icon_state = null
	gender = NEUTER
	use_static = TRUE
	specuse = ALL_RACES_LIST
#else*/
/datum/sprite_accessory/underwear/regm
	name = "Undies"
	icon_state = "male_reg"
	gender = MALE
	specuse = list("human", "aasimar", "tiefling")

/datum/sprite_accessory/underwear/regme
	name = "Undiese"
	icon_state = "maleelf_reg"
	gender = MALE
	specuse = list("elf")

/datum/sprite_accessory/underwear/regmd
	name = "Undiesd"
	icon_state = "maledwarf_reg"
	gender = MALE
	specuse = list("dwarf")

/datum/sprite_accessory/underwear/female_bikini
	name = "Femundies"
	icon_state = "female_bikini"
	gender = FEMALE
	specuse = ALL_RACES_LIST

/datum/sprite_accessory/underwear/female_leotard
	name = "Femleotard"
	icon_state = "female_leotard"
	gender = FEMALE
	specuse = ALL_RACES_LIST
	roundstart = FALSE

//#endif
////////////////////////////
// Undershirt Definitions //
////////////////////////////

/datum/sprite_accessory/undershirt
	icon = 'icons/mob/clothing/underwear.dmi'

/datum/sprite_accessory/undershirt/nude
	name = "Nude"
	icon_state = null
	gender = NEUTER

// please make sure they're sorted alphabetically and categorized
///////////////////////
// Socks Definitions //
///////////////////////

/datum/sprite_accessory/socks
	icon = 'icons/mob/clothing/underwear.dmi'

/datum/sprite_accessory/socks/nude
	name = "Nude"
	icon_state = null


//////////.//////////////////
// MutantParts Definitions //
/////////////////////////////

/datum/sprite_accessory/body_markings
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/body_markings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/body_markings/dtiger
	name = "Dark Tiger Body"
	icon_state = "dtiger"
	gender_specific = 1

/datum/sprite_accessory/body_markings/ltiger
	name = "Light Tiger Body"
	icon_state = "ltiger"
	gender_specific = 1

/datum/sprite_accessory/body_markings/lbelly
	name = "Light Belly"
	icon_state = "lbelly"
	gender_specific = 1

/datum/sprite_accessory/tails
	icon = 'icons/mob/mutant_bodyparts.dmi'
	gender = MALE
	specuse = list()

/datum/sprite_accessory/tails_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/tails/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails_animated/lizard/smooth
	name = "Smooth"
	icon_state = "smooth"

/datum/sprite_accessory/tails/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails_animated/lizard/dtiger
	name = "Dark Tiger"
	icon_state = "dtiger"

/datum/sprite_accessory/tails/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails_animated/lizard/ltiger
	name = "Light Tiger"
	icon_state = "ltiger"

/datum/sprite_accessory/tails/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails_animated/lizard/spikes
	name = "Spikes"
	icon_state = "spikes"

/datum/sprite_accessory/tails/human/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails_animated/human/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/human/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/tails_animated/human/cat
	name = "Cat"
	icon_state = "cat"
	color_src = HAIR

/datum/sprite_accessory/snouts
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/snouts/sharp
	name = "Sharp"
	icon_state = "sharp"

/datum/sprite_accessory/snouts/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/snouts/sharplight
	name = "Sharp + Light"
	icon_state = "sharplight"

/datum/sprite_accessory/snouts/roundlight
	name = "Round + Light"
	icon_state = "roundlight"

/datum/sprite_accessory/horns
	icon = 'icons/mob/mutant_bodyparts.dmi'
	gender = MALE
	specuse = list()

/datum/sprite_accessory/ears
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/ears/none
	name = "None"
	icon_state = null

/datum/sprite_accessory/ears/elf
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "Elf"
	icon_state = "elf"
	specuse = list("elf")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/ears/elfw
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "ElfW"
	icon_state = "elfw"
	specuse = list("elf", "tiefling") //tiebs use these
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/ears/elfh //halfelfs are humens techincally
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "ElfH"
	icon_state = "elf"
	specuse = list("human")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/tails/human/tieb
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "TiebTail"
	icon_state = "tiebtail"
	specuse = list("tiefling")
	gender = NEUTER
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/horns/tieb
	icon = 'icons/roguetown/mob/bodies/attachments.dmi'
	name = "TiebHorns"
	icon_state = "tiebhorns"
	specuse = list("tiefling")
	color_src = SKINCOLOR
	offsetti = TRUE

/datum/sprite_accessory/ears/cat
	name = "Cat"
	icon_state = "cat"
	hasinner = 1
	color_src = HAIR
	specuse = list("cattan")

/datum/sprite_accessory/wings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/wings
	icon = 'icons/mob/clothing/wings.dmi'

/datum/sprite_accessory/wings_open
	icon = 'icons/mob/clothing/wings.dmi'

/datum/sprite_accessory/wings/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34
	locked = TRUE

/datum/sprite_accessory/wings_open/angel
	name = "Angel"
	icon_state = "angel"
	color_src = 0
	dimension_x = 46
	center = TRUE
	dimension_y = 34

/datum/sprite_accessory/wings/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32
	locked = TRUE

/datum/sprite_accessory/wings_open/dragon
	name = "Dragon"
	icon_state = "dragon"
	dimension_x = 96
	center = TRUE
	dimension_y = 32

/datum/sprite_accessory/frills
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/frills/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/frills/simple
	name = "Simple"
	icon_state = "simple"

/datum/sprite_accessory/frills/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/frills/aquatic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines_animated
	icon = 'icons/mob/mutant_bodyparts.dmi'

/datum/sprite_accessory/spines/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines_animated/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/spines/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines_animated/short
	name = "Short"
	icon_state = "short"

/datum/sprite_accessory/spines/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines_animated/shortmeme
	name = "Short + Membrane"
	icon_state = "shortmeme"

/datum/sprite_accessory/spines/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines_animated/long
	name = "Long"
	icon_state = "long"

/datum/sprite_accessory/spines/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines_animated/longmeme
	name = "Long + Membrane"
	icon_state = "longmeme"

/datum/sprite_accessory/spines/aqautic
	name = "Aquatic"
	icon_state = "aqua"

/datum/sprite_accessory/spines_animated/aqautic
	name = "Aquatic"
	icon_state = "aqua"


/datum/sprite_accessory/legs 	//legs are a special case, they aren't actually sprite_accessories but are updated with them.
	icon = null					//These datums exist for selecting legs on preference, and little else

/datum/sprite_accessory/legs/none
	name = "Normal Legs"

/datum/sprite_accessory/legs/digitigrade_lizard
	name = "Digitigrade Legs"

/datum/sprite_accessory/caps
	icon = 'icons/mob/mutant_bodyparts.dmi'
	color_src = HAIR

/datum/sprite_accessory/caps/round
	name = "Round"
	icon_state = "round"

/datum/sprite_accessory/moth_wings
	icon = 'icons/mob/moth_wings.dmi'
	color_src = null

/datum/sprite_accessory/moth_wings/plain
	name = "Plain"
	icon_state = "plain"

/datum/sprite_accessory/moth_wings/monarch
	name = "Monarch"
	icon_state = "monarch"

/datum/sprite_accessory/moth_wings/luna
	name = "Luna"
	icon_state = "luna"

/datum/sprite_accessory/moth_wings/atlas
	name = "Atlas"
	icon_state = "atlas"

/datum/sprite_accessory/moth_wings/reddish
	name = "Reddish"
	icon_state = "redish"

/datum/sprite_accessory/moth_wings/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/moth_wings/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/moth_wings/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/moth_wings/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/moth_wings/punished
	name = "Burnt Off"
	icon_state = "punished"
	locked = TRUE

/datum/sprite_accessory/moth_wings/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/moth_wings/deathhead
	name = "Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/moth_wings/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/moth_wings/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/moth_wings/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"

/datum/sprite_accessory/moth_wings/snow
	name = "Snow"
	icon_state = "snow"

/datum/sprite_accessory/moth_markings // the markings that moths can have. finally something other than the boring tan
	icon = 'icons/mob/moth_markings.dmi'
	color_src = null

/datum/sprite_accessory/moth_markings/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/moth_markings/reddish
	name = "Reddish"
	icon_state = "reddish"

/datum/sprite_accessory/moth_markings/royal
	name = "Royal"
	icon_state = "royal"

/datum/sprite_accessory/moth_markings/gothic
	name = "Gothic"
	icon_state = "gothic"

/datum/sprite_accessory/moth_markings/whitefly
	name = "White Fly"
	icon_state = "whitefly"

/datum/sprite_accessory/moth_markings/lovers
	name = "Lovers"
	icon_state = "lovers"

/datum/sprite_accessory/moth_markings/punished
	name = "Punished"
	icon_state = "punished"

/datum/sprite_accessory/moth_markings/firewatch
	name = "Firewatch"
	icon_state = "firewatch"

/datum/sprite_accessory/moth_markings/deathhead
	name = "Deathshead"
	icon_state = "deathhead"

/datum/sprite_accessory/moth_markings/poison
	name = "Poison"
	icon_state = "poison"

/datum/sprite_accessory/moth_markings/ragged
	name = "Ragged"
	icon_state = "ragged"

/datum/sprite_accessory/moth_markings/moonfly
	name = "Moon Fly"
	icon_state = "moonfly"
