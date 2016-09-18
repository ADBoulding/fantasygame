///scr_response(command, responseArg, target)
var command = string_lower(argument0);
var arg = argument1;
var target = argument2;
show_message("running")
if target != ""
{
    switch target
    {
        case "obj_npc0":
            if (arg != "")
            {
                switch arg
                {
                    case "(Y/N)":
                        switch command
                        {
                            case "y":
                            case "yes":
                                obj_npc0.topicProgress += 1;
                                obj_controller.waitForResponse = false;
                                obj_controller.responseArg = "";     
                                obj_controller.targetArg = "";  
                                obj_npc0.bypass = 1;
                                break;
                            case "n":
                            case "no":
                                obj_npc0.topic = "";
                                obj_npc0.topicProgress = -1;
                                obj_npc0.greeted = false;
                                obj_controller.waitForResponse = false;
                                obj_controller.responseArg = "";     
                                obj_controller.targetArg = ""; 
                                break;
                            default:
                                obj_console.console += "That is not a valid command#(Y/N)";
                                break;
                        }
                }
            }
        case "exitGame":
            if (arg != "")
            {
                switch arg
                {
                    case "exitGame":
                        obj_controller.response = command;
                        scr_exitGame();
                        break;
                    default:
                        break;
                }
            } else {
                exit;
            }
    }
}

