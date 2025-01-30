#define BELLY 1
#define NSFW 2
SUBSYSTEM_DEF(alt_appearances)
	name = "Alternate Appearances"
	wait = 1 MINUTE
	priority = FIRE_PRIORITY_ALT_APPEARANCE
	init_order = INIT_ORDER_ALT_APP

	//These lists are adjusted when someone toggles alternate viewing on and off.
	//When the prefs are toggled, it'll do former_list -= (person) new_list  |= (person)
	var/list/vore_none_viewers //ALT_NONE
	var/list/vore_belly_viewers //ALT_NORMAL
	var/list/vore_nsfw_viewers //ALT_NSFW
	var/list/vore_all_viewers //ALT_ALL
	var/list/recently_changed_viewers //People that were one view setting that have changed their setting.
	var/list/currentrun

/datum/controller/subsystem/alt_appearances/Initialize()
	return SS_INIT_SUCCESS

/datum/controller/subsystem/alt_appearances/fire(resumed = FALSE)
	if (!resumed)
		currentrun = recently_changed_viewers.Copy() //Add the recently changed viewers to the list
		recently_changed_viewers.Cut() //And then clear it!
	var/list/current_run = currentrun
	while(current_run.len)
		var/key = current_run[current_run.len]
		var/obj/effect/overlay/vis/overlay = current_run[key]
		current_run.len--

		//TODO: STOPPED HERE, PICK UP WORK HERE

		// do code here. call hide_alt_vore_appearance()
		// do code here. call display_alt_vore_appearance()
		if(MC_TICK_CHECK)
			return







///For more in depth info of the below, look in code\modules\entopics_vr\alternate_appearance.dm

/// VORE OVERLAY STUFF HERE
/atom/proc/add_vore_alt_appearance(key, img, list/displayTo = list(), var/type = BELLY)
	if(!key || !img)
		return

	if(type == BELLY && !alt_belly_overlays)
		alt_belly_overlays = list()
	else if(type == NSFW && !alt_nsfw_overlays)
		alt_nsfw_overlays = list()

	var/datum/alternate_appearance/AA = new()
	AA.img = img
	AA.key = key
	AA.owner = src

	// Do we already have something named this key in the overlay? Delete it.
	if(type == BELLY && alt_belly_overlays[key])
		qdel(alt_belly_overlays[key])
	else if(type == BELLY && alt_nsfw_overlays[key])
		qdel(alt_nsfw_overlays[key])

	//Let's see what list to add it to.
	if(type == BELLY)
		alt_belly_overlays[key] = AA
	else
		alt_nsfw_overlays[key] = AA

	if(displayTo && displayTo.len)
		display_alt_appearance(key, displayTo)

/atom/proc/remove_vore_alt_appearance(key, var/type = BELLY)
	if(type == BELLY && alt_belly_overlays)
		if(alt_belly_overlays[key])
			qdel(alt_belly_overlays[key])
	else if(type == NSFW && alt_nsfw_overlays)
		if(alt_nsfw_overlays[key])
			qdel(alt_nsfw_overlays[key])

//The 'showing it to the people' part
/atom/proc/display_alt_vore_appearance(key, list/displayTo)
	if(!alternate_appearances || !key)
		return
	var/datum/alternate_appearance/AA = alternate_appearances[key]
	if(!AA || !AA.img)
		return
	AA.display_to(displayTo)

/atom/proc/hide_alt_vore_appearance(key, list/hideFrom)
	if(!alternate_appearances || !key)
		return
	var/datum/alternate_appearance/AA = alternate_appearances[key]
	if(!AA)
		return
	AA.hide(hideFrom)




#undef BELLY
#undef NSFW


//In code\modules\entopics_vr\alternate_appearance.dm the
