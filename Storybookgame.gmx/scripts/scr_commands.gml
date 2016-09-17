///scr_commands(command)    

command = string_lower(argument0);

///Checks if the command is empty when you press enter
if ((command != "") and (global.started = true))
{ 
    if (string_pos("go", command) != 0)
    {
        scr_go(command);
    } else if (string_pos("exists", command) != 0)
    {
        if ds_exists(global.locale, ds_type_list)
        {
            show_message("there are " + string(instance_number(obj_npc0)) + " '0' objects");
            show_message("there are " + string(instance_number(obj_npc1)) + " '1' objects");
            show_message("there are " + string(instance_number(obj_npc2)) + " '2' objects");
        }
    } else if (string_pos("look around", command) != 0) 
    {
        scr_lookAround();
    } else if (string_pos("exit game", command) != 0)
    {
        scr_exitGame();
    }else if (string_pos("talk", command) != 0)
    {
        if (string_pos("old", command) > string_pos("talk", command) and (global.lSuff = "shop"))
        {
            switch global.lSuff
            {
                case "old":
                    obj_console.console += "You're already in the shop...#";
                    break;
                default: 
                    obj_console.console += '"Hello there"#';
                    global.lSuff = "old";
                    break;
            }
        } 
    }
} else if (command = "start") and (global.started = false)
{
    obj_console.console = "";
    scr_lChange("Introburg");
} 
