/mob/Login()
	name = src.key
	GenerateShadow()
	loc = FindSpawner()
	InitPlanes()
	AddSeeInDarkLight()
	Message(world, "[src] logged in.")
	Message(src, "Water: [num2text(waterLevel*100,2)]%.")

mob/proc/FindSpawner()
	return get_step(locate(/obj/outdoors/structures/bases/respawner), 0)
