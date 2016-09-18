///scr_talk(target)
var npc = argument0;
var npcNum = ds_list_find_index(global.localeNPC, npc);

obj_player.state = "talking";
switch npcNum
{
    case 0:
        obj_npc0.isTalking = true;
        obj_player.talkingTo = 0;
        global.player1State = "talking";
        break;       
    case 1:
        obj_npc1.isTalking = true;
        obj_text.whoTalk = 1;
        break;
    case 2:
        obj_npc2.isTalking = true;
        obj_text.whoTalk = 2;
        break;
} 
