///scr_lChange(location)
///Changes the location your player is in
global.lPrevious = global.location;
global.location = argument0;

if (instance_exists(obj_location))
{
    with (obj_location)
    {
        instance_destroy();
    }
}
instance_create(1, 1, obj_location);

var jsonNPC = file_text_open_read(working_directory+"assets\NPCs\"+string_lower(global.location)+"NPC.json");

var npcData = "";
while (!file_text_eof(jsonNPC))
{
    npcData += file_text_read_string(jsonNPC);
    file_text_readln(jsonNPC);
}
file_text_close(jsonNPC);
global.npcMap = json_decode(npcData);


