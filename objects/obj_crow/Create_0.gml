event_inherited();
state = "chase";
hp = 1;
max_hp = hp;
image_speed = 0.7;
hspeed = random_range(1.4,2.4);
if (instance_exists(obj_Skeleton)){
	hspeed *= sign(obj_Skeleton.x - x);
}
image_xscale = sign(hspeed);
damage = irandom_range(4,6);
attacked = false;
experience = irandom_range(4,6);
knockback = 4;
waiting_time = 0;
is_dead = 0;