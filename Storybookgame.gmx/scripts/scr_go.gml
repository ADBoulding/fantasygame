///scr_go(command)
///---------------------------checks if you are trying to go to place you're in
var locale = argument0;
if locale = global.lSuff
{
    obj_console.console += "You're already in the " + global.lSuff + "#";
    exit;
}


///--------------------------checks if the destination is available
var exists = ds_list_find_index(global.goDest, locale); //if it is in the list, it returns the index
if exists != -1
{
    scr_changeSuff(global.goDest[| exists]); //uses that index to get the destination
    exit;
} else {
    obj_console.console += "You cannot go there from here#"; //if it is not in the list, you can't go there
}










