///scr_lookAround();

if (ds_exists(global.locale, ds_type_map)) //checks if the location data exists
{
    obj_console.console += "+-----------------------------------------------------------+#";
    obj_console.console += "You take a look around to see what you can interact with...#"
    if !ds_list_empty(global.goDest) //checks if there is stuff to notice
    {
        obj_console.console += "In this area you can access...#"
        for (i = 0; i < ds_list_size(global.goDest); i++;) //makes a loop for everything in the list
        {
            if global.goDest[| i] != ""
            {
                switch string_char_at(string_lower(global.goDest[| i]), 1)
                {
                    case "a":
                    case "e":
                    case "i":
                    case "o":
                    case "u":
                    case "y":
                        var tempa = "an";
                        break;
                    default:
                        var tempa = "a";
                        break;
                }
                obj_console.console += "    - " + tempa + " " + global.goDest[| i] + "#";
            }
        }
    } else {
        obj_console.console += "...strange... You cannot go anywhere from here";
    }
    if !ds_list_empty(global.localeNPC)
    {
        obj_console.console += "In this area you can interact with... (SORTA WORKS)#";
        for (i = 0; i < ds_list_size(global.localeNPC); i++;) //makes a loop for everything in the list
        {
            var npcTarget = instance_find(obj_npc, i);
            if (global.localeNPC[| i] != "") and (npcTarget.canSee = 1)
            {
                switch string_char_at(string_lower(global.localeNPC[| i]), 1)
                {
                    case "a":
                    case "e":
                    case "i":
                    case "o":
                    case "u":
                    case "y":
                        var tempa = "an";
                        break;
                    default:
                        var tempa = "a";
                        break;
                }
                obj_console.console += "    - " + tempa + " " + global.localeNPC[| i] + "#";
            }
        }
    }
    obj_console.console += "+-----------------------------------------------------------+#";
} else {
    obj_console.console += "Strange...          You feel nothing";
}
