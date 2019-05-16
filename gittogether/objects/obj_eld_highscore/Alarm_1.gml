/// When the scores haven’t loaded, try again once per second
if text2 == ""
{
    get_scores(player_name,10);
    text = "Please check your\ninternet connection...";
    alarm[1] = room_speed;
}
wait = true;