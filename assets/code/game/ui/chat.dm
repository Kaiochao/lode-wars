#define MAX_MSG 30

ui/chat
	screen_loc = "CENTER"
	screenX = 25
	screenY = -130
	maptext_width = 170
	maptext_height = 150
	plane = UI_FOREGROUND_PLANE

	var/list/messages
	var/max_messages = 5
	var/max_message_length = 30

	New()
		..()
		messages = list()
		UpdateMessages()

	proc/UpdateMessages()
		maptext = "<span class='chat'>[messages.Join("\n")]</span>"

	proc/OutputMessage(msg)
		if(length(msg) > max_message_length)
			.(copytext(msg, 1, max_message_length + 1))
			.(copytext(msg, max_message_length + 1))
		else 
			messages += msg
			messages.Cut(1, max(1, 1 + length(messages) - max_messages))
			UpdateMessages()
