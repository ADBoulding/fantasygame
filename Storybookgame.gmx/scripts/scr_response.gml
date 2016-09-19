///scr_response(command, responseArg, target)
var command = string_lower(argument0);
var arg = argument1;
var target = argument2;
if target != ""
{
    switch target
    {
        case "obj_npc0":
            if (arg != "")
            {
                if string_pos(command,arg)
                {
                    var argNum = real(string_char_at(arg,string_pos(command+"_",arg)+string_length(command+"_")));
                    obj_npc0.argNum = argNum;
                    obj_npc0.topicProgress += 1;
                    obj_npc0.bypass = 1;
                    obj_controller.waitForResponse = false;
                    obj_controller.response = "";
                    obj_controller.responseArg = "";
                    obj_controller.targetArg = "";
                    exit;
                } else {
                    obj_console.console += "That is not a valid response";
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

