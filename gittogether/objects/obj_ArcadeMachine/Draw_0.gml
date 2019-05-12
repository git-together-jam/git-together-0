///@desc Draw arcade with shader.

shader_set(shd_arcade);

shader_set_uniform_f(uniRect,x-12,y-42,x+12,y-26);
shader_set_uniform_f(uniTime,current_time/1000);
draw_self();

shader_reset();