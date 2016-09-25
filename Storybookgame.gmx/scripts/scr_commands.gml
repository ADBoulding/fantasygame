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
                    var targetNPC = instance_find(obj_npc, obj_player.talkingTo);
                    obj_console.console += "You leave the conversation to go about your day...#"
                    global.player1State = "normal";
                    targetNPC.isTalking = false;
                    targetNPC.greeted = false;
                    targetNPC.topic = "";
                    targetNPC.topicProgress = -1;
                    break;
            }
    }
} else if (command = "start") and (global.started = false)
{
    obj_console.console = "";
    ds_list_delete(obj_controller.commandList, (ds_list_find_index(obj_controller.commandList, "start")));
    scr_lChange("Introburg");
} 
if (command = "exit game")
{
    scr_exitGame();
}
if (command = "clear")
{
    obj_console.console = "";
}
if (command = "debug")
{
    switch obj_text.debug
    {
        case true:
            obj_text.debug = false;
            break;
        case false:
            obj_text.debug = true;
            break;
    }
}
