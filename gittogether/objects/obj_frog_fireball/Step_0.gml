emit_dust(.5,x,y,-.2,.2,-.2,.2,depth+1,c_gray);
x += vx;
y += vy;

vx *= .98;
vy *= .98;


//if (place_meeting(x,y-5,p_wall) and image_index < image_number-1) image_index++;