///scr_commands(command, argument)    

command = string_lower(argument0);
arg = argument1;

///Checks if the command is empty when you press enter
if (global.started = true)
{   
    switch command
    {
        case "go":
            scr_go(arg);
            break;
        case "exists":
            if ds_exists(global.locale, ds_type_list)
            {
                show_message("there are " + string(instance_number(obj_npc0)) + " '0' objects");
                show_message("there are " + string(instance_number(obj_npc1)) + " '1' objects");
                show_message("there are " + string(instance_number(obj_npc2)) + " '2' objects");
            }
            break;
        case "look around":
            scr_lookAround();
            break;
        case "talk":
            break;
        case "exit game":
            scr_exitGame();
            break;
    }
} else if (command = "start") and (global.started = false)
{
    obj_console.console = "";
    ds_list_delete(global.commandList, (ds_list_find_index(global.commandList, "start")));
    scr_lChange("Introburg");
} 
