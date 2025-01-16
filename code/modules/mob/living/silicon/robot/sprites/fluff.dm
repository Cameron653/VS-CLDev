#define CUSTOM_BORGSPRITE(x) "Custom - " + (x)

// All whitelisted dogborg sprites go here.

/datum/robot_sprite/fluff
	is_whitelisted = TRUE

// A

/datum/robot_sprite/fluff/argonne
	name = CUSTOM_BORGSPRITE("RUSS")

	sprite_icon = 'icons/mob/robot/fluff_wide.dmi'

	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_rest_sprites = TRUE
	rest_sprite_options = list("Default", "Sit", "Bellyup")
	has_dead_sprite = TRUE
	has_dead_sprite_overlay = TRUE
	pixel_x = -16
	icon_x = 64
	icon_y = 32

	whitelist_ckey = "argonne"
	whitelist_charname = "RUSS"

/datum/robot_sprite/fluff/argonne/security
	module_type = "Security"

	sprite_icon_state = "argonne-russ-sec"
	sprite_hud_icon_state = "k9"

/datum/robot_sprite/fluff/argonne/crisis
	module_type = "Crisis"

	sprite_icon_state = "argonne-russ-crisis"
	sprite_hud_icon_state = "medihound"

/datum/robot_sprite/fluff/argonne/surgical
	module_type = "Surgeon"

	sprite_icon_state = "argonne-russ-surg"
	sprite_hud_icon_state = "medihound"

/datum/robot_sprite/fluff/argonne/engineering
	module_type = "Engineering"

	sprite_icon_state = "argonne-russ-eng"
	sprite_hud_icon_state = "pupdozer"

/datum/robot_sprite/fluff/argonne/science
	module_type = "Research"

	sprite_icon_state = "argonne-russ-sci"
	sprite_hud_icon_state = "sci-borg"

/datum/robot_sprite/fluff/argonne/mining
	module_type = "Miner"

	sprite_icon_state = "argonne-russ-mine"

/datum/robot_sprite/fluff/argonne/service
	module_type = "Service"

	sprite_icon_state = "argonne-russ-serv"

// J

/datum/robot_sprite/fluff/jademanique
	name = CUSTOM_BORGSPRITE("B.A.U-Kingside")
	module_type = "Security"

	sprite_icon = 'icons/mob/robot/fluff_wide.dmi'
	sprite_icon_state = "jademanique-kingside"
	sprite_hud_icon_state = "k9"

	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_rest_sprites = TRUE
	rest_sprite_options = list("Default", "Sit", "Bellyup")
	has_dead_sprite = TRUE
	has_dead_sprite_overlay = TRUE
	pixel_x = -16
	icon_x = 64
	icon_y = 32

	whitelist_ckey = "jademanique"
	whitelist_charname = "B.A.U-Kingside"

// L

/datum/robot_sprite/fluff/lunarfleet
	name = CUSTOM_BORGSPRITE("Clea-Nor")
	module_type = "Engineering"

	sprite_icon = 'icons/mob/robot/fluff_wide.dmi'
	sprite_icon_state = "lunarfleet-cleanor"
	sprite_hud_icon_state = "pupdozer"

	has_eye_light_sprites = TRUE
	has_vore_belly_sprites = TRUE
	has_rest_sprites = TRUE
	rest_sprite_options = list("Default", "Sit", "Bellyup")
	has_dead_sprite = TRUE
	has_dead_sprite_overlay = TRUE
	pixel_x = -16
	icon_x = 64
	icon_y = 32

	whitelist_ckey = "lunarfleet"
	whitelist_charname = "Clea-Nor"

/// S


/datum/robot_sprite/dogborg/catborg/matica
	name = "Catborg - Matica"
	sprite_icon_state = "chonker"
	sprite_hud_icon_state = "chonker"
	sprite_icon = 'icons/mob/robot/catborgs/custom/catborg_matica_custom.dmi'
	belly_capacity_list = list("belly" = 1, "throat" =2)
	rest_sprite_options = list("Default", "Bellyup", "Sit")
	has_eye_sprites = TRUE
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = FALSE
	has_vore_belly_resting_sprites = TRUE
	is_whitelisted = TRUE
	whitelist_ckey = "somememeguy"
	module_type = list("Standard", "Engineering", "Surgeon", "Crisis", "Miner", "Janitor", "Service", "Clerical", "Security", "Research")
	sprite_flags = ROBOT_HAS_SHIELD_SPRITE | ROBOT_HAS_DISABLER_SPRITE | ROBOT_HAS_TASER_SPRITE | ROBOT_HAS_LASER_SPRITE

/// Custom Kittyborg Spotteh
/datum/robot_sprite/dogborg/kittyborg/spotteh
	name = "Kittyborg - Spotteh"
	sprite_icon_state = "spotteh"
	sprite_hud_icon_state = "spotteh"
	sprite_icon = 'icons/mob/robot/catborgs/custom/kittyborg_spotteh_custom.dmi'
	belly_capacity_list = list("belly" = 2)
	rest_sprite_options = list("Default", "Bellyup", "Sit")
	has_eye_sprites = TRUE
	has_eye_light_sprites = TRUE
	has_sleeper_light_indicator = FALSE
	has_vore_belly_resting_sprites = TRUE
	has_robotdecal_sprites = TRUE
	is_whitelisted = TRUE
	sprite_flags = ROBOT_HAS_SHIELD_SPRITE | ROBOT_HAS_GUN_SPRITE
	whitelist_ckey = "spotteh"
	module_type = list("Standard", "Engineering", "Surgeon", "Crisis", "Miner", "Janitor", "Service", "Clerical", "Security", "Research")


#undef CUSTOM_BORGSPRITE
