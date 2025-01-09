/mob/living/simple_mob/vore/aggressive/macrophage
	name = "Germ"
	desc = "A giant virus!"
	icon = 'icons/mob/macrophage.dmi'
	icon_state = "macrophage-1"

	faction = FACTION_MACROBACTERIA
	maxHealth = 60
	health = 60

	var/datum/disease/base_disease = null
	var/list/infections = list()

	melee_damage_lower = 1
	melee_damage_upper = 5
	grab_resist = 100
	see_in_dark = 8

	response_help = "shoos"
	response_disarm = "swats away"
	response_harm = "squashes"
	attacktext = list("squashed")
	friendly = list("shoos", "rubs")

	vore_bump_chance = "attempts to absorb"

	vore_active = TRUE
	vore_capacity = 1

	can_be_drop_prey = FALSE
	allow_mind_transfer = TRUE

	ai_holder_type = /datum/ai_holder/simple_mob/melee/macrophage

/mob/living/simple_mob/vore/aggressive/macrophage/proc/deathcheck()
	if(locate(/mob/living/carbon/human) in vore_selected)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/simple_mob/vore/aggressive/macrophage, deathcheck)), 3000)
	else
		dust()

/mob/living/simple_mob/vore/aggressive/macrophage/Initialize()
	. = ..()
	if(base_disease)
		ai_holder_type.virus = new base_disease
	else
		ai_holder_type.virus = new /datum/disease/cold

/mob/living/simple_mob/vore/aggressive/macrophage/green
	icon_state = "macrophage-2"

/mob/living/simple_mob/vore/aggressive/macrophage/pink
	icon_state = "macrophage-3"

/mob/living/simple_mob/vore/aggressive/macrophage/blue
	icon_state = "macrophage-4"

/obj/belly/macrophage
	name = "capsid"
	fancy_vore = TRUE
	contamination_color = "green"
	vore_verb = "absorb"
	escapable = TRUE
	escapable = 20
	desc = "In an attempt to get away from the giant virus, it's oversized envelope proteins dragged you right past it's matrix, encapsulating you deep inside it's capsid... The strange walls kneading and keeping you tight along within it's nucleoprotein."
	belly_fullscreen = "VBO_gematically_angular"
	belly_fullscreen_color = "#87d8d8"
	digest_mode = DM_ABSORB
	affects_vore_sprites = FALSE

/mob/living/simple_mob/vore/aggressive/macrophage/init_vore()

	if(!voremob_loaded || LAZYLEN(vore_organs))
		return TRUE

	var/obj/belly/B = new /obj/belly/macrophage(src)
	vore_selected = B

/mob/living/simple_mob/vore/aggressive/macrophage/do_attack(atom/A, turf/T)
	. = ..()
	if(iscarbon(A))
		var/mob/living/carbon/human/victim = A
		A.ContractDisease(base_disease)

/datum/ai_holder/simple_mob/melee/macrophage
	var/datum/disease/virus = null

/datum/ai_holder/simple_mob/melee/macrophage/list_targets()
	var/list/our_targets = ..()
	for(var/list_target in our_targets)
		if(!ishuman(list_target)) // Mobs? Robots? Meh. We want to INFECT.
			our_targets -= list_target
			continue
		var/mob/living/carbon/human/victim = list_target
		if(victim.viruses)
			if(victim.HasDisease(virus) && prob(25)) // Less likely to be a target if you're infected
				our_targets -= list_target
				continue
	return our_targets
