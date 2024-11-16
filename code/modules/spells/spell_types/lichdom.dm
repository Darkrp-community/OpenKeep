/obj/effect/proc_holder/spell/targeted/lichdom
	name = "Bind Soul"
	desc = "A dark necromantic pact that can forever bind my soul to an \
	item of my choosing. So long as both my body and the item remain \
	intact and on the same plane you can revive from death, though the time \
	between reincarnations grows steadily with use, along with the weakness \
	that the new skeleton body will experience upon 'birth'. Note that \
	becoming a lich destroys all internal organs except the brain."
	school = "necromancy"
	charge_max = 10
	clothes_req = FALSE
	centcom_cancast = FALSE
	invocation = "NECREM IMORTIUM!"
	invocation_type = "shout"
	range = -1
	level_max = 0 //cannot be improved
	cooldown_min = 10
	include_user = TRUE

	action_icon = 'icons/mob/actions/actions_spells.dmi'
	action_icon_state = "skeleton"

/obj/effect/proc_holder/spell/targeted/lichdom/cast(list/targets,mob/user = usr)
	for(var/mob/M in targets)
		var/list/hand_items = list()
		if(iscarbon(M))
			hand_items = list(M.get_active_held_item(),M.get_inactive_held_item())
		if(!hand_items.len)
			to_chat(M, "<span class='warning'>I must hold an item you wish to make my phylactery!</span>")
			return
		if(!M.mind.hasSoul)
			to_chat(user, "<span class='warning'>I do not possess a soul!</span>")
			return

		var/obj/item/marked_item

		for(var/obj/item/item in hand_items)
			// I ensouled the nuke disk once. But it's probably a really
			// mean tactic, so probably should discourage it.
			if((item.item_flags & ABSTRACT) || HAS_TRAIT(item, TRAIT_NODROP) || SEND_SIGNAL(item, COMSIG_ITEM_IMBUE_SOUL, user))
				continue
			marked_item = item
			to_chat(M, "<span class='warning'>I begin to focus my very being into [item]...</span>")
			break

		if(!marked_item)
			to_chat(M, "<span class='warning'>None of the items you hold are suitable for emplacement of my fragile soul.</span>")
			return

		playsound(user, 'sound/blank.ogg', 100)

		if(!do_after(M, 50, needhand=FALSE, target=marked_item))
			to_chat(M, "<span class='warning'>My soul snaps back to my body as you stop ensouling [marked_item]!</span>")
			return

		marked_item.name = "ensouled [marked_item.name]"
		marked_item.desc += "\nA terrible aura surrounds this item, its very existence is offensive to life itself..."
		marked_item.add_atom_colour("#003300", ADMIN_COLOUR_PRIORITY)

		new /obj/item/phylactery(marked_item, M.mind)

		to_chat(M, "<span class='danger'>With a hideous feeling of emptiness you watch in horrified fascination as skin sloughs off bone! Blood boils, nerves disintegrate, eyes boil in their sockets! As my organs crumble to dust in my fleshless chest you come to terms with my choice. You're a lich!</span>")
		M.mind.hasSoul = FALSE
		M.set_species(/datum/species/skeleton)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			H.dropItemToGround(H.wear_pants)
			H.dropItemToGround(H.wear_armor)
			H.dropItemToGround(H.head)
			H.equip_to_slot_or_del(new /obj/item/clothing/suit/wizrobe/black(H), SLOT_ARMOR)
			H.equip_to_slot_or_del(new /obj/item/clothing/head/wizard/black(H), SLOT_HEAD)
			H.equip_to_slot_or_del(new /obj/item/clothing/under/color/black(H), SLOT_PANTS)

		// you only get one phylactery.
		M.mind.RemoveSpell(src)
