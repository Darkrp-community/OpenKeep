//used in various places
#define ALL_RACES_LIST		list("human", "dwarf", "elf", "tiefling", "aasimar", "orc")

#define ALL_RACES_LIST_NAMES		list("Humen", "Half-Elf", "Dark Elf", "Elf", "Dwarf","Tiefling", "Aasimar")

#define ALL_PATRON_NAMES_LIST		list("Astrata", "Noc", "Xylix", "Eora", "Malum", "Dendor", "Abyssor", "Necra", "Pestra", "Malum", "Ravox")

#define PLATEHIT "plate"
#define CHAINHIT "chain"
#define SOFTHIT "soft"

/proc/get_armor_sound(blocksound, blade_dulling)
	switch(blocksound)
		if(PLATEHIT)
			if(blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/plate_slashed (1).ogg','sound/combat/hits/armor/plate_slashed (2).ogg','sound/combat/hits/armor/plate_slashed (3).ogg','sound/combat/hits/armor/plate_slashed (4).ogg')
			if(blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_BITE)
				return pick('sound/combat/hits/armor/plate_stabbed (1).ogg','sound/combat/hits/armor/plate_stabbed (2).ogg','sound/combat/hits/armor/plate_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/plate_blunt (1).ogg','sound/combat/hits/armor/plate_blunt (2).ogg','sound/combat/hits/armor/plate_blunt (3).ogg')
		if(CHAINHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/chain_slashed (1).ogg','sound/combat/hits/armor/chain_slashed (2).ogg','sound/combat/hits/armor/chain_slashed (3).ogg','sound/combat/hits/armor/chain_slashed (4).ogg')
			else
				return pick('sound/combat/hits/armor/chain_blunt (1).ogg','sound/combat/hits/armor/chain_blunt (2).ogg','sound/combat/hits/armor/chain_blunt (3).ogg')
		if(SOFTHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/light_stabbed (1).ogg','sound/combat/hits/armor/light_stabbed (2).ogg','sound/combat/hits/armor/light_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/light_blunt (1).ogg','sound/combat/hits/armor/light_blunt (2).ogg','sound/combat/hits/armor/light_blunt (3).ogg')

GLOBAL_LIST_INIT(lockhashes, list())
GLOBAL_LIST_INIT(lockids, list())
GLOBAL_LIST_EMPTY(credits_icons)
GLOBAL_LIST_EMPTY(confessors)

GLOBAL_LIST_INIT(wolf_prefixes, list("Red", "Moon", "Bloody", "Hairy", "Eager", "Sharp"))
GLOBAL_LIST_INIT(wolf_suffixes, list("Fang", "Claw", "Stalker", "Prowler", "Roar", "Ripper"))

//preference stuff
#define FAMILY_NONE 1
#define FAMILY_PARTIAL 2
#define FAMILY_FULL 3

#define FAITH_NONE 0
#define FAITH_PSYDON 1
#define FAITH_ELF 2
#define FAITH_DWARF 3
#define FAITH_SPIDER 4
#define FAITH_ZIZO 5

/proc/get_faith_name(faith)
	switch(faith)
		if(FAITH_PSYDON)
			return "Father-Son"
		if(FAITH_ELF)
			return "Elfish Pantheon"
		if(FAITH_DWARF)
			return "Dwarfish Paganism"
		if(FAITH_SPIDER)
			return "Spider Queen"
		if(FAITH_ZIZO)
			return "Zizo"

/proc/get_faith_desc(faith)
	switch(faith)
		if(FAITH_PSYDON)
			return "You believe in the Father-Son. Only through His sun SAVIOR PSYDON may you join His golden kingdom in death."
		if(FAITH_ELF)
			return "You believe in the FAERIE PANTHEON, may Brother Courage and Sister Pride protect you from the wrath of the Trickster."
		if(FAITH_DWARF)
			return "By rock, you believe in DWARFISH PAGANISM! Only by respecting the gods of soil and water may you survive this week."
		if(FAITH_SPIDER)
			return "You pledged your faith in the SPIDER QUEEN, a godlike creature who ruled the Under-World before her untimely death."
		if(FAITH_ZIZO)
			return "You are a disgusting slave of ZIZO! Let the scum of creation die in obscene ways as your beautiful evil turns the world dark and miserable."


GLOBAL_LIST_EMPTY(sunlights)
GLOBAL_LIST_EMPTY(job_respawn_delays)

//stress levels
#define STRESS_MAX 30
#define STRESS_INSANE 7
#define STRESS_VBAD 5
#define STRESS_BAD 3
#define STRESS_NEUTRAL 2
#define STRESS_GOOD 1
#define STRESS_VGOOD 0

// --------- NUTRITION VALUES DEFINES --------------------
#define MEAL_FILLING 30
#define MEAL_GOOD 24
#define MEAL_AVERAGE 20
#define MEAL_MEAGRE 16
#define SNACK_NUTRITIOUS 12
#define SNACK_DECENT 6
#define SNACK_POOR 3


/*
	Formerly bitflags, now we are strings
	Currently used for classes, I could have used these for drifters tho
*/

#define CTAG_ALLCLASS		"CAT_ALLCLASS"		// jus a define for allclass to not deal with actively typing strings
#define CTAG_DISABLED 		"CAT_DISABLED" 		// Disabled, aka don't make it fuckin APPEAR
#define CTAG_PILGRIM 		"CAT_PILGRIM"  		// Pilgrim classes
#define CTAG_ADVENTURER 	"CAT_ADVENTURER"  	// Adventurer classes
#define CTAG_TOWNER 		"CAT_TOWNER"  		// Villager class - Villagers can use it
#define CTAG_ANTAG 			"CAT_ANTAG"  		// Antag class - results in an antag
#define CTAG_BANDIT			"CAT_BANDIT"		// Bandit class - Tied to the bandit antag really
#define CTAG_CHALLENGE 		"CAT_CHALLENGE"  	// Challenge class - Meant to be free for everyone
#define CTAG_MERCENARY		"CAT_MERCENARY"

/*
	String category tags
	This time for the drifter waves, used for sorting and scheduling purposes
*/
#define DTAG_ALLWAVES		"CAT_ALLWAVES"		// Another define for jus the basic allclass
#define DTAG_DISABLED		"CAT_DISABLED"		// Disabled, do not use
#define DTAG_FILLERS		"CAT_FILLER"		// If we have nothing better to do, time for filler
#define DTAG_ANTAGS			"CAT_ANTAGS"		// A catchall for antag groups
#define DTAG_BANDITS		"CAT_BANDITS"		// some bandits I guess

/*
	Defines for the triumph buy datum categories
*/
#define TRIUMPH_CAT_ROUND_EFX "ROUND-EFX"
#define TRIUMPH_CAT_CHARACTER "CHARACTER"
#define TRIUMPH_CAT_MISC "MISC!"
#define TRIUMPH_CAT_ACTIVE_DATUMS "ACTIVE"
