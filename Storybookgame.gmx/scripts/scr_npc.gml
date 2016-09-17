///scr_npc()
if instance_exists(obj_npc0)
{
    with (obj_npc0)
    {
        instance_destroy();
    }
}
if instance_exists(obj_npc1)
{
    with (obj_npc1)
    {
        instance_destroy();
    }
}
if instance_exists(obj_npc2)
{
    with (obj_npc2)
    {
        instance_destroy();
    }
}


if !ds_list_empty(global.localeNPC)
{
    var npcNum = ds_list_size(global.localeNPC);
    
    if npcNum != 0 
    {
        for (i = 0; i < npcNum; i++)
        {
            if global.localeNPC[| i] != ""
            {
                var npcObj = asset_get_index("obj_npc" + string(i));
                instance_create(5 + i,5 + i,npcObj);
            }
        }
    }
}
