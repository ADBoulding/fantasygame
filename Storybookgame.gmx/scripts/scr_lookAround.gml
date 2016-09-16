///scr_lookAround();

if (ds_exists(global.locale, ds_type_map)) //checks if the location data exists
{
    obj_console.console += "+-----------------------------------------------------------+#";
    obj_console.console += ds_map_find_value(global.locale, string_lower(global.lSuff) + ".description") + "#";
    obj_console.console += "You take a look around to see what you can interact with..."
    if !ds_list_empty(global.goDest) //checks if there is stuff to notice
    {
        obj_console.console += "In the area you notice...#"
        for (i = 0; i < ds_list_size(global.goDest); i++;) //makes a loop for everything in the list
        {
            if global.goDest[| i] != ""
            {
                obj_console.console += "    - a " + global.goDest[| i] + "#";
                ///show_message(ds_list_size(global.goDest));
            }
        }
    } else {
        obj_console.console += "    ...you notice nothing in the area#";
    }
    obj_console.console += "+-----------------------------------------------------------+#";
} else {
    obj_console.console += "Strange...          You feel nothing";
}
