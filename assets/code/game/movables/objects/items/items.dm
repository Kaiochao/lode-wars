obj/items/
	var/
		value = 1
		weight = 1
	proc/
		PickUp(mob/alien/player, msg = true)
			if(loc == player) return
			if(bounds_dist(player, src) > 0) return
			if(!player.CanHoldItem(src))
				Message(player,"You are too overburdened to carry this.")
				return
			src.loc = player
			if(msg) Message(viewers(player),"[player] picks up [src]")

		Drop(mob/player, msg = true)
			if(loc != player) return
			src.loc = player.loc
			if(msg) Message(viewers(player),"[player] drops [src]")

	Click()
		..()
		PickUp(usr, false)
