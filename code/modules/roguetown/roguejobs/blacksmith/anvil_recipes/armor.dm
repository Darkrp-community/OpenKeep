/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing
	i_type = "Armor"
	craftdiff = 1

// --------- COPPER -----------

/datum/anvil_recipe/armor/cmask
	name = "Copper mask"
	recipe_name = "a mask of copper"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/mask/rogue/facemask/copper
	craftdiff = 0

/datum/anvil_recipe/armor/copperbracers
	name = "Copper armbraces"
	recipe_name = "a couple of copper Vambraces"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/wrists/roguetown/bracers/copper
	craftdiff = 0

/datum/anvil_recipe/armor/coppercap
	name = "Copper cap"
	recipe_name = "a copper cap"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/head/roguetown/helmet/coppercap
	craftdiff = 0

/datum/anvil_recipe/armor/gorgetcopper
	name = "Copper neck protector"
	recipe_name = "a neck protector"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/neck/roguetown/gorget/copper
	craftdiff = 0

/datum/anvil_recipe/armor/copperchest
	name = "Copper heart protector"
	recipe_name = "a very simple armor piece for the chest"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	craftdiff = 0

// --------- IRON -----------

/datum/anvil_recipe/armor/iron
	req_bar = /obj/item/ingot/iron
	craftdiff = 0

/datum/anvil_recipe/armor/ichainleg
	name = "Chain chausses"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron
	craftdiff = 0

/datum/anvil_recipe/armor/iron/chaincoif
	name = "Chain coif"
	recipe_name = "a Chain Coif"
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron

/datum/anvil_recipe/armor/ichainglove
	name = "Chain gauntlets (x2)"
	recipe_name = "two pairs of Chain Gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/ichainmail
	name = "Chainmail"
	recipe_name = "maille shirt"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron


/datum/anvil_recipe/armor/iplate
	name = "Plate armor (3)"
	recipe_name = "heavy armor made of iron plates"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/iron
	craftdiff = 1

/datum/anvil_recipe/armor/iron/platehelmet
	name = "Plate helmet (2)"
	recipe_name = "a heavy iron helmet"
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/ironplate
	craftdiff = 1

/datum/anvil_recipe/armor/iron/pothelmet
	name = "Pot helmet"
	recipe_name = "a sturdy iron helmet"
	created_item = /obj/item/clothing/head/roguetown/helmet/ironpot
	craftdiff = 1

/datum/anvil_recipe/armor/platemask
	name = "Face mask"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/gorget
	name = "Gorget"
	recipe_name = "a gorget"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/gorget
	craftdiff = 0

/datum/anvil_recipe/armor/platebootlight
	name = "Light plate boots"
	recipe_name = "a pair of Light Plate Boots"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light

/datum/anvil_recipe/armor/iron/nasal_helmet
	name = "Nasal helmet"
	recipe_name = "a Nasal helmet"
	created_item = /obj/item/clothing/head/roguetown/helmet/nasal
	craftdiff = 2

/datum/anvil_recipe/armor/iron/skullcap
	name = "Skullcap"
	recipe_name = "a skullcap"
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap

/datum/anvil_recipe/armor/splint
	name = "Splint Armor (2h)"
	recipe_name = "durable light armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/splint
	craftdiff = 1

// --------- STEEL -----------

/datum/anvil_recipe/armor/bevor
	name = "Bevor"
	recipe_name = "a Bevor"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/bevor
	craftdiff = 2

/datum/anvil_recipe/armor/brigadine
	name = "Brigandine (3) (c)"
	recipe_name = "a Brigandine"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine
	craftdiff = 3

/datum/anvil_recipe/armor/helmetbuc
	name = "Bucket helmet"
	recipe_name = "a Bucket Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket)
	craftdiff = 2

/datum/anvil_recipe/armor/chainleg
	name = "Chain chausses"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs
	craftdiff = 2

