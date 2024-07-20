/*
 Snippet by Ter13, link: http://www.byond.com/forum/post/2080183
*/

var/list/InitList = list()
var/MapInitialized = 0

world
	New()
		..()
		Generate()
		MapInitialized()

	proc/MapInitialized()
		if(!MapInitialized)
			MapInitialized = 1
			for(var/atom/o as anything in InitList)
				if(tick_usage > 90)
					sleep(tick_lag)
				o?.MapInit()
			InitList = null

atom
	var/PostInit = false

	New()
		..()
		if(PostInit)
			if(MapInitialized)
				MapInit()
			else
				InitList[src] = true

	proc/MapInit()
