///scr_ask(topic)
topic = argument0;
switch obj_player.talkingTo
{
    case 0:
        obj_npc0.topic = topic;
        obj_npc0.topicProgress = 0;
        break;
}
