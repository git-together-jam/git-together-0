/// @desc ?

nearestTrashcan = instance_nearest(x,y,obj_Trashcan)

if point_distance(x,y,nearestTrashcan.x,nearestTrashcan.y) < 30 {
	trash_read = true;
	trash_read_time = trash_read_time_default;
	trash_message = nearestTrashcan.message;
} else {
	//Too far away from any trashcans
}