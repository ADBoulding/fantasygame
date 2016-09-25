///scr_ask(topic)
topic = argument0;
var npc = obj_player.talkingTo;
var targetNPC = instance_find(obj_npc, npc);
targetNPC.topic = topic;
targetNPC.topicProgress = 0;

    
