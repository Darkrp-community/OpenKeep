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
	createmultiple = TRUE
	createditem_num = 0
	craftdiff = 0

/datum/anvil_recipe/armor/copperbracers
	name = "Copper armbraces"
	recipe_name = "a couple of copper Vambraces"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/wrists/roguetown/bracers/copper
	createmultiple = TRUE
	createditem_num = 0
	craftdiff = 0

/datum/anvil_recipe/armor/coppercap
	name = "Copper cap"
	recipe_name = "a copper cap"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/head/roguetown/helmet/coppercap
	createmultiple = TRUE
	createditem_num = 0
	craftdiff = 0

/datum/anvil_recipe/armor/gorgetcopper
	name = "Gorget"
	recipe_name = "a Gorget made out of copper"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/neck/roguetown/gorget/copper
	createmultiple = TRUE
	createditem_num = 0
	craftdiff = 0

/datum/anvil_recipe/armor/copperchest
	name = "Copper heart protector (2)"
	recipe_name = "a very simple armor piece for the chest"
	req_bar = /obj/item/ingot/copper
	created_item = /obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	additional_items = list(/obj/item/ingot/copper)
	createditem_num = 0
	craftdiff = 0

// --------- IRON -----------

/datum/anvil_recipe/armor/ichainleg
	name = "Chain chausses x2"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/under/roguetown/chainlegs/iron
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/ichaincoif
	name = "Chain coif x2"
	recipe_name = "a pair of Chain Coifs"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/chaincoif/iron
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/ichainglove
	name = "Chain gauntlets x2"
	recipe_name = "a pair of Chain Gauntlets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/gloves/roguetown/chain/iron
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/ichainmail
	name = "Chainmail"
	recipe_name = "a Chainmail"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/iron


/datum/anvil_recipe/armor/iplate
	name = "Plate armor (3)"
	recipe_name = "a heavy plate armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/ingot/iron)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/iron
	craftdiff = 1

/datum/anvil_recipe/armor/iplatehelmet
	name = "Plate helmet (2)"
	recipe_name = "a face guarded iron helmet"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/ironplate
	craftdiff = 1

/datum/anvil_recipe/armor/ipothelmet
	name = "Pot helmet"
	recipe_name = "a heavy iron helmet"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/ironpot
	craftdiff = 1

/datum/anvil_recipe/armor/platemask
	name = "Face mask x2"
	recipe_name = "a pair of Face Masks"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/mask/rogue/facemask
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/gorget
	name = "Gorget x2"
	recipe_name = "a pair of Gorgets"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/neck/roguetown/gorget
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/armor/platebootlight
	name = "Light plate boots x2"
	recipe_name = "a pair of Light Plate Boots"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/shoes/roguetown/boots/armor/light
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/skullcap
	name = "Skullcap x2"
	recipe_name = "a pair of Skullcaps"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/head/roguetown/helmet/skullcap
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/studdedleather
	name = "Studded leather (2h)"
	recipe_name = "a Studded Leather Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded
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
	name = "Chain chausses x2"
	recipe_name = "a pair of Chain Chausses"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/under/roguetown/chainlegs
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/chaincoif
	name = "Chain coif x2"
	recipe_name = "a pair of Chain Coifs"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/neck/roguetown/chaincoif
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/chainglove
	name = "Chain gauntlets x2"
	recipe_name = "a pair of Chain Gauntlets"
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
	name = "Kettle helmet x2"
	recipe_name = "a pair of Kettle Helmets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet/kettle
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

/datum/anvil_recipe/armor/helmetknight
	name = "Knight's helmet (2)"
	recipe_name = "a Knight's Helmet"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/visored/knight)
	craftdiff = 3

/datum/anvil_recipe/armor/helmetnasal
	name = "Nasal helmet x2"
	recipe_name = "a pair of Nasal Helmets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/head/roguetown/helmet
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 2

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
	name = "Plate vambraces x2"
	recipe_name = "a couple of Plate Vambraces"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/wrists/roguetown/bracers
	createmultiple = TRUE
	createditem_num = 1
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
	recipe_name = "some Plate Gauntlets"
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
	i_type = "Armor"

/datum/anvil_recipe/armor/decoratedhelmetpig
	name = "Decorated Pigface Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/hounskull
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/decoratedhelmetbuc
	name = "Decorated Bucket Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/bucket
	craftdiff = 3
	i_type = "Armor"

/datum/anvil_recipe/armor/decoratedhelmetbucgold
	name = "Decorated Gold-Trimmed Bucket Helmet (2) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/natural/cloth)
	created_item = /obj/item/clothing/head/roguetown/helmet/heavy/decorated/golden
	craftdiff = 3
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

 //huh. We can make these uniquely then. Since we can't make the iron chainmail for the european counterparts?... why?
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
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded/kikko
	craftdiff = 1

/obj/item/clothing/suit/roguetown/armor/rattan //cheaper on iron, but has many sticks. Proper for this armor's context.
/datum/anvil_recipe/armor/iplate
	name = "Iron-woven Rattan armor (2) (4s)"
	recipe_name = "a Rattan Armor"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/clothing/suit/roguetown/armor/rattan
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
	created_item = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
	createmultiple = TRUE
	createditem_num = 1

/datum/anvil_recipe/armor/suneate
	name = "Plated shin-guards"
	recipe_name = "some Suneate Footwear"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/suneate
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
	recipe_name = "a Kenku Mask"
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