/datum/anvil_recipe/armor/chaincoif
	name = "Chain coif"
	recipe_name = "a Chain Coif"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif
	craftdiff = 2

/datum/anvil_recipe/armor/chainglove
	name = "Chain gauntlets x2"
	recipe_name = "two pairs of Chain Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/cuirass
	name = "Cuirass"
	recipe_name = "a Cuirass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass
	craftdiff = 2

/datum/anvil_recipe/armor/platemask/steel
	name = "Face mask"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
	craftdiff = 2

/datum/anvil_recipe/armor/halfplate
	name = "Half-plate armor (3)"
	recipe_name = "a Half-Plate Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate
	craftdiff = 3

/datum/anvil_recipe/armor/haubergeon
	name = "Haubergeon"
	recipe_name = "a Haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail
	craftdiff = 2

/datum/anvil_recipe/armor/hauberk
	name = "Hauberk (2)"
	recipe_name = "a Hauberk"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	craftdiff = 3

/datum/anvil_recipe/armor/helmetkettle
	name = "Kettle helmet"
	recipe_name = "a Kettle Helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	craftdiff = 2

/datum/anvil_recipe/armor/helmetslitkettle
	name = "Slitted Kettle helmet"
	recipe_name = "a slitted kettle helmets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle/slit
	craftdiff = 2

/datum/anvil_recipe/armor/froghelmet
	name = "Frog helmet"
	recipe_name = "a frog helmet"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/frog)
	craftdiff = 2

/datum/anvil_recipe/armor/helmetknight
	name = "Knight's helmet (2)"
	recipe_name = "a Knight's Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/knight)
	craftdiff = 3


/datum/anvil_recipe/armor/hounskull
	name = "Hounskull helmet (3)"
	recipe_name = "a Hounskull Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/hounskull)
	craftdiff = 4

/datum/anvil_recipe/armor/platefull
	name = "Plate armor (4)"
	recipe_name = "a Full-Plate Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full
	craftdiff = 4

/datum/anvil_recipe/armor/platebracer
	name = "Plate vambraces"
	recipe_name = "Plate Vambraces"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers
	craftdiff = 3

/datum/anvil_recipe/armor/plateleg
	name = "Plate chausses x2"
	recipe_name = "a couple of Plate Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/platelegs
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

/datum/anvil_recipe/armor/plateglove
	name = "Plate gauntlets"
	recipe_name = "a pair of Plate Gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate
	craftdiff = 3

/datum/anvil_recipe/armor/plateboot
	name = "Plated boots"
	recipe_name = "some Plated Boots"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor
	craftdiff = 3

/datum/anvil_recipe/armor/helmetsall
	name = "Sallet"
	recipe_name = "a Sallet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet
	craftdiff = 2

/datum/anvil_recipe/armor/bascinet
	name = "Bascinet"
	recipe_name = "a bascinet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/bascinet
	craftdiff = 2

/datum/anvil_recipe/armor/scalemail
	name = "Scalemail"
	recipe_name = "a Scalemail"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/medium/scale
	craftdiff = 3

/datum/anvil_recipe/armor/helmetsallv
	name = "Visored sallet (2)"
	recipe_name = "a Visored Sallet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/sallet)
	craftdiff = 3

/datum/anvil_recipe/armor/decoratedhelmetknight
	name = "Decorated Knight's Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/knight
	craftdiff = 4

/datum/anvil_recipe/armor/decoratedhelmetpig
	name = "Decorated Pigface Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/hounskull
	craftdiff = 3

/datum/anvil_recipe/armor/decoratedhelmetbuc
	name = "Decorated Bucket Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/bucket
	craftdiff = 3

/datum/anvil_recipe/armor/decoratedhelmetbucgold
	name = "Decorated Gold-Trimmed Bucket Helmet (3) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/gold,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/golden
	craftdiff = 3

/datum/anvil_recipe/armor/decoratedbascinet
	name = "Decorated Bascinet (c)"
	recipe_name = "a decorated bascinet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/bascinet
	craftdiff = 2
	i_type = "Armor"

