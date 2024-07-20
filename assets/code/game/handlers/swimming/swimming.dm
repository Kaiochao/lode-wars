/*
* Very rough implemention, can be expanded later.
*/
mob/alien/proc/
	Submerge()
		if(isSwimming) return
		isSwimming = true
		icon_state = "swim"
	Surface()
		if(!isSwimming) return
		isSwimming = false
		icon_state = ""

	CanSwim()
		return false

mob/alien/mobbel
	CanSwim() 
		return true
