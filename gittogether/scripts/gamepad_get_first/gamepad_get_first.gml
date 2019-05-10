/// @func gamepad_get_first(default)
/// @arg default

gml_pragma("forceinline");

for(var i = 0; i < 13; i++) {
	if (gamepad_is_connected(i)) return i;
}

return argument[0];