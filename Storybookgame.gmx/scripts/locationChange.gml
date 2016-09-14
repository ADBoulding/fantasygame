///scr_lChange()
///Changes the location your player is in
global.lPrevious = global.location;
global.location = "Introville";
global.lStuff = "main";

if (instance_exists(obj_location))
{
    with (obj_location)
    {
        instance_destroy();
    }
}
instance_create(1, 1, obj_location);
scr_runRoom();

