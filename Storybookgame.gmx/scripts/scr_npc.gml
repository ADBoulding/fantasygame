///scr_npc()
if !ds_list_empty(global.localeNPC)
{
    var npcNum = ds_list_size(global.localeNPC);
    if npcNum != 0 
    {
        for (i = 0; i < npcNum; i++)
        {
            if global.localeNPC[| i] != ""
            {
                var inst;
                inst = instance_create(5 + i,5 + i,obj_npc);
            }
        }
    }
}

