///scr_start(input)
input = argument0;

if obj_controller.startState = -1
{
    obj_controller.startState = 0;
    global.start = ds_list_create();
    ds_list_add(global.start,0,0,0,0,0,0,0);
}

if string_lower(input) = "yes"
{
    input = "true";
} else if string_lower(input) = "no"
{
    input = "false";
}

var human = global.start[| 0];
var beast = global.start[| 1];
var strength = global.start[| 2];
var grace = global.start[| 3];
var intellect = global.start[| 4];
var alignment = global.start[| 5];
var greed = global.start[| 6];

var testDone = false;

if obj_controller.startState = -2 
{
    testDone = true;
}
if !testDone 
{
    var startBuffer = 1;
} else {
    var startBuffer = 0;
}

while startBuffer = 1
{
    switch obj_controller.startState
    {
        case 0:
            if input != ""
            {
                if string_pos("test",string_lower(input)) != 0
                {
                    obj_controller.startState = 1;
                    input = "";
                    break;
                } else if string_pos("customize",string_lower(input)) != 0
                {
                    obj_controller.startState = 11;
                    input = "";
                    break;
                } else {
                    obj_console.console += "You do need to choose...#";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console = "";
            obj_console.console += "Welcome to the game... Because I do not have the patience or willpower at this point to write a decent intro, I'll start by asking whether you would like to take a test to determine your character, would you like to choose from a preset bunch, or would you would like to customize your own...# Well?     (type 'test' or 'customize')#";
            startBuffer = 0;
            break;
        case 1:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    beast += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    human += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "Wonderful! Why don't we start out with a series of questions then? I believe 10 should suffice, just answer 'true', or 'false' ## ///------Question 1------\\\ #You've always wished to be something other than human.#";
            startBuffer = 0;
            break;
        case 2:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    beast += 2;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    human += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 2------\\\ #You really, really wanted to be something other than human... Like a bear or something...#";
            startBuffer = 0;
            break;
        case 3:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    greed -= 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    greed += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 3------\\\ #You would delve into an adventure solely for the experiece, regardless of the financial benefits.";
            startBuffer = 0;
            break;
        case 4:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    alignment -= 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    alignment += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 4------\\\ #You feed on the misfortune of others.";
            startBuffer = 0;
            break;
        case 5:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_console.console += "its +/- x, stupid";
                    intellect -= 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    intellect += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 5------\\\ #The answer to the expression <root(x^2) = x> is...?";
            startBuffer = 0;
            break;
        case 6:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    grace += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    strength += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 6------\\\ #Kung Fu is better than Jiu Jitsu.";
            startBuffer = 0;
            break;
        case 7:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    strength += 2;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    grace += 2;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 7------\\\ #You would prefer a zweihander to a rapier.";
            startBuffer = 0;
            break;
        case 8:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    alignment -= 2;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    alignment += 2;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 8------\\\ #You like armour with super spiky stuff... not unlike Sauron's set... y'know, super evit shit...";
            startBuffer = 0;
            break;
        case 9:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    intellect += 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    intellect -= 1;
                    input = "";
                    obj_controller.startState += 1;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 9------\\\ #Some species of turtle can breathe in and out of their butts.";
            startBuffer = 0;
            break;
        case 10:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    intellect += 1;
                    input = "";
                    testDone = true;
                    obj_controller.startState = -2;
                    startBuffer = 0;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    intellect -= 1;
                    input = "";
                    testDone = true;
                    obj_controller.startState = -2;
                    startBuffer = 0;
                    break;
                } else {
                    obj_console.console += "That doesn't look like true or false";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 10------\\\ #The average airspeed velocity of an unlaeden european swallow is 11 meters per second.";
            startBuffer = 0;
            break;
        default:
            break;          
    }
}

if human != global.start[| 0]
{
    global.start[| 0] = human;
}
if beast != global.start[| 1]
{
    global.start[| 1] = beast;
}
if strength != global.start[| 2]
{
    global.start[| 2] = strength;
}
if grace != global.start[| 3]
{
    global.start[| 3] = grace;
}
if intellect != global.start[| 4]
{
    global.start[| 4] = intellect;
}
if alignment != global.start[| 5]
{
    global.start[| 5] = alignment;
}
if greed != global.start[| 6]
{
    global.start[| 6] = greed;
}

if testDone
{
    if input != ""
    {
        if string_pos("true", string_lower(input)) != 0
        {
            obj_console.console = "";
            scr_lChange("introburg");
            exit;
        } else if string_pos("false", string_lower(input)) != 0
        {
            obj_console.console += "Well Shit...";
            obj_controller.startState = -1;
            ds_list_clear(global.start);
            scr_start("");
            exit;
        } else {
            obj_console.console += "That doesn't look like a valid answer.";
            exit;
        }
    }   
    if beast == 3 
    {
        if alignment == 1 
        {
            obj_console.console += "#congrats... You are literally a an evil bear. While I applaud your effort, the rest of the questions were relatively redundant. You're just an asshole bear.#";
        } else if intellect == 3 {
            obj_console.console += "#Great... You're a bear. While you may have high intellect, due to your answers, you're still a bear. You love honey and shit.#";
        } else if intellect == -3 {
            obj_console.console += "#Super... You're a retarded bear. Just when you think it couldn't get any worse, you went and made your bear retarded. congrats.#";
        } else {
            obj_console.console += "#Well... you're a painfully average bear. Go have fun in the woods you furry.#";
        }
    } else if human == 1 
    {
        if intellect == 3 
        {
            obj_console.console += "#You are a tall, broadchested man with the head of an owl. This is what you wanted I guess.";
        } else if strength >= 2
        {
            obj_console.console += "#You are a bull with the intelligence of a human, but no thumbs... or hip structure to stand in a bipedal fashion. You'll most likely spend your days wondering, 'why did god pick me for this torture,' or eating grass or something. Sweet.#";
        } else if grace >= 2
        {
            obj_console.console += "#You are a buck with human legs. You are graceful, but still have the upper body of a buck, making you wonder if you're different than the other boys, or if the girls will ever come to appreciate your impressive rack.";
        }
    } else if human == 2
    {
        obj_console.console += "#You're a human. Just like the rest of us... congrats";
    }
    obj_console.console += "is that right? (yes or no)#";
}
