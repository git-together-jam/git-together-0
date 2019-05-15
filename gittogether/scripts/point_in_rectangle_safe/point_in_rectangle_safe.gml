/// @desc point_in_rectangle but where argument order matters less

gml_pragma("forceinline");

return point_in_rectangle(
	argument0,
	argument1,
	min(argument2, argument4),
	min(argument3, argument5),
	max(argument2, argument4),
	max(argument3, argument5)
);