///scr_go(command)

var locale = argument0;
if locale = global.lSuff
{
    obj_console.console += "You're already in the " + global.lSuff + "#";
    exit;
}

var exists = ds_list_find_index(global.goDest, locale);
if exists != -1
{
    scr_changeSuff(global.goDest[| exists]);
    exit;
} else {
    obj_console.console += "You cannot go there from here#";
}