//Kaizoku Smithing content. I humbly ask for help; A way in which only people with the trait "Kaizoku", being the ones able to make Kaizoku weapons and armor. In another hand,
//they cannot make most (exceptions; the objects that have no abyssariad alternative) armors and weapons.

//'armor'
/datum/anvil_recipe/armor/nanbando
	name = "Barbarian half-plate (3)"
	recipe_name = "a Nanban-Dou-Sode"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/nanbando
	craftdiff = 3

/datum/anvil_recipe/armor/nanbandocuirass
	name = "Barbarian Cuirass"
	recipe_name = "a Nanban-Dou"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
	craftdiff = 2

/datum/anvil_recipe/armor/nanbandofull
	name = "Barbarian Fullplate (4)"
	recipe_name = "a Nanban-Do-Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	craftdiff = 4

/datum/anvil_recipe/armor/steeltatami
	name = "Steel foldeable armor"
	recipe_name = "a Lamellae Tatami-Do"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	craftdiff = 2

// huh. We can make these uniquely then. Since we can't make the iron chainmail for the european counterparts?... why?
/datum/anvil_recipe/armor/irontatami
	name = "Iron foldeable armor"
	recipe_name = "a Tatami Karuta-Gane"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	craftdiff = 2
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/kusari
	name = "Chainmail Robe (2)"
	recipe_name = "a Kusari-Katabira"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	craftdiff = 3

/datum/anvil_recipe/armor/imirror
	name = "Iron disk chestplate (3)"
	recipe_name = "a Iron Mirror Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	craftdiff = 1

/datum/anvil_recipe/armor/mirror
	name = "Steel disk chestplate (3)"
	recipe_name = "a Steel Mirror Armor"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/mirror
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroi
	name = "Compact great armor (3) (c)"
	recipe_name = "a Incomplete O-Yoroi"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
	craftdiff = 3

/datum/anvil_recipe/armor/oyoroigusoku //costier version. Only really viable if you got what to waste.
	name = "Full great armor (4) (2c)"
	recipe_name = "a O-Yoroi Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	craftdiff = 3

/datum/anvil_recipe/armor/sanmaido
	name = "Three-plate cuirass"
	recipe_name = "a Sanmai-Do"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
	craftdiff = 2

/datum/anvil_recipe/armor/kikko
	name = "Turtleshell leather armor (2h)"
	recipe_name = "a Kikko Leather Do"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/splint/kikko
	craftdiff = 1

//cheaper on iron, but has many sticks. Proper for this armor's context.
/datum/anvil_recipe/armor/rattanarmor
	name = "Iron-woven Rattan armor (2) (4s)"
	recipe_name = "a Rattan Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/rattan
	craftdiff = 1

/datum/anvil_recipe/armor/kikkoarmor //cheaper brigadine with hide.
	name = "Turtleshell Full Armor (2) (2h)"
	recipe_name = "a Kikko Gusoku"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	craftdiff = 3

//'feet'
/datum/anvil_recipe/armor/kusaritabi
	name = "Chainmail footwear x2"
	recipe_name = "a pair of Kusari-Tabi"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/suneate
	name = "Plated shin-guards"
	recipe_name = "some Suneate Footwear"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/suneate
	craftdiff = 3

//'gloves'
/datum/anvil_recipe/armor/kikkotekko
	name = "Turtleshell gauntlets x2"
	recipe_name = "a pair of Steel Kikko Tekko"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/chain/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ikikkotekko
	name = "Turtleshell gauntlets x2"
	recipe_name = "a pair of Iron Kikko Tekko"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron/kikko
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/lamellaetekko
	name = "Lamellae gauntlets"
	recipe_name = "some Lamellae Tekko"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/gloves/roguetown/plate/lamellaetekko
	craftdiff = 3

