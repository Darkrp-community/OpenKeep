/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 */



/*
 * DATA CARDS - Used for the IC data card reader
 */

/obj/item/card
	name = "card"
	desc = ""
	icon = 'icons/obj/card.dmi'
	w_class = WEIGHT_CLASS_TINY

	var/list/files = list()

/obj/item/card/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>[user] begins to swipe [user.p_their()] neck with \the [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return BRUTELOSS

/obj/item/card/data
	name = "data card"
	desc = ""
	icon_state = "data_1"
	obj_flags = UNIQUE_RENAME
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/data/Initialize()
	.=..()
	update_icon()

/obj/item/card/data/update_icon()
	cut_overlays()
	if(detail_color == COLOR_FLOORTILE_GRAY)
		return
	var/mutable_appearance/detail_overlay = mutable_appearance('icons/obj/card.dmi', "[icon_state]-color")
	detail_overlay.color = detail_color
	add_overlay(detail_overlay)

/obj/item/card/data/full_color
	desc = ""
	icon_state = "data_2"

/obj/item/card/data/disk
	desc = ""
	icon_state = "data_3"

/*
 * ID CARDS
 */
/obj/item/card/emag
	desc = ""
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	item_flags = NO_MAT_REDEMPTION | NOBLUDGEON
	var/prox_check = TRUE //If the emag requires you to be in range

/obj/item/card/emag/bluespace
	name = "bluespace cryptographic sequencer"
	desc = ""
	color = rgb(40, 130, 255)
	prox_check = FALSE

/obj/item/card/emag/attack()
	return

/obj/item/card/emag/afterattack(atom/target, mob/user, proximity)
	. = ..()
	var/atom/A = target
	if(!proximity && prox_check)
		return
	log_combat(user, A, "attempted to emag")
	A.emag_act(user)

/obj/item/card/emagfake
	desc = ""
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/emagfake/afterattack()
	. = ..()
	playsound(src, 'sound/blank.ogg', 50, TRUE)

/obj/item/card/id
	name = "identification card"
	desc = ""
	icon_state = "id"
	item_state = "card-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	slot_flags = ITEM_SLOT_RING
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/id_type_name = "identification card"
	var/mining_points = 0 //For redeeming at mining equipment vendors
	var/list/access = list()
	var/registered_name = null // The name registered_name on the card
	var/assignment = null
	var/access_txt // mapping aid
	var/datum/bank_account/registered_account
	var/uses_overlays = TRUE
	var/icon/cached_flat_icon

/obj/item/card/id/Initialize(mapload)
	. = ..()
	if(mapload && access_txt)
		access = text2access(access_txt)

/obj/item/card/id/Destroy()
	if (registered_account)
		registered_account.bank_cards -= src
	return ..()

/obj/item/card/id/attack_self(mob/user)
	if(Adjacent(user))
		user.visible_message("<span class='notice'>[user] shows you: [icon2html(src, viewers(user))] [src.name].</span>", "<span class='notice'>I show \the [src.name].</span>")
	add_fingerprint(user)

/obj/item/card/id/vv_edit_var(var_name, var_value)
	. = ..()
	if(.)
		switch(var_name)
			if("assignment","registered_name")
				update_label()

/obj/item/card/id/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/holochip))
		insert_money(W, user)
		return
	else if(istype(W, /obj/item/stack/spacecash))
		insert_money(W, user, TRUE)
		return
	else if(istype(W, /obj/item/coin))
		insert_money(W, user, TRUE)
		return
	else if(istype(W, /obj/item/storage/bag/money))
		var/obj/item/storage/bag/money/money_bag = W
		var/list/money_contained = money_bag.contents

		var/money_added = mass_insert_money(money_contained, user)

		if (money_added)
			to_chat(user, "<span class='notice'>I stuff the contents into the card! They disappear in a puff of bluespace smoke, adding [money_added] worth of credits to the linked account.</span>")
		return
	else
		return ..()

/obj/item/card/id/proc/insert_money(obj/item/I, mob/user, physical_currency)
	var/cash_money = I.get_item_credit_value()
	if(!cash_money)
		to_chat(user, "<span class='warning'>[I] doesn't seem to be worth anything!</span>")
		return

	if(!registered_account)
		to_chat(user, "<span class='warning'>[src] doesn't have a linked account to deposit [I] into!</span>")
		return

	registered_account.adjust_money(cash_money)
	if(physical_currency)
		to_chat(user, "<span class='notice'>I stuff [I] into [src]. It disappears in a small puff of bluespace smoke, adding [cash_money] credits to the linked account.</span>")
	else
		to_chat(user, "<span class='notice'>I insert [I] into [src], adding [cash_money] credits to the linked account.</span>")

	to_chat(user, "<span class='notice'>The linked account now reports a balance of $[registered_account.account_balance].</span>")
	qdel(I)

