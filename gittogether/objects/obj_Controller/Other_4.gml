/// @description 
// Create camera
view_enabled = true;
view_visible[0] = true;

var cam = camera_create_view(0, 0, RES_W, RES_H);

view_set_camera(0, cam);

// Create the arcade machines

if (room == rm_Overworld) {
	
	if (!machinesPlaced) ds_list_shuffle(global.ArcadeMachineList);
	
	var _xx, _yy;
	for (var _i = 0; _i < ds_list_size(global.ArcadeMachineList)/maxMachinesPerRow; ++_i) {
		for (var _j = 0; _j < maxMachinesPerRow; ++_j) {
			
			if (is_undefined(global.ArcadeMachineList[| (_i+_j)])) break;
			
			_xx = 100 + 64*_j;
			_yy = 140 + 96*_i;
			
			var _machine = instance_create_layer(_xx, _yy, "Instances", obj_ArcadeMachine);
			with (_machine) {
				var _map = global.ArcadeMachineList[| (_i+_j)];
				sprite_index = _map[? "sprite"];
				gameRoom = _map[? "room"];
				name	 = _map[? "name"];
				trans	 = _map[? "trans"];
				transCol = _map[? "transCol"];
			}
		}
	}
	
	machinesPlaced = true;
}


