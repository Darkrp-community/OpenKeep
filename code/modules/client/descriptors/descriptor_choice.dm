/datum/descriptor_choice
	abstract_type = /datum/descriptor_choice
	var/name = "Descriptor"
	var/default_descriptor
	var/list/descriptors = list()

/datum/descriptor_choice/face
	name = "Face"
	default_descriptor = /datum/mob_descriptor/face/unremarkable
	descriptors = list(
		/datum/mob_descriptor/face/unremarkable,
		/datum/mob_descriptor/face/smooth,
		/datum/mob_descriptor/face/rough,
		/datum/mob_descriptor/face/chiseled,
		/datum/mob_descriptor/face/scarred,
		/datum/mob_descriptor/face/angular,
		/datum/mob_descriptor/face/gaunt,
		/datum/mob_descriptor/face/round,
		/datum/mob_descriptor/face/delicate,
		/datum/mob_descriptor/face/soft,
		/datum/mob_descriptor/face/sharp,
		/datum/mob_descriptor/face/sleek,
		/datum/mob_descriptor/face/broad,
		/datum/mob_descriptor/face/disfigured,
		/datum/mob_descriptor/face/tall,
		/datum/mob_descriptor/face/chubby,
		/datum/mob_descriptor/face/mousy,
		/datum/mob_descriptor/face/full,
		/datum/mob_descriptor/face/cat,
		/datum/mob_descriptor/face/pig,
		/datum/mob_descriptor/face/rat,
		/datum/mob_descriptor/face/hollow,
		/datum/mob_descriptor/face/weatherbitten,
		/datum/mob_descriptor/face/wrinkled,
		/datum/mob_descriptor/face/malformed,
	)

/datum/descriptor_choice/face_exp
	name = "Resting Expression"
	descriptors = list(
		/datum/mob_descriptor/face_exp/refined,
		/datum/mob_descriptor/face_exp/disinterested,
		/datum/mob_descriptor/face_exp/sour,
		/datum/mob_descriptor/face_exp/bright,
		/datum/mob_descriptor/face_exp/starry_eyed,
		/datum/mob_descriptor/face_exp/cold,
		/datum/mob_descriptor/face_exp/haggard,
		/datum/mob_descriptor/face_exp/fake,
		/datum/mob_descriptor/face_exp/bitchy,
		/datum/mob_descriptor/face_exp/spiteful,
		/datum/mob_descriptor/face_exp/warm,
		/datum/mob_descriptor/face_exp/salacious,
		/datum/mob_descriptor/face_exp/contemptous,
		/datum/mob_descriptor/face_exp/mocking,
		/datum/mob_descriptor/face_exp/knowing,
		/datum/mob_descriptor/face_exp/cocky,
		/datum/mob_descriptor/face_exp/coy,
		/datum/mob_descriptor/face_exp/frustrated,
		/datum/mob_descriptor/face_exp/stern,
		/datum/mob_descriptor/face_exp/genuine,
		/datum/mob_descriptor/face_exp/jaded,
		/datum/mob_descriptor/face_exp/inquisitive,
		/datum/mob_descriptor/face_exp/suspicious,
		/datum/mob_descriptor/face_exp/tender,
		/datum/mob_descriptor/face_exp/affectionate,
		/datum/mob_descriptor/face_exp/calm,
		/datum/mob_descriptor/face_exp/cutthroat,
		/datum/mob_descriptor/face_exp/suave,
		/datum/mob_descriptor/face_exp/humble,
		/datum/mob_descriptor/face_exp/smug,
		/datum/mob_descriptor/face_exp/curious,
		/datum/mob_descriptor/face_exp/dreamy,
		/datum/mob_descriptor/face_exp/mild,
		/datum/mob_descriptor/face_exp/glowering,
		/datum/mob_descriptor/face_exp/miserable,
		/datum/mob_descriptor/face_exp/puzzled,
		/datum/mob_descriptor/face_exp/shy,
	)

