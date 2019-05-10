/// @description 
// Collide with enemies
var enemy = instance_place(x, y, oEnemyParent);

if (enemy) {
	// Get room
	var rm = global.enmRoom[enemy.type];
	
	startMinigame(rm, enemy.type);
}