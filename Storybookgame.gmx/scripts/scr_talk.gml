///scr_talk(target)
var npc = argument0;
var npcNum = ds_list_find_index(global.localeNPC, npc);
obj_player.state = "talking";
if npcNum != -1
{
    var npcTarget = instance_find(obj_npc,npcNum);
    npcTarget.isTalking = true;
    obj_player.talkingTo = npcNum;
    global.player1State = "talking";
}