/obj/item/card/id/proc/mass_insert_money(list/money, mob/user)
	if (!money || !money.len)
		return FALSE

	var/total = 0

	for (var/obj/item/physical_money in money)
		var/cash_money = physical_money.get_item_credit_value()

		total += cash_money

		registered_account.adjust_money(cash_money)

	QDEL_LIST(money)

	return total

/obj/item/card/id/proc/alt_click_can_use_id(mob/living/user)
	if(!isliving(user))
		return
	if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return

	return TRUE

// Returns true if new account was set.
/obj/item/card/id/proc/set_new_account(mob/living/user)
	. = FALSE
	var/datum/bank_account/old_account = registered_account

	var/new_bank_id = input(user, "Enter my account ID number.", "Account Reclamation", 111111) as num | null

	if (isnull(new_bank_id))
		return

	if(!alt_click_can_use_id(user))
		return
	if(!new_bank_id || new_bank_id < 111111 || new_bank_id > 999999)
		to_chat(user, "<span class='warning'>The account ID number needs to be between 111111 and 999999.</span>")
		return
	if (registered_account && registered_account.account_id == new_bank_id)
		to_chat(user, "<span class='warning'>The account ID was already assigned to this card.</span>")
		return

	for(var/A in SSeconomy.bank_accounts)
		var/datum/bank_account/B = A
		if(B.account_id == new_bank_id)
			if (old_account)
				old_account.bank_cards -= src

			B.bank_cards += src
			registered_account = B
			to_chat(user, "<span class='notice'>The provided account has been linked to this ID card.</span>")

			return TRUE

	to_chat(user, "<span class='warning'>The account ID number provided is invalid.</span>")
	return

/obj/item/card/id/AltClick(mob/living/user)
	if(!alt_click_can_use_id(user))
		return

	if(!registered_account)
		set_new_account(user)
		return

	if (world.time < registered_account.withdrawDelay)
		registered_account.bank_card_talk("<span class='warning'>ERROR: UNABLE TO LOGIN DUE TO SCHEDULED MAINTENANCE. MAINTENANCE IS SCHEDULED TO COMPLETE IN [(registered_account.withdrawDelay - world.time)/10] SECONDS.</span>", TRUE)
		return

	var/amount_to_remove =  FLOOR(input(user, "How much do you want to withdraw? Current Balance: [registered_account.account_balance]", "Withdraw Funds", 5) as num|null, 1)

	if(!amount_to_remove || amount_to_remove < 0)
		return
	if(!alt_click_can_use_id(user))
		return
	if(registered_account.adjust_money(-amount_to_remove))
		var/obj/item/holochip/holochip = new (user.drop_location(), amount_to_remove)
		user.put_in_hands(holochip)
		to_chat(user, "<span class='notice'>I withdraw [amount_to_remove] credits into a holochip.</span>")
		return
	else
		var/difference = amount_to_remove - registered_account.account_balance
		registered_account.bank_card_talk("<span class='warning'>ERROR: The linked account requires [difference] more credit\s to perform that withdrawal.</span>", TRUE)

/obj/item/card/id/examine(mob/user)
	. = ..()
	if(mining_points)
		. += "There's [mining_points] mining equipment redemption point\s loaded onto this card."
	if(registered_account)
		. += "The account linked to the ID belongs to '[registered_account.account_holder]' and reports a balance of $[registered_account.account_balance]."
		if(registered_account.account_job)
			var/datum/bank_account/D = SSeconomy.get_dep_account(registered_account.account_job.paycheck_department)
			if(D)
				. += "The [D.account_holder] reports a balance of $[D.account_balance]."
		. += "<span class='info'>Alt-Click the ID to pull money from the linked account in the form of holochips.</span>"
		. += "<span class='info'>I can insert credits into the linked account by pressing holochips, cash, or coins against the ID.</span>"
		if(registered_account.account_holder == user.real_name)
			. += "<span class='boldnotice'>If you lose this ID card, you can reclaim my account by Alt-Clicking a blank ID card while holding it and entering my account ID number.</span>"
	else
		. += "<span class='info'>There is no registered account linked to this card. Alt-Click to add one.</span>"

/obj/item/card/id/GetAccess()
	return access

/obj/item/card/id/GetID()
	return src

/obj/item/card/id/RemoveID()
	return src

