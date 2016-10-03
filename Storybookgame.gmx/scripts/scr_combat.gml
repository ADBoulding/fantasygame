///scr_combat()
if global.locale[? string_lower(global.lSuff) + ".combat"] != undefined
{ 
    obj_player.state = "combat";
    obj_console.console += "Yay! combat works#";
    exit;
} else {
    obj_console.console += "There is no one to fight here...#";
}
