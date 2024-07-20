shadow
	parent_type = /obj
	appearance_flags = PIXEL_SCALE | KEEP_TOGETHER | RESET_COLOR | TILE_BOUND
	vis_flags = VIS_UNDERLAY | VIS_INHERIT_ICON_STATE | VIS_INHERIT_ICON | VIS_INHERIT_DIR | VIS_INHERIT_LAYER
	plane = SHADOWS_PLANE
	mouse_opacity = 0
	density = 0
	color = rgb(0, 0, 0)

atom/movable/
	MapInit()
		..()
		GenerateShadow()

	proc/
		GenerateShadow()
			if(!hasShadow) return
			var/matrix/originalMatrix = matrix(1,0,0,0,-1,0)
			shadow = new

			if(!shadowOffsetY) shadowOffsetY = initial(shadowOffsetY) + initial(pixel_y)
			if(!shadowOffsetX) shadowOffsetX = initial(shadowOffsetX) + initial(pixel_y)

			var/icon/I = icon(icon)
			var/newHeightOffset = -I.Height()/1.2
			var/newWidthOffset = 0

			shadow.pixel_x = newWidthOffset + shadowOffsetX
			shadow.pixel_y = newHeightOffset + shadowOffsetY
			shadow.transform = originalMatrix

			vis_contents += shadow