turf/outdoors/dense/
	water
		icon = 'assets/art/turfs/water.dmi'
		PostInit = 1
		var/isDeepWater = false

		MapInit()
			InitWater()
			new/obj/lights/ambient_light(src)

		Cross(atom/movable/mover)
			if(istype(mover, /mob/alien))
				var/mob/alien/alien = mover
				return alien.CanSwim()
			return ..()
		
		Crossed(atom/movable/mover)
			..()
			if(istype(mover, /mob/alien))
				var/mob/alien/alien = mover
				alien.Submerge()

		Uncrossed(atom/movable/mover, atom/newLoc)
			..()
			if(istype(mover, /mob/alien) && !istype(newLoc, /turf/outdoors/dense/water))
				var/mob/alien/alien = mover
				alien.Surface()

		proc/InitWater()
			var/image/waves = new('assets/art/turfs/waves.dmi')
			waves.icon_state = GetTileState()
			if(isDeepWater) icon_state = "deep"
			overlays += waves

		proc/SetDeepWater()
			isDeepWater = true