/datum/descriptor_choice/body
	name = "Body"
	default_descriptor = /datum/mob_descriptor/body/average
	descriptors = list(
		/datum/mob_descriptor/body/average,
		/datum/mob_descriptor/body/athletic,
		/datum/mob_descriptor/body/barrel,
		/datum/mob_descriptor/body/broadshoulder,
		/datum/mob_descriptor/body/burly,
		/datum/mob_descriptor/body/bulky,
		/datum/mob_descriptor/body/bottomheavy,
		/datum/mob_descriptor/body/bowleg,
		/datum/mob_descriptor/body/curvy,
		/datum/mob_descriptor/body/decrepit,
		/datum/mob_descriptor/body/dainty,
		/datum/mob_descriptor/body/gaunt,
		/datum/mob_descriptor/body/heavy,
		/datum/mob_descriptor/body/herculean,
		/datum/mob_descriptor/body/plump,
		/datum/mob_descriptor/body/pearshaped,
		/datum/mob_descriptor/body/pudgy,
		/datum/mob_descriptor/body/petite,
		/datum/mob_descriptor/body/portly,
		/datum/mob_descriptor/body/round,
		/datum/mob_descriptor/body/skeletal,
		/datum/mob_descriptor/body/strongfat,
		/datum/mob_descriptor/body/slender,
		/datum/mob_descriptor/body/lissome,
		/datum/mob_descriptor/body/lanky,
		/datum/mob_descriptor/body/lean,
		/datum/mob_descriptor/body/muscular,
		/datum/mob_descriptor/body/twiggy,
		/datum/mob_descriptor/body/topheavy,
		/datum/mob_descriptor/body/thin,
		/datum/mob_descriptor/body/willowy,
		/datum/mob_descriptor/body/wiry,
	)

/datum/descriptor_choice/stature
	name = "Stature"
	default_descriptor = /datum/mob_descriptor/stature/man
	descriptors = list(
		/datum/mob_descriptor/stature/man,
		/datum/mob_descriptor/stature/gentleman,
		/datum/mob_descriptor/stature/thug,
		/datum/mob_descriptor/stature/snob,
		/datum/mob_descriptor/stature/slob,
		/datum/mob_descriptor/stature/brute,
		/datum/mob_descriptor/stature/highbrow,
		/datum/mob_descriptor/stature/stooge,
		/datum/mob_descriptor/stature/fool,
		/datum/mob_descriptor/stature/bookworm,
		/datum/mob_descriptor/stature/lowlife,
		/datum/mob_descriptor/stature/dignitary,
		/datum/mob_descriptor/stature/trickster,
		/datum/mob_descriptor/stature/vagabond,
		/datum/mob_descriptor/stature/foreigner,
		/datum/mob_descriptor/stature/scoundrel,
		/datum/mob_descriptor/stature/commoner,
		/datum/mob_descriptor/stature/simpleton,
		/datum/mob_descriptor/stature/cavalier,
		/datum/mob_descriptor/stature/swashbuckler,
	)

/datum/descriptor_choice/voice
	name = "Voice"
	default_descriptor = /datum/mob_descriptor/voice/ordinary
	descriptors = list(
		/datum/mob_descriptor/voice/ordinary,
		/datum/mob_descriptor/voice/monotone,
		/datum/mob_descriptor/voice/deep,
		/datum/mob_descriptor/voice/soft,
		/datum/mob_descriptor/voice/shrill,
		/datum/mob_descriptor/voice/sleepy,
		/datum/mob_descriptor/voice/commanding,
		/datum/mob_descriptor/voice/kind,
		/datum/mob_descriptor/voice/growly,
		/datum/mob_descriptor/voice/androgynous,
		/datum/mob_descriptor/voice/nasal,
		/datum/mob_descriptor/voice/refined,
		/datum/mob_descriptor/voice/cheery,
		/datum/mob_descriptor/voice/dispassionate,
		/datum/mob_descriptor/voice/gravelly,
		/datum/mob_descriptor/voice/whiny,
		/datum/mob_descriptor/voice/melodic,
		/datum/mob_descriptor/voice/drawling,
		/datum/mob_descriptor/voice/stilted,
		/datum/mob_descriptor/voice/grave,
		/datum/mob_descriptor/voice/doting,
		/datum/mob_descriptor/voice/booming,
		/datum/mob_descriptor/voice/lisping,
		/datum/mob_descriptor/voice/honeyed,
		/datum/mob_descriptor/voice/facetious,
		/datum/mob_descriptor/voice/snide,
		/datum/mob_descriptor/voice/smoker,
		/datum/mob_descriptor/voice/venomous,
		/datum/mob_descriptor/voice/stuttering,
	)

