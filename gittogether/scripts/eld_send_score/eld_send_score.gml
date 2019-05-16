///send_score(name,score)
//
// Script:      Sends the player’s score to the database in Altervista
// Date:        2018-07-21
// Copyright:   Appsurd
//
// Arguments:
// Argument0: name of the player
// Argument1: the achieved score

var name = url_encode(base64_encode(string(argument0)));
var args = "name="+name+"&score="+string(argument1)+"&hash=0000";
http_post_string("http://ftp.imagoodboye.altervista.org/testing2/addscore.php", args);
