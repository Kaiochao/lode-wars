mob
	var/tmp/list/move_dirs = new

	verb/MoveKey(dir as num, press as num)
		set instant = true
		set hidden = true
		if(press)
			move_dirs.Insert(1, dir)
		else
			move_dirs -= dir
		MoveDirection(length(move_dirs) ? move_dirs[1] : 0)

	proc/MoveDirection(dir)
		movingDir = dir
		if(dir)
			playersToUpdate[src] = true
		else
			playersToUpdate -= src