/datum/descriptor_choice/skin
	name = "Skin"
	default_descriptor = /datum/mob_descriptor/skin/normal
	descriptors = list(
		/datum/mob_descriptor/skin/normal,
		/datum/mob_descriptor/skin/hairy,
		/datum/mob_descriptor/skin/soft,
		/datum/mob_descriptor/skin/rugged,
		/datum/mob_descriptor/skin/diseased,
		/datum/mob_descriptor/skin/dry,
		/datum/mob_descriptor/skin/fine,
		/datum/mob_descriptor/skin/fair,
		/datum/mob_descriptor/skin/wrinkled,
		/datum/mob_descriptor/skin/sunkissed,
		/datum/mob_descriptor/skin/aged,
		/datum/mob_descriptor/skin/pockmarked,
		/datum/mob_descriptor/skin/dusky,
		/datum/mob_descriptor/skin/irritated,
		/datum/mob_descriptor/skin/ashen,
		/datum/mob_descriptor/skin/calloused,
		/datum/mob_descriptor/skin/warts,
		/datum/mob_descriptor/skin/inked,
		/datum/mob_descriptor/skin/freckles,
	)

/datum/descriptor_choice/height
	name = "Height"
	default_descriptor = /datum/mob_descriptor/height/moderate
	descriptors = list(
		/datum/mob_descriptor/height/moderate,
		/datum/mob_descriptor/height/tall,
		/datum/mob_descriptor/height/short,
		/datum/mob_descriptor/height/towering,
		/datum/mob_descriptor/height/tiny,
		/datum/mob_descriptor/height/shortly,
		/datum/mob_descriptor/height/tallish,
		/datum/mob_descriptor/height/average,	
		/datum/mob_descriptor/height/lowslung,
		/datum/mob_descriptor/height/statuesque,
		/datum/mob_descriptor/height/longshanked,
	)


