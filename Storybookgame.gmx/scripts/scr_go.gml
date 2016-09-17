///scr_go(command)

command = argument0;
var attempt = 0;
var listSize = ds_list_size(global.goDest);

if (string_pos(string_lower(global.lSuff), command) > string_pos("go", command))
{
    obj_console.console += "You're already in the " + global.lSuff + "#";
    exit;
}

for (var i = 0; i < listSize; i++;)
{
    var dest = string_lower(global.goDest[| i]);
    ///show_message(global.goDest[| i]);
    if (string_pos(dest, command) > string_pos("go", command))
    {
        scr_changeSuff(global.goDest[| i]);
        exit;
    }
    attempt += 1;
}
if (attempt = listSize)
{
    obj_console.console += "You cannot go there from here#";
}



