GLOBAL_LIST_EMPTY(patronlist)

#define CLERIC_SPELLS "Cleric"
#define PRIEST_SPELLS "Priest"

/datum/patrongods
	var/name
	var/domain
	var/summary
	var/flaws
	var/worshippers
	var/sins
	var/t0
	var/t1
	var/t2
	var/t3

/datum/patrongods/astrata
	name = "Astrata"
	domain = "Goddess of Order, the Sun Queen"
	summary = "The Firstborn of Psydon, twin of Noc, gifted man the Sun as her divine gift."
	flaws= "Tyrannical, Fury, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal/
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patrongods/noc
	name = "Noc"
	domain = "God of Knowledge, the Moon Prince"
	summary = "The Firstborn of Psydon, twin of Astrala, gifted man divine knowledge."
	flaws= "Resentful, Vindictive, Haughty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Ignorance, Burning books, Carnal desire"


// ............ FORCES ..................
/datum/patrongods/abyssor
	name = "Abyssor"
	domain = "Force of Seas and Storms"
	summary = "The World Whale, one of the three primordial forces."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Men of the Sea and Sky, Horrid sea-creechers"
	sins = "Fear, Hubris, Trying to tame water and storms"

/datum/patrongods/necra  /// SUMMARY AND FLASWS AND SINS
	name = "Necra"
	domain = "Force of Death and Decay"
	summary = "By some worshipped as the Undermaiden, death cares little for the living."
	flaws= "Unchanging, Apathetic, Strict"
	worshippers = " The Dead, Gravekeepers and Mourners"
	sins = "Undeath"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn

/datum/patrongods/dendor
	name = "Dendor"
	domain = "Force of Nature and Beasts"
	summary = "The Primordial Son, patron of beasts and the wood. Gone mad with time."
	flaws= "Madness, Rebellious, Disorderly"
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Overhunting, Disrespecting nature"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = null


// ............ SAINTS ..................
/datum/patrongods/ravox
	name = "Ravox"
	domain = "Saint of Warfare, Struggle and Strife"
	summary = "The strong-arm of the Pantheon, he watches man from afar."
	flaws= "Careless, Confrontational, Proud"
	worshippers = "Warriors, Sellswords & the Ambitious"
	sins = "Cowardice, Dishonoring a duel, Weakness"

/datum/patrongods/xylix
	name = "Xylix"
	domain = "Saint of Deceit, Misfortune and Creativity"
	summary = "Mortal turned trickster and shadow of the Pantheon."
	flaws= "Annoying, Liar, Deceitful"
	worshippers = "Cheats, Artists, the Hopeless"
	sins = "Boredom, Predictability, Routine"

/datum/patrongods/pestra
	name = "Pestra"
	domain = "Saint of Disease, Alchemy, and Prophecy"
	summary = "A mortal turned saint by her own brew."
	flaws= "Disrespectful, Irresponsible, Drunkard"
	worshippers = "Warlocks, The Sick and Alchemists"
	sins = "´Curing´ abnormalities, Refusing to help the misfortunates, Groveling"

/datum/patrongods/malum
	name = "Malum"
	domain = "Saint of Toil, Value and Craft"
	summary = "Father of the dwarves, master of the craft."
	flaws= "Obsessive, Repetetive, Greedy"
	worshippers = "Smiths, Miners, Artists."
	sins = "Cheating, Shoddy work, Suicide"

/datum/patrongods/eora
	name = "Eora"
	domain = "Saint of the Love, Life and Beauty"
	summary = "Blind love for all, without a shred of hate in her heart"
	flaws= "Naive, Compulsive, Ignorant"
	worshippers = "Lovers, Harlots, Doting Grandparents"
	sins = "Cruelty, Celibacy, Ruining beauty"


