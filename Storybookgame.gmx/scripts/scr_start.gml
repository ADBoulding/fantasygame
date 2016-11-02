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
                } else if string_pos("choose",string_lower(input)) != 0
                {
                    obj_controller.startState = 21;
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
                    obj_console.console += "That doesn't look like true or false#";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console += "///------Question 9------\\\ #Some species of turtle can breathe in and out of their butts.#";
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
        case 11:
            if input != ""
            {
                if string_pos("the",string_lower(input)) != 0
                {
                    input = string_delete(input,1,4);
                }
                input = string_lower(input);
                var nDefault = true;
                switch input
                {
                    case "ignumbrie":                   //12
                        input = "";
                        obj_controller.startState = 12;
                        break;
                    case "asalfor":                     //13
                        input = "";
                        obj_controller.startState = 13;
                        break;
                    case "humans":
                    case "human":                       //14
                        input = "";
                        obj_controller.startState = 14;
                        break;
                    case "fae":                         //15
                        input = "";
                        obj_controller.startState = 15;
                        break;
                    case "bearmen":                     //16
                        input = "";
                        obj_controller.startState = 16;
                        break;
                    case "srye":                        //17
                        input = "";
                        obj_controller.startState = 17;
                        break;
                    case "ostreod":                     //18
                        input = "";
                        obj_controller.startState = 18;
                        break;
                    case "shol":                        //19
                        input = "";
                        obj_controller.startState = 19;
                        break;
                    case "mer":                         //20
                        input = "";
                        obj_controller.startState = 20;
                        break;
                    case "strigoi":                     //21
                        input = "";
                        obj_controller.startState = 21;
                        break;
                    case "kakusha":                     //22
                        input = "";
                        obj_controller.startState = 22;
                        break;
                    default:
                        obj_console.console += "Choose a valid race please.";
                        startBuffer = 0;
                        nDefault = false;
                        break;
                }
                if nDefault {input = ""; break;}    
            }
            obj_console.console += "Wonderful!#The realm you are bound to explore, as a hub of many worlds, is the host to a massive variety of species, races, and sentient creatures. #While there are many creatures, not all of them have a foothold in the landscape, with many species being quite rare, or even unheard of. The nations in this land are created by the three dominant races:
    -The Ignumbrie
    -The Asalfor
    -The Humans 
Alongside the three dominant races range a variety of subspecies as well as transient groups, among them are:
    -The Fae       -The Bearmen
    -The Srye      -The Ostreod
    -The Shol      -The Mer
    -The Strigoi   -The Kakusha
Choose a race to read more about them.#";
            startBuffer = 0;
            break;
        case 12:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Ignumbrie";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Ignumbrie----------\\\ #The Ignumbrie are a tribal race of salamanders inhabiting the regions to the cold desolate wastes of the south. The Ignumbrie are refered to by the plural of their race's name as they belong entirely and absolutely to their respective tribes. A deeply caste system, to be banished from the tribe is to kill the subject, the title given to the exiled translates to 'forgotten', and they will not find a warm hearth within the nations borders. The strengths of the race lay within their ability to master many skills, as well as the martial skills with a spear or daggers. Though the Ignumbrie can master many skills, due to their long lives, the rate at which the Ignumbrie learn is stunted. #Would you choose to be one of the Ignumbrie? ('yes' to choose, or 'back' to see the other races)#";
            startBuffer = 0;
            break;
        case 13:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Asalfor";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Asalfor----------\\\ #The Asalfor are believed to be the oldest sentient race in the land, which could be because of the proud nature of the race. The small, elfish creatures are almost never seen outside of their nations boundaries, though are revered my many races as living gods, and are worshiped in several small towns and areas. The Asalfor range between 3' and 4', have ashen grey skin, long drooping ears and white to grey hair on the backs of their elbows, trailing to the backs of the hands. #The strengths of the race fall in their innate understanding of the world, through intuition and the backing of the races knowledge. The weaknesses of the race fall in their slight consitution and poor social understanding of other races. #Would you like to be one of the Asalfor? ('yes' to choose, 'back' to see the other races)#";
            startBuffer = 0;
            break;
        case 14:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Human";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Humans----------\\\ #Humans are the most populous of the races on the Isle, holding most of the land as well as the towns. Though very adaptive, Humans are deeply superstitious, and will quickly target outsiders as the cause of their ails.#The strength of the humans lay in their ability to learn skills very fast, though because of their short lives, can only master a few. The human race also has limited travel within the boundaries of the Ignumbrie.#Would you like to be a human? ('yes' to choose the human race, 'back' to choose another)";
            startBuffer = 0;
            break;
        case 15:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Fae";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Fae----------\\\ #The Fae are a mystic race of otherworldy creatures who, curious of the mortal realm, bound themselves to corporeal bodies in order to experience the land of the living. The Fae range in size and shape, but have an undeniable mark of the Fae, a dark black crest laying as proof of their binding to a mortal body. The Fae have knowledge and capabilities specific to the type of Fae, and their weakness lay with the type as well. Would you choose to be of the Fae? ('yes' to choose the Fae, 'back' to return to the other races).#";
            startBuffer = 0;
            break;
        case 16:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Bearman";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Bearmen----------\\\ #Bearmen embody the wilderness. Though not necessariy bears, and not having a name for their own race, the collective have been refered to since their discovery by the title given to them by the Humans. Massive in stature, ranging from 6' to 10', the Bearmen have the physical appearance of bipedal bears, though featuring distinctly human qualities (leading some to make assumptions of their origin). Their immense strength and fierce loyalty make them desirable travel companions, though their weakness lay in their inability to master, and for some even learn, skills that require a finer grace. Do you choose to be one of the Bearmen? ('yes' to choose Bearmen as a race, 'back' to see others).#";
            startBuffer = 0;
            break;
        case 17:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Srye";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Srye----------\\\ #Not much is known about the social structure of the Srye due to their skittish, solitary nature, though their appearance and bearing are undeniable. Immensly thin, tall and chitanous, the Srye appear to resemble giant insectoids, though their long, androgynous faces leave observers confused as to their nature. Light on their pointed feet and blindingly fast, the dexterity and grace of the Srye lead many take to the vocation of thieves and assassins. Though they are naturally gifted in the art of evading, due to their smallish frames, are unable to carry heavy weapons, armor, and items, instead relying on robes and leather. Do you choose to be one of the Srye? ('yes' to choose the Srye, 'back' to see the other races)";
            startBuffer = 0;
            break;
        case 18:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Ostreod";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Ostreod----------\\\ #Temp Ostreod!";
            startBuffer = 0;
            break;
        case 19:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Shol";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Shol----------\\\ #Temp Shol!";
            startBuffer = 0;
            break;
        case 20:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Mer";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Mer----------\\\ #Temp";
            startBuffer = 0;
            break;
        case 21:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Strigoi";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Strigoi----------\\\ #Temp Strigoi!";
            startBuffer = 0;
            break;
        case 22:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.race = "Kakusha";
                    input = "";
                    obj_controller.startState = 23;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 11;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Kakusha----------\\\ #Temp Kakusha";
            startBuffer = 0;
            break;
        case 23:
            if input != ""
            {
                if string_pos("male", string_lower(input)) != 0
                {
                    obj_player.gender = "Male";
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else if string_pos("female", string_lower(input)) != 0
                {
                    obj_player.gender = "Female";
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else {
                    obj_console.console += "Choose male or female";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "Choose a gender!! 'male' or 'female'";
            startBuffer = 0;
            break;
        case 24:
            if input != ""
            {
                if string_pos("the",string_lower(input)) != 0
                {
                    input = string_delete(input,0,4);
                }
                input = string_lower(input);
                var nDefault = true;
                switch input
                {
                    case "longsword":
                        input = "";
                        obj_controller.startState = 25;
                        break;
                    case "bow":
                        input = "";
                        obj_controller.startState = 26;
                        break;
                    case "dagger":
                    case "daggers":
                        input = "";
                        obj_controller.startState = 27;
                        break;
                    case "spear":
                        input = "";
                        obj_controller.startState = 28;
                        break;
                    default:
                        obj_console.console += "Choose a valid weapon please.";
                        startBuffer = 0;
                        nDefault = false;
                        break;
                }
                if nDefault {input = ""; break;}
            }
            obj_console.console+= "///----------Weapon----------\\\
///Your character is slowly taking shape... Your weapon choice lays next. While it is possible to learn different styles across the land, your chosen weapon will dictate your style of combat, but many other aspects of your character as well... choose wisely...
///----------Weapon Choices----------///
    -Longsword      -Bow
    -Daggers        -Spear";
            startBuffer = 0;
            break;
        case 25:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.weapon = "Longsword";
                    input = "";
                    obj_controller.startState = 29;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Longsword----------\\\ #The longsword is absolutely the most popular of the weapons available to the masses, as even an unskilled warrior is dangerous when armed with sharpened steel. Valuing skill and grace, though not excluding strength, the longsword can be both a burden or a great weapon depending on its use. Would you like to choose the Longsword as your weapon? ('yes' to choose the weapon or 'back' to see other weapons)#";
            startBuffer = 0;
            break;
        case 26:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.weapon = "Bow";
                    input = "";
                    obj_controller.startState = 29;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Bow----------\\\ #The bow is constantly viewed as tools for the weak, though in the gambit of death, it is better to be viewed as weak than dead. Valuing immense skill in accuracy and arm strength, the bow can be used to hunt for meals as well as a tool to pick off enemies at a far distance. Do you choose to use a bow as your main weapon? ('yes' to choose the bow as your weapon and 'back' to view other weapons).#";
            startBuffer = 0;
            break;
        case 27:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.weapon = "Daggers";
                    input = "";
                    obj_controller.startState = 29;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Daggers----------\\\ #TEMP!!!";
            startBuffer = 0;
            break;
        case 28:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_player.weapon = "Spear";
                    input = "";
                    obj_controller.startState = 29;
                    break;
                } else if string_pos("back", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 24;
                    break;
                } else {
                    obj_console.console += "Choose yes or back";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "///----------The Spear----------\\\ #";
            startBuffer = 0;
            break;
        case 29:
            if input != ""
            {
                obj_player.name = input;
                input = "";
                obj_controller.startState = 30;
                break;
            }
            obj_console.console += "What would you like your character to be named?";
            startBuffer = 0;
            break;
        case 30:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    input = "";
                    obj_controller.startState = 31;
                    break;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    obj_player.name = "";
                    input = "";
                    obj_controller.startState = 29;
                    break;
                } else {
                    obj_console.console += "Choose yes or no";
                    startBuffer = 0;
                    break;
                }
            }
            obj_console.console+= "You chose your name to be: " + obj_player.name + "#Are you sure? ('yes' to choose your name, or 'no' to choose another";
            startBuffer = 0;
            break;
        case 31:
            if input != ""
            {
                if string_pos("true", string_lower(input)) != 0
                {
                    obj_console.console = "";
                    ds_list_destroy(global.start);
                    obj_controller.startState = -1;
                    scr_lChange("introburg");
                    exit;
                } else if string_pos("false", string_lower(input)) != 0
                {
                    obj_console.console += "Well Shit...#";
                    obj_controller.startState = -1;
                    ds_list_clear(global.start);
                    scr_start("");
                    exit;
                } else {
                    obj_console.console += "That doesn't look like a valid answer.#";
                    exit;
                }
            }
            obj_console.console += "Hokay!!!#Let me go over this...##You are a " + obj_player.race + " " + obj_player.gender + " wielding a " + obj_player.weapon + " named " + obj_player.name + "##Is this true? ('yes' to conclude your character creation, or 'no' to decide again)";
            startBuffer = 0;
            break;
        default:
            break;          
    }
}

if human != global.start[| 0]{
    global.start[| 0] = human;
}
if beast != global.start[| 1]{
    global.start[| 1] = beast;
}
if strength != global.start[| 2]{
    global.start[| 2] = strength;
}
if grace != global.start[| 3]{
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
            ds_list_destroy(global.start);
            global.started = true;
            obj_controller.startState = -1;
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
