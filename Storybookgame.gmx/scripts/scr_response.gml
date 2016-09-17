///scr_response(command, responseArg)
var command = string_lower(argument0);
var arg = argument1;

obj_controller.response = command;

if (arg != "")
{
    switch arg
    {
        case "exitGame":
            scr_exitGame();
            break;
        default:
            break;
    }
} else {
exit;
}
