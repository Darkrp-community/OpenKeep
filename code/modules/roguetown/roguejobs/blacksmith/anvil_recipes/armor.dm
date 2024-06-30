/datum/anvil_recipe/armor
	appro_skill = /datum/skill/craft/armorsmithing

// --------- IRON -----------

/datum/anvil_recipe/armor/ichainleg
	name = "Chain chausses x2"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/under/roguetown/chainlegs/iron,
						/obj/item/clothing/under/roguetown/chainlegs/iron)

/datum/anvil_recipe/armor/ichaincoif
	name = "Chain coif"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/neck/roguetown/chaincoif/iron, 
						/obj/item/clothing/neck/roguetown/chaincoif/iron)

/datum/anvil_recipe/armor/ichainglove
	name = "Chain gauntlets x2"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/gloves/roguetown/chain/iron,
						/obj/item/clothing/gloves/roguetown/chain/iron)

/datum/anvil_recipe/armor/ichainmail
	name = "Chainmail"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/suit/roguetown/armor/chainmail/iron,
						/obj/item/clothing/suit/roguetown/armor/chainmail/iron)

/datum/anvil_recipe/armor/platemask
	name = "Face mask x2"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/mask/rogue/facemask,
						/obj/item/clothing/mask/rogue/facemask)

/datum/anvil_recipe/armor/gorget
	name = "Gorget"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/neck/roguetown/gorget,
						/obj/item/clothing/neck/roguetown/gorget)

/datum/anvil_recipe/armor/platebootlight
    name = "Light plate boots x2"
    req_bar = /obj/item/ingot/iron
    created_item = list(/obj/item/clothing/shoes/roguetown/boots/armor/light,
						/obj/item/clothing/shoes/roguetown/boots/armor/light)

/datum/anvil_recipe/armor/skullcap
	name = "Skullcap"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/clothing/head/roguetown/helmet/skullcap,
						/obj/item/clothing/head/roguetown/helmet/skullcap)

/datum/anvil_recipe/armor/studdedleather
	name = "Studded leather (2h)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/hide, /obj/item/natural/hide)
	created_item = /obj/item/clothing/suit/roguetown/armor/leather/studded

// --------- STEEL -----------

/datum/anvil_recipe/armor/bevor
	name = "Bevor"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/neck/roguetown/bevor)

/datum/anvil_recipe/armor/brigadine
	name = "Brigadine (3) (c)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel, /obj/item/natural/cloth)
	created_item = /obj/item/clothing/suit/roguetown/armor/brigandine

/datum/anvil_recipe/armor/helmetbuc
	name = "Bucket helmet"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/bucket)

/datum/anvil_recipe/armor/chainleg
	name = "Chain chausses"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/under/roguetown/chainlegs,
						/obj/item/clothing/under/roguetown/chainlegs)

/datum/anvil_recipe/armor/chaincoif
	name = "Chain coif x2"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/neck/roguetown/chaincoif,
						/obj/item/clothing/neck/roguetown/chaincoif)

/datum/anvil_recipe/armor/chainglove
	name = "Chain gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/gloves/roguetown/chain,
						/obj/item/clothing/gloves/roguetown/chain,)

/datum/anvil_recipe/armor/hplate
	name = "Cuirass"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/half

/datum/anvil_recipe/armor/platemask/steel
	name = "Face mask"
	req_bar = /obj/item/ingot/steel
	created_item = (/obj/item/clothing/mask/rogue/facemask/steel)

/datum/anvil_recipe/armor/plate
	name = "Half-plate armor (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate

/datum/anvil_recipe/armor/haubergeon
	name = "Haubergeon"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail

/datum/anvil_recipe/armor/hauberk
	name = "Hauberk (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk

/datum/anvil_recipe/armor/helmetkettle
	name = "Kettle helmet"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet/kettle,
						/obj/item/clothing/head/roguetown/helmet/kettle)

/datum/anvil_recipe/armor/helmetknight
	name = "Knight's helmet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/knight)

/datum/anvil_recipe/armor/helmetnasal
	name = "Nasal helmet x2"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet,
						/obj/item/clothing/head/roguetown/helmet)

/datum/anvil_recipe/armor/hounskull
	name = "Hounskull helmet (3)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel, /obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/heavy/hounskull)

/datum/anvil_recipe/armor/platefull
	name = "Plate armor (4)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel,/obj/item/ingot/steel,/obj/item/ingot/steel)
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/full

/datum/anvil_recipe/armor/platebracer
	name = "Plate vambraces x2"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/wrists/roguetown/bracers,
					/obj/item/clothing/wrists/roguetown/bracers)

/datum/anvil_recipe/armor/plateleg
	name = "Plate chausses x2"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/under/roguetown/platelegs, 
						/obj/item/clothing/under/roguetown/platelegs)

/datum/anvil_recipe/armor/plateglove
	name = "Plate gauntlets"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/gloves/roguetown/plate)

/datum/anvil_recipe/armor/plateboot
    name = "Plated boots"
    req_bar = /obj/item/ingot/steel
    created_item = list(/obj/item/clothing/shoes/roguetown/boots/armor)

/datum/anvil_recipe/armor/helmetsall
	name = "Sallet"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/clothing/head/roguetown/helmet/sallet)

/datum/anvil_recipe/armor/scalemail
	name = "Scalemail"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/clothing/suit/roguetown/armor/plate/scale

/datum/anvil_recipe/armor/helmetsallv
	name = "Visored sallet (2)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/ingot/steel)
	created_item = (/obj/item/clothing/head/roguetown/helmet/sallet/visored)
