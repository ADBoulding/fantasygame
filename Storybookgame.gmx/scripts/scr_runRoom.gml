///scr_runRoom()
obj_console.console += "You are now in " + global.location;

ini_open(working_directory + "\assets\location" + global.location + ".ini");
with (obj_location)
{
    isShop = ini_read_string('regionValues', 'isShop', 'False');
}
ini_close();