#define PROMINENT_DESCRIPTORS \
	/datum/mob_descriptor/prominent/hunched_over,\
	/datum/mob_descriptor/prominent/drooling,\
	/datum/mob_descriptor/prominent/lazy_eye,\
	/datum/mob_descriptor/prominent/bloodshot_eye,\
	/datum/mob_descriptor/prominent/baggy_eye,\
	/datum/mob_descriptor/prominent/twitchy,\
	/datum/mob_descriptor/prominent/clumsy,\
	/datum/mob_descriptor/prominent/unkempt,\
	/datum/mob_descriptor/prominent/tidy,\
	/datum/mob_descriptor/prominent/eloquent,\
	/datum/mob_descriptor/prominent/cleft_lip,\
	/datum/mob_descriptor/prominent/physically_deformed,\
	/datum/mob_descriptor/prominent/extensive_scars,\
	/datum/mob_descriptor/prominent/move_strange,\
	/datum/mob_descriptor/prominent/ghoulish_appearance,\
	/datum/mob_descriptor/prominent/prominent_chest,\
	/datum/mob_descriptor/prominent/prominent_thighs,\
	/datum/mob_descriptor/prominent/prominent_shoulders,\
	/datum/mob_descriptor/prominent/prominent_jawline,\
	/datum/mob_descriptor/prominent/prominent_bottom,\
	/datum/mob_descriptor/prominent/prominent_potbelly,\
	/datum/mob_descriptor/prominent/cold_gaze,\
	/datum/mob_descriptor/prominent/piercing_gaze,\
	/datum/mob_descriptor/prominent/innocent_gaze,\
	/datum/mob_descriptor/prominent/intimidating_presence,\
	/datum/mob_descriptor/prominent/meek_presence,\
	/datum/mob_descriptor/prominent/adorable_presence,\
	/datum/mob_descriptor/prominent/lordly_presence,\
	/datum/mob_descriptor/prominent/doting_presence,\
	/datum/mob_descriptor/prominent/aristocratic_haughtiness,\
	/datum/mob_descriptor/prominent/ghastly_pale,\
	/datum/mob_descriptor/prominent/elaborate_tattoos,\
	/datum/mob_descriptor/prominent/ritual_tattoos,\
	/datum/mob_descriptor/prominent/tribal_tattoos,\
	/datum/mob_descriptor/prominent/slave_tattoos,\
	/datum/mob_descriptor/prominent/enigmatic_tattoos,\
	/datum/mob_descriptor/prominent/mean_look,\
	/datum/mob_descriptor/prominent/haughty_atmosphere,\
	/datum/mob_descriptor/prominent/untrustworthy,\
	/datum/mob_descriptor/prominent/ratty_hair,\
	/datum/mob_descriptor/prominent/predatory_look,\
	/datum/mob_descriptor/prominent/chaste_mannerism,\
	/datum/mob_descriptor/prominent/whimsy,\
	/datum/mob_descriptor/prominent/dim_look,\
	/datum/mob_descriptor/prominent/keen_look,\
	/datum/mob_descriptor/prominent/presence_stoic,\
	/datum/mob_descriptor/prominent/hands_platters,\
	/datum/mob_descriptor/prominent/laugh_donkey,\
	/datum/mob_descriptor/prominent/fingers_long,\
	/datum/mob_descriptor/prominent/hands_delicate,\
	/datum/mob_descriptor/prominent/teeth_fine,\
	/datum/mob_descriptor/prominent/teeth_rotting,\
	/datum/mob_descriptor/prominent/teeth_missing,\
	/datum/mob_descriptor/prominent/nose_crooked,\
	/datum/mob_descriptor/prominent/nose_broken,\
	/datum/mob_descriptor/prominent/nose_button,\
	/datum/mob_descriptor/prominent/nose_hawk,\
	/datum/mob_descriptor/prominent/nose_aquiline,\
	/datum/mob_descriptor/prominent/neck_bull,\
	/datum/mob_descriptor/prominent/hair_perfumed,\
	/datum/mob_descriptor/prominent/hair_oiled,\
	/datum/mob_descriptor/prominent/hair_curly,\
	/datum/mob_descriptor/prominent/hair_coarse,\
	/datum/mob_descriptor/prominent/hair_thin,\
	/datum/mob_descriptor/prominent/ears_large,\
	/datum/mob_descriptor/prominent/custom/one,\
	/datum/mob_descriptor/prominent/custom/two

/datum/descriptor_choice/prominent_one
	name = "Prominent #1"
	default_descriptor = /datum/mob_descriptor/prominent/unkempt
	descriptors = list(PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_two
	name = "Prominent #2"
	default_descriptor = /datum/mob_descriptor/prominent/dim_look
	descriptors = list(PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_three
	name = "Prominent #3"
	default_descriptor = /datum/mob_descriptor/prominent/none
	descriptors = list(/datum/mob_descriptor/prominent/none, PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_four
	name = "Prominent #4"
	default_descriptor = /datum/mob_descriptor/prominent/none
	descriptors = list(/datum/mob_descriptor/prominent/none, PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_one_wild
	name = "Prominent #1"
	default_descriptor = /datum/mob_descriptor/prominent/unkempt
	descriptors = list(PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_two_wild
	name = "Prominent #2"
	default_descriptor = /datum/mob_descriptor/prominent/dim_look
	descriptors = list(PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_three_wild
	name = "Prominent #3"
	default_descriptor = /datum/mob_descriptor/prominent/none
	descriptors = list(/datum/mob_descriptor/prominent/none, PROMINENT_DESCRIPTORS)

/datum/descriptor_choice/prominent_four_wild
	name = "Prominent #4"
	default_descriptor = /datum/mob_descriptor/prominent/none
	descriptors = list(/datum/mob_descriptor/prominent/none, PROMINENT_DESCRIPTORS)

#undef PROMINENT_DESCRIPTORS
