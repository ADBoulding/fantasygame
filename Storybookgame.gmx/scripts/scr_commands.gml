///scr_commands(command)    

command = string_lower(command);

///Checks if the command is empty when you press enter
if (command != "")
{ 
    if (command = "start") and (global.location = "ButtFuck")
    {
        locationChange();
    } 
    else if (string_pos("go", command) != 0)
    {
        if (string_pos("shop", command) > string_pos("go", command))
        {
            switch global.lSuff
            {
                case "shop":
                    obj_console.console += "You're already in the shop...#";
                    break;
                default: 
                    obj_console.console += "Inside there is an old man behind the counter.#";
                    global.lSuff = "shop";
                    break;
            }
        } 
        else if (string_pos("town square", command) > string_pos("go", command))
        {
            switch global.lSuff
            {
                case "plaza":
                    obj_console.console += "You're already in the square...#";
                    break;
                default: 
                    obj_console.console += "It works (square)#";
                    global.lSuff = "plaza";
                    break;
            }
        }
    } else if (string_pos("print", command) != 0)
    {
        obj_console.console += "You are currently in the " + global.lSuff + " of " + 
            global.location + " in the region of " + global.region + "#";
        obj_console.console += "You were previously in " + global.lPrevious + 
            " in the region of " + global.rPrevious + "#";
        if (global.location = "Introville")
        { 
            obj_console.console += "There is a shop and an old man#";
        }
    }
    else if (string_pos("talk", command) != 0)
    {
        if (string_pos("old", command) > string_pos("talk", command) and (global.lSuff = "shop"))
        {
            switch global.lSuff
            {
                case "old":
                    obj_console.console += "You're already in the shop...#";
                    break;
                default: 
                    obj_console.console += '"Hello there"#';
                    global.lSuff = "old";
                    break;
            }
        } 
}
    

}