/obj/item/card/id/update_icon(blank=FALSE)
	cut_overlays()
	cached_flat_icon = null
	if(!uses_overlays)
		return
	var/job = assignment ? ckey(GetJobName()) : null
	var/list/add_overlays = list()
	if(!blank)
		add_overlays += mutable_appearance(icon, "assigned")
	if(job)
		add_overlays += mutable_appearance(icon, "id[job]")
	add_overlay(add_overlays)
	update_in_wallet(add_overlays)

/obj/item/card/id/proc/update_in_wallet(overlays)
	if(istype(loc, /obj/item/storage/wallet))
		var/obj/item/storage/wallet/powergaming = loc
		if(powergaming.front_id == src)
			powergaming.update_label()
			powergaming.update_icon(overlays)

/obj/item/card/id/proc/get_cached_flat_icon()
	if(!cached_flat_icon)
		cached_flat_icon = getFlatIcon(src)
	return cached_flat_icon


/obj/item/card/id/get_examine_string(mob/user, thats = FALSE)
	if(uses_overlays)
		return "[icon2html(get_cached_flat_icon(), user)] [thats? "That's ":""][get_examine_name(user)]" //displays all overlays in chat
	return ..()

/*
Usage:
update_label()
	Sets the id name to whatever registered_name and assignment is
*/

/obj/item/card/id/proc/update_label()
	var/blank = !registered_name
	name = "[blank ? id_type_name : "[registered_name]'s ID Card"][(!assignment) ? "" : " ([assignment])"]"
	update_icon(blank)

/obj/item/card/id/silver
	name = "silver identification card"
	id_type_name = "silver identification card"
	desc = ""
	icon_state = "silver"
	item_state = "silver_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/silver/reaper
	name = "Thirteen's ID Card (Reaper)"
	access = list(ACCESS_MAINT_TUNNELS)
	assignment = "Reaper"
	registered_name = "Thirteen"

/obj/item/card/id/gold
	name = "gold identification card"
	id_type_name = "gold identification card"
	desc = ""
	icon_state = "gold"
	item_state = "gold_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'

/obj/item/card/id/syndicate_command
	name = "syndicate ID card"
	id_type_name = "syndicate ID card"
	desc = ""
	registered_name = "Syndicate"
	assignment = "Syndicate Overlord"
	icon_state = "syndie"
	access = list(ACCESS_SYNDICATE)
	uses_overlays = FALSE

/obj/item/card/id/captains_spare
	name = "captain's spare ID"
	id_type_name = "captain's spare ID"
	desc = ""
	icon_state = "gold"
	item_state = "gold_id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	registered_name = "Captain"
	assignment = "Captain"

/obj/item/card/id/captains_spare/update_label() //so it doesn't change to Captain's ID card (Captain) on a sneeze
	if(registered_name == "Captain")
		name = "[id_type_name][(!assignment || assignment == "Captain") ? "" : " ([assignment])"]"
		update_icon(TRUE)
	else
		..()

/obj/item/card/id/centcom
	name = "\improper CentCom ID"
	id_type_name = "\improper CentCom ID"
	desc = ""
	icon_state = "centcom"
	registered_name = "Central Command"
	assignment = "General"
	uses_overlays = FALSE

/obj/item/card/id/centcom/Initialize()
	access = get_all_centcom_access()
	. = ..()

/obj/item/card/id/ert
	name = "\improper CentCom ID"
	id_type_name = "\improper CentCom ID"
	desc = ""
	icon_state = "ert_commander"
	registered_name = "Emergency Response Team Commander"
	assignment = "Emergency Response Team Commander"
	uses_overlays = FALSE

/obj/item/card/id/ert/Initialize()
	access = get_all_accesses()+get_ert_access("commander")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Security
	registered_name = "Security Response Officer"
	assignment = "Security Response Officer"
	icon_state = "ert_security"

/obj/item/card/id/ert/Security/Initialize()
	access = get_all_accesses()+get_ert_access("sec")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Engineer
	registered_name = "Engineer Response Officer"
	assignment = "Engineer Response Officer"
	icon_state = "ert_engineer"

/obj/item/card/id/ert/Engineer/Initialize()
	access = get_all_accesses()+get_ert_access("eng")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Medical
	registered_name = "Medical Response Officer"
	assignment = "Medical Response Officer"
	icon_state = "ert_medic"

/obj/item/card/id/ert/Medical/Initialize()
	access = get_all_accesses()+get_ert_access("med")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/chaplain
	registered_name = "Religious Response Officer"
	assignment = "Religious Response Officer"
	icon_state = "ert_chaplain"

/obj/item/card/id/ert/chaplain/Initialize()
	access = get_all_accesses()+get_ert_access("sec")-ACCESS_CHANGE_IDS
	. = ..()

