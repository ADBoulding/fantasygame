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
                    show_message(instance_number(obj_npc));
                    break;
                case "look around":
                    scr_lookAround();
                    break;
                case "talk":
                    scr_talk(npc);
                    break;
                case "browse":
                    scr_shop();
                    break;
                case "fight":
                    scr_combat();
                    break;
            }
            break;
        case "talking":
            var talkNum = ds_list_find_index(obj_dialogue.answerList, command);
            if talkNum != -1 {
                dialog_load(obj_dialogue.file,obj_dialogue.section,obj_dialogue.dia_dest[talkNum]);
            }
            
            //  Redundant for now, but Kept for good measure... for now.
            
            /*switch command            
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
            }*/
            break;
        case "combat":
            switch command
            {
                case "leave":
                    if instance_exists(obj_enemy)
                    {
                        with obj_enemy
                        {
                            instance_destroy();
                        }
                    }
                    global.player1State = "normal";
                    ds_list_delete(obj_controller.commandList, ds_list_find_index(obj_controller.commandList, "leave"));
                    break;
                case "attack":
                    break;
            }
            break;
    }
///---------- DEBUG STUFF ----------///

} else if (command = "start") && !global.started
{
    obj_console.console = "";
    scr_lChange("introburg");
} 
if (command = "create") && !global.started
{
    obj_console.console = "";
    scr_start("");
}
if (command = "exit game")
{
    scr_exitGame();
}
if (command = "music")
{
    if audio_is_playing(snd_sadStart)
    {
        audio_stop_all();
    } else if !audio_is_playing(snd_sadStart) {
        audio_play_sound(snd_sadStart,1,true);
    }
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
