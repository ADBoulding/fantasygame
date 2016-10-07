///scr_changeSuff(destination)
if instance_exists(obj_npc)
{
    with (obj_npc)
   {
    instance_destroy();
   }
}
if instance_exists(obj_enemy)
{
    with (obj_enemy)
    {
        instance_destroy();
    }
}
if ds_exists(global.goDest, ds_type_list) ///checks if there is a list holding desitinations in the current suffix and replaces it
{
    ds_list_destroy(global.goDest);
    global.goDest = ds_list_create();
}

if ds_exists(global.localeNPC, ds_type_list) /// ditto with the npc list
{
    ds_list_destroy(global.localeNPC);
    global.localeNPC = ds_list_create();
}

global.lSuff = argument0;
var suff = string_lower(global.lSuff);
var canGo = global.locale[? string(suff + ".canAccess")];

obj_console.console += "+-----------------------------------------------------------+#";
obj_console.console += ds_map_find_value(global.locale, string_lower(global.lSuff) + ".description") + "#";
var sen;
switch suff
{
    case "gate":
        sen = " standing at the gates to " + global.location + "#";
        break;
    case "outskirts":
        sen = " in the outskirts of " + global.location + "#";
        break;
    case "old man":
        sen = " by the old man#";
        break;
    default:
        sen = " at the " + global.lSuff + "#";
        break;
}    
obj_console.console += "You are now" + sen;
obj_console.console += "You should 'look around' to see what is near you#";
obj_console.console += "+-----------------------------------------------------------+#";

if (canGo != "")
{
    var arr;
    var del = ",";
    var str = canGo + del;
    var len = string_length(del);
    var ind = 0;
    repeat (string_count(del, str)) {
        var pos = string_pos(del, str) - 1;
        arr = string_copy(str, 1, pos);
        str = string_delete(str, 1, pos + len);
        ds_list_add(global.goDest, arr);
        arr = 0;
    }
}
if (global.locale[? string(suff + ".NPC")] != undefined)
{
    var isNPC = global.locale[? string(suff + ".NPC")];
    if (isNPC != "")
    {
        var arr2;
        var del2 = ",";
        var str2 = isNPC + del2;
        var len2 = string_length(del2);
        var ind2 = 0;
        repeat (string_count(del2, str2)) {
            var pos2 = string_pos(del2, str2) - 1;
            arr2 = string_copy(str2, 1, pos2);
            str2 = string_delete(str2, 1, pos2 + len2);
            ds_list_add(global.localeNPC, arr2);
            arr2 = 0;
        }
    }
    scr_npc();
}

