
///scr_shop(target)

shop[0] = "horses milk"
var shopTrue =ds_list_find_index(global.localeNPC, "Shopkeeper");

if shopTrue != -1
{
    for (i = 0; i < array_length_1d(shop); i++)
    {
        obj_console.console += shop[i];
        obj_console.console += "#";
        
    }
}
