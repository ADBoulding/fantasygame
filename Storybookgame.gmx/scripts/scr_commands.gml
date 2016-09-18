///scr_commands(command, argument, person)    

command = string_lower(argument0);
arg = argument1;
npc = argument2;

///Checks if the command is empty when you press enter
if (global.started = true)
{   
    switch global.player1State
    {
        case "normal":
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
                    scr_talk(npc);
                    break;
            }
        case "talking":
            switch command
            {
                case "talk about":
                case "ask":
                    scr_ask(arg);
                    break;
                case "give":
                    break;
                case "goodbye":
                case "leave":
                    obj_console.console += "You leave the conversation to go about your day...#"
                    global.player1State = "normal";
                    obj_npc0.isTalking = false;
                    obj_npc0.greeted = false;
                    obj_npc0.topic = "";
                    obj_npc0.topicProgress = -1;
                    break;
            }
    }
} else if (command = "start") and (global.started = false)
{
    obj_console.console = "";
    ds_list_delete(global.commandList, (ds_list_find_index(global.commandList, "start")));
    scr_lChange("Introburg");
} 
if (command = "exit game")
{
    scr_exitGame();
}
