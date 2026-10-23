image_xscale = 0.01
image_yscale = image_xscale

var val = irandom_range(1, 10)
var color = c_white

switch val {
	case 1:
		color = c_white
		break 
	case 2:
		color = c_aqua
		break 
	case 3:
		color = c_blue
		break 
	case 4:
		color = c_yellow
		break
	case 5:
		color = c_fuchsia
		break
	case 6:
		color = c_green
		break
	case 7:
		color = c_lime
		break
	case 8:
		color = c_maroon
		break
	case 9:
		color = c_orange
		break
	case 10:
		color = c_red
		break
	
}

image_blend = color

x = random_range(0, room_width)
y = random_range(0, room_height)

image_alpha = 0.75

var circlepastel = instance_create_depth(x, y, depth - 1, obj_circlepastel)
circlepastel.x = x 
circlepastel.y = y