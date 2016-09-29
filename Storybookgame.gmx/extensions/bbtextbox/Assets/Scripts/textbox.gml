var i;
i = instance_create(0,0,obj_textbox);
i.text = argument0;

with (i) {
    event_user(0);
}

return i;