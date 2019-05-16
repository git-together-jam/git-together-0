/// @description 
// Create camera
view_enabled = true;
view_visible[0] = true;

var cam = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, cam);

// Create the arcade machines

if (room == rm_Overworld) {
	
	if (!machinesPlaced) ds_list_shuffle(global.ArcadeMachineList);
	
	var _arcade_locations = overworld_get_arcade_locations();
	
	if (ds_list_size(global.ArcadeMachineList) > array_length_1d(_arcade_locations)) {
		show_debug_message("WARNING: number of machines greater than locations allow!");	
	}
	
	var _count = min(ds_list_size(global.ArcadeMachineList), array_length_1d(_arcade_locations));
	
	for (var _i = 0; _i < _count; ++_i) {
		var _arcade = global.ArcadeMachineList[| _i]
		if (_arcade == undefined) break;
		
		var _loc = _arcade_locations[_i];
		var _xx = _loc[0];
		var _yy = _loc[1];
			
		var _machine = instance_create_layer(_xx, _yy, "Instances", obj_ArcadeMachine);
		with (_machine) {
			var _map = _arcade;
			sprite_index = _map[? "sprite"];
			gameRoom  = _map[? "room"];
			name	  = _map[? "name"];
			trans	  = _map[? "trans"];
			transCol  = _map[? "transCol"];
			titleFont = _map[? "titleFont"];
			titleCol  = _map[? "titleCol"];
		}
	}
	
	machinesPlaced = true;
}


