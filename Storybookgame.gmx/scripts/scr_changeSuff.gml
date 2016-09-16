///scr_changeSuff(destination)
if ds_exists(global.goDest, ds_type_list)
{
    ds_list_destroy(global.goDest);
    global.goDest = ds_list_create();
}
global.lSuff = argument0;
var suff = string_lower(global.lSuff);
var canGo = global.locale[? string(suff + ".canAccess")];

obj_console.console += "+-----------------------------------------------------------+#";
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

