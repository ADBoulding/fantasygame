///dialog_skillcheck(expression)
//Converts a string into a mathmatical expression, then returns if the expression is true or not
var expression=argument0
if expression=""{return true exit}//Exit if there is no check. GMS will crash if you use "string_digits" on an empty string.
var value=real(string_digits(expression))

//Here I'm defining what operation to check for. With this system, the variable must be listed before the constant, in the form "spd>4"
if string_contains(expression,"<"){op=0}
if string_contains(expression,">"){op=1}


if string_contains(expression,"str")//If we're checking str
{
if op=0{if o_player.str < value {return true;}else{return false;}}//A < stat check
if op=1{ if o_player.str > value {return true;}else{return false;} }//A > stat check
}

if string_contains(expression,"spd")//If we're checking spd
{
if op=0{ if o_player.spd < value {return true exit}else{return false exit} }//A < stat check
if op=1{ if o_player.spd > value {return true exit}else{return false exit} }//A > stat check
}



