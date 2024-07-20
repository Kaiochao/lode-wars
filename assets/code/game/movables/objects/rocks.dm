obj/outdoors/rocks
	wall
		plane = WALL_PLANE
		icon_state = "15"
		density = 1
		hasShadow = true

		MapInit()
			..()
			UpdateState()

		proc/SetBedrock()
			color = grayscaleColorMatrix
			durability = 3

		proc/UpdateState(exclude)
			icon_state = GetTileState(exclude)
			if(icon_state != "15") ShowOre()
