///scr_exitGame()
switch obj_controller.waitForResponse
{
    case false:
        obj_controller.waitForResponse = true;
        obj_console.console += "Are you sure you want to quit the game?#";
        obj_controller.responseArg = "exitGame";
        obj_controller.targetArg = "exitGame";
        exit;
        break;
    case true:
        switch obj_controller.response
        {
            case "y":
            case "yes":
                obj_controller.waitForResponse = false;
                obj_controller.response = "";
                obj_console.console += "Thanks for playing.#";
                obj_controller.responseArg = "";
                obj_controller.targetArg = "";
                game_end();
                break;
            case "n":
            case "no":
                obj_controller.waitForResponse = false;
                obj_controller.response = "";
                obj_controller.responseArg = "";
                obj_controller.targetArg = "";
                exit;
            default:
                obj_console.console += "Not a valid response, would you like to exit? (Y/N)#";
                break;
        }
}
