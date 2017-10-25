/obj/item/weapon/gun/energy/gun/arfs
	name = "\improper ARFS Model D"
	desc = "A basic energy-based gun with two settings: stun and disable."
	icon = 'arfs/icons/arfs_guns.dmi'
	icon_state = "cxe"
	item_state = null	//so the human update icon uses the icon_state instead.
	lefthand_file = 'arfs/icons/guns_lefthand.dmi'
	righthand_file = 'arfs/icons/guns_righthand.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/disabler, /obj/item/ammo_casing/energy/laser)
	origin_tech = "combat=4;magnets=3"
	modifystate = 2
	can_flashlight = 1
	ammo_x_offset = 3
	flight_x_offset = 15
	flight_y_offset = 10
	actions_types = list(/datum/action/item_action/recolor)

	var/body_color = "#252528"

/obj/item/weapon/gun/energy/gun/arfs/update_icon(var/update_mob_icon)
	..()
	overlays.Cut()
	var/image/body_overlay = image('arfs/icons/arfs_guns.dmi',icon_state = "cxegun_body")
	if(body_color)
		body_overlay.color = body_color
	overlays += (body_overlay)

/obj/item/weapon/gun/energy/gun/arfs/ui_action_click(mob/user, var/datum/action/A)
	if(istype(A, /datum/action/item_action/recolor))
		if(alert("Are you sure you want to repaint your gun?", "Confirm Repaint", "Yes", "No") == "Yes")
			var/body_color_input = input(usr,"Choose Body Color") as color|null
			if(body_color_input)
				body_color = sanitize_hexcolor(body_color_input, desired_format=6, include_crunch=1)
		update_icon()
	else
		..()

/datum/action/item_action/recolor
	name = "Recolor"