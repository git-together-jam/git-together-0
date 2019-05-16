///@arg array
var arr = argument0;
for(var i = 0; i < array_length_1d(arr); i++) {
	arr[i] = arr[i]/255; 
}
return arr;