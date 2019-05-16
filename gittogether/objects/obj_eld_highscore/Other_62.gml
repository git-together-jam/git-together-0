/// @description  Receiving the result from Altervista
if (set)
{
	if ds_map_find_value(async_load, "id") == get_highscores
	{
	    if ds_map_find_value(async_load, "status") == 0
	    {
	        text2 = string(ds_map_find_value(async_load, "result"));
	        show_debug_message(text2);
	        if text2 == "IOException" or text2 == ""
	        {
	            text = "Please check your\ninternet connection...";
	            text2 = "";
	        }
	        else
	        {
	            text = "Ready";
				wait = true;
	            alarm[1] = -1;
	        }
	    }
	}
}