
atom
	proc/BumpedBy(atom/movable/bumper)

atom/movable
	Bump(atom/obstacle)
		..()
		obstacle?.BumpedBy(src)
