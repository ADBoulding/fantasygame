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
    
    var workingName = npcTarget.workingName;
    if npcTarget.npc[? "state"] != undefined && obj_player.npcProg[? workingName+".prog"] = undefined {
        npcTarget.prog = 0;
        obj_player.npcProg[? workingName+".prog"] = 0;
        npcTarget.undisc = true;
        obj_player.npcProg[? workingName+".undisc"] = true;
        npcTarget.disposition = 50;
        obj_player.npcProg[? workingName+".disp"] = 50;
        npcTarget.talkedNum = 1;
        obj_player.npcProg[? workingName+".talkedNum"] = 1;
    } else if obj_player.npcProg[? workingName] != undefined {
        npcTarget.prog = obj_player.npcProg[? workingName+".prog"];
        npcTarget.undisc = obj_player.npcProg[? workingName+".undisc"];
        npcTarget.disposition = obj_player.npcProg[? workingName+".disp"];
        npcTarget.talkedNum = obj_player.npcProg[? workingName+".talkedNum"]
    }
}