//'hats'
/datum/anvil_recipe/armor/hachigane
	name = "Hachigane x2"
	recipe_name = "a pair of Hachinage"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/rattanhelmet
	name = "Iron Woven Rattan Helmet x2 (3s)"
	recipe_name = "a pair of Rattan Helmets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap/rattan
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	createmultiple = TRUE
	createditem_num = 1

/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion
/datum/anvil_recipe/armor/abyssalchampion
	name = "Newfangled Myrmidon Helmet (3)"
	recipe_name = "a Abyssal Champion Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/abyssalchampion)
	craftdiff = 4

/datum/anvil_recipe/armor/helmetbuc
	name = "Sohei Heavy Headwear"
	recipe_name = "a Armored sohei cowl"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon)
	craftdiff = 2

/datum/anvil_recipe/armor/zunari
	name = "Zamurai's helmet (2)"
	recipe_name = "a Zunari's Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/zunari)
	craftdiff = 3

/datum/anvil_recipe/armor/zijinguan
	name = "Plumed Footsoldier helmet x2"
	recipe_name = "a pair of Zijinguan helmet"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/zijinguan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/jingasa
	name = "Conical Ashigaru helmet x2"
	recipe_name = "a pair of Jingasas"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/jingasa
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabuto
	name = "Tosei-kabuto"
	recipe_name = "a Tosei Kabuto"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
	craftdiff = 2

/datum/anvil_recipe/armor/toseikabutov
	name = "Visored tosei-kabuto (2)"
	recipe_name = "a Visored Tosei Kabuto"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/sallet/tosei_kabuto)
	craftdiff = 3

//'mask'
/datum/anvil_recipe/armor/imenpo
	name = "Iron faceguard"
	recipe_name = "a Iron Menpo"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo
	craftdiff = 0

/datum/anvil_recipe/armor/himenpo
	name = "Iron half-faceguard x2"
	recipe_name = "a pair of Compact Menpo"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/smenpo
	name = "Steel faceguard"
	recipe_name = "a Steel Menpo"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/half)
	craftdiff = 2

/datum/anvil_recipe/armor/hsmenpo
	name = "Steel half-faceguard x2"
	recipe_name = "a Face Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/steel)
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/itribalfish
	name = "Iron fishpeople mask x2"
	recipe_name = "a pair of iron Merkkin masks"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/kaizoku/menpo/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/stribalfish
	name = "Steel fishpeople mask"
	recipe_name = "a Steel Merkkin Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/steel)
	craftdiff = 2

/datum/anvil_recipe/armor/ctengu
	name = "Birdpeople champion mask"
	recipe_name = "a Skylancer Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/tengu)
	craftdiff = 2

/datum/anvil_recipe/armor/ckitsune
	name = "Foxpeople champion mask"
	recipe_name = "a Changeling Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/kitsune)
	craftdiff = 2

/datum/anvil_recipe/armor/coni
	name = "Ogrepeople champion mask"
	recipe_name = "a ogrun Mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)
	craftdiff = 2

//'neck'
/datum/anvil_recipe/armor/shood
	name = "Karuta hood x2"
	recipe_name = "a pair of Karuta Zukin"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/ihood
	name = "Chainmail hood x2"
	recipe_name = "a pair of Kusari Zukin"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

//'pants'
/datum/anvil_recipe/armor/ihaidate
	name = "Foldable Thighguards x2"
	recipe_name = "a pair of Haidate Tatami"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/shaidate
	name = "Plate Thighguards x2"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs/sendan
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/superhaidate
	name = "Plated Trousers x2"
	recipe_name = "a couple of Yoroi-Hakama"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/platelegs/yoroihakama
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3

//'wrists'
/datum/anvil_recipe/armor/kote //Protects more limbs, so it is costier.
	name = "Armored Sleeve"
	recipe_name = "a couple of Kote"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/kote
	craftdiff = 4

/datum/anvil_recipe/armor/weeper
	name = "Weeper Bracers x2"
	recipe_name = "a couple of Weeping Bracers"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers/mountainstar
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 3
