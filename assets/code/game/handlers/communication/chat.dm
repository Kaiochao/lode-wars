
mob/verb/Say(t as text)
	Message(world, "[src]: [html_encode(t)]")

proc/Message(hearer_or_hearers, msg)
	if(ismob(hearer_or_hearers))
		var/mob/hearer = hearer_or_hearers
		hearer.client?.chatBox?.OutputMessage(msg)
	else
		for(var/mob/hearer in hearer_or_hearers)
			.(hearer, msg)
