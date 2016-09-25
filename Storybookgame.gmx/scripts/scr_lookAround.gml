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
        for (i = 0; i < instance_number(obj_npc); i++;) //makes a loop for everything in the list
        {
            var npcTarget = instance_find(obj_npc, i);
            if (global.localeNPC[| i] != "") && (npcTarget.canSee = 1)
            {
                var nam = "";
                if npcTarget.undisc = true
                {
                    nam = npcTarget.nameVis;
                } else {
                    nam = global.localeNPC[| i];
                }
                switch string_char_at(string_lower(nam), 1)
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
                obj_console.console += "    - " + tempa + " " + nam + "#";
            }
        }
    }
    obj_console.console += "+-----------------------------------------------------------+#";
} else {
    obj_console.console += "Strange...          You feel nothing";
}
