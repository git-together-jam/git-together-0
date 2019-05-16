/// @desc ?

nearestTrashcan = instance_nearest(x,y,obj_Trashcan)

if point_distance(x,y,nearestTrashcan.x,nearestTrashcan.y) < 30 {
	nearestTrashcan.image_blend = c_red;
} else {
	//Too far away from any trashcans
}