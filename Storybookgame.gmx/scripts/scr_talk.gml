///scr_talk(target)
var npc = argument0;
var npcNum = ds_list_find_index(global.localeNPC, npc);
if npcNum > instance_number(obj_npc)-1 {
    npcNum = npcNum - instance_number(obj_npc);
}
if npcNum != -1
{
    var npcTarget = instance_find(obj_npc,npcNum);
    npcTarget.isTalking = true;
    obj_player.talkingTo = npcNum;
    global.player1State = "talking";
    var m = instance_create(0,0,obj_dialogue);
    m.file = string_lower(global.location)+"Dia.ini";
    m.section = npcTarget.workingName;
}
