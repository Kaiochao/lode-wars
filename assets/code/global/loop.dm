var/ticker = 0
world
	Tick()
		..()
		try
			ticker++
			if(!ticker % 600) SetRoundTimer(roundTimer-1)
			if(length(playersToUpdate)) MoveMobs()
		catch(var/exception/e)
			log << "[e] on [e.file]:[e.line]"
