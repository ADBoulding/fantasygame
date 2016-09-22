///scr_ask(topic)
topic = argument0;
switch obj_player.talkingTo
{
    case 0:
        obj_npc0.topic = topic;
        obj_npc0.topicProgress = 0;
        break;
    case 1:
        obj_npc1.topic = topic;
        obj_npc1.topicProgress = 0;
        break;
}