/obj/item/card/id/ert/Janitor
	registered_name = "Janitorial Response Officer"
	assignment = "Janitorial Response Officer"
	icon_state = "ert_janitor"

/obj/item/card/id/ert/Janitor/Initialize()
	access = get_all_accesses()
	. = ..()

/obj/item/card/id/prisoner
	name = "prisoner ID card"
	id_type_name = "prisoner ID card"
	desc = ""
	icon_state = "orange"
	item_state = "orange-id"
	lefthand_file = 'icons/mob/inhands/equipment/idcards_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/idcards_righthand.dmi'
	assignment = "Prisoner"
	registered_name = "Scum"
	uses_overlays = FALSE
	var/goal = 0 //How far from freedom?
	var/points = 0

/obj/item/card/id/prisoner/attack_self(mob/user)
	to_chat(usr, "<span class='notice'>I have accumulated [points] out of the [goal] points you need for freedom.</span>")

/obj/item/card/id/prisoner/one
	name = "Prisoner #13-001"
	registered_name = "Prisoner #13-001"
	icon_state = "prisoner_001"

/obj/item/card/id/prisoner/two
	name = "Prisoner #13-002"
	registered_name = "Prisoner #13-002"
	icon_state = "prisoner_002"

/obj/item/card/id/prisoner/three
	name = "Prisoner #13-003"
	registered_name = "Prisoner #13-003"
	icon_state = "prisoner_003"

/obj/item/card/id/prisoner/four
	name = "Prisoner #13-004"
	registered_name = "Prisoner #13-004"
	icon_state = "prisoner_004"

/obj/item/card/id/prisoner/five
	name = "Prisoner #13-005"
	registered_name = "Prisoner #13-005"
	icon_state = "prisoner_005"

/obj/item/card/id/prisoner/six
	name = "Prisoner #13-006"
	registered_name = "Prisoner #13-006"
	icon_state = "prisoner_006"

/obj/item/card/id/prisoner/seven
	name = "Prisoner #13-007"
	registered_name = "Prisoner #13-007"
	icon_state = "prisoner_007"

/obj/item/card/id/mining
	name = "mining ID"
	access = list(ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MECH_MINING, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)

/obj/item/card/id/away
	name = "a perfectly generic identification card"
	desc = ""
	access = list(ACCESS_AWAY_GENERAL)
	icon_state = "retro"
	uses_overlays = FALSE

/obj/item/card/id/away/hotel
	name = "Staff ID"
	desc = ""
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT)

/obj/item/card/id/away/hotel/securty
	name = "Officer ID"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_MAINT, ACCESS_AWAY_SEC)

/obj/item/card/id/away/old
	name = "a perfectly generic identification card"
	desc = ""

/obj/item/card/id/away/old/sec
	name = "Charlie Station Security Officer's ID card"
	desc = ""
	assignment = "Charlie Station Security Officer"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_SEC)

/obj/item/card/id/away/old/sci
	name = "Charlie Station Scientist's ID card"
	desc = ""
	assignment = "Charlie Station Scientist"
	access = list(ACCESS_AWAY_GENERAL)

/obj/item/card/id/away/old/eng
	name = "Charlie Station Engineer's ID card"
	desc = ""
	assignment = "Charlie Station Engineer"
	access = list(ACCESS_AWAY_GENERAL, ACCESS_AWAY_ENGINE)

/obj/item/card/id/away/old/apc
	name = "APC Access ID"
	desc = ""
	access = list(ACCESS_ENGINE_EQUIP)

/obj/item/card/id/away/deep_storage //deepstorage.dmm space ruin
	name = "bunker access ID"

/obj/item/card/id/departmental_budget
	name = "departmental card (FUCK)"
	desc = ""
	icon_state = "budgetcard"
	uses_overlays = FALSE
	var/department_ID = ACCOUNT_CIV
	var/department_name = ACCOUNT_CIV_NAME

/obj/item/card/id/departmental_budget/Initialize()
	. = ..()
	var/datum/bank_account/B = SSeconomy.get_dep_account(department_ID)
	if(B)
		registered_account = B
		if(!B.bank_cards.Find(src))
			B.bank_cards += src
		name = "departmental card ([department_name])"
		desc = ""
	SSeconomy.dep_cards += src

/obj/item/card/id/departmental_budget/Destroy()
	SSeconomy.dep_cards -= src
	return ..()

/obj/item/card/id/departmental_budget/update_label()
	return

/obj/item/card/id/departmental_budget/car
	department_ID = ACCOUNT_CAR
	department_name = ACCOUNT_CAR_NAME
	icon_state = "car_budget" //saving up for a new tesla
