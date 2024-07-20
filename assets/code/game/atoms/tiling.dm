obj/outdoors/rocks/wall
	AutoTilesWith(atom/atom)
		return istype(atom, /obj/outdoors/rocks/wall) \
			|| istype(atom, /obj/outdoors/structures/bases/wall)

turf/outdoors/dense/water
	AutoTilesWith(atom/atom)
		return istype(atom, /turf/outdoors/dense/water)

atom
	proc/AutoTilesWith(atom/atom)
		return false

	proc/GetTileState(exclude)
		var/global/list/CardinalDirs = list(NORTH, SOUTH, EAST, WEST)
		var/state = 0
		for(var/direction in CardinalDirs)
			var/list/neighbors = GetStep(src, direction)
			neighbors.Remove(src, exclude)
			for(var/atom/neighbor in neighbors)
				if(AutoTilesWith(neighbor)) 
					state += direction
		return num2text(state)
