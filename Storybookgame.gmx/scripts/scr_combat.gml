///scr_combat()
if global.locale[? string_lower(global.lSuff) + ".combat"] != undefined
{ 
    global.player1State = "combat";
    ds_list_add(obj_controller.commandList, "leave");
    obj_console.console += "Yay! combat works#";
    instance_create(10, 10, obj_enemy);
    exit;
} else {
    obj_console.console += "There is no one to fight here...#";
}
