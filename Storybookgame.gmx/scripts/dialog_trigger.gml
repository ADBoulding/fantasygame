///dialog_trigger(expression)
//Converts a string into a mathmatical expression, then makes it happen 
var expression=argument0
if expression=""{exit}//Exit if there is no trigger. GMS will crash if you use "string_digits" on an empty string.
var value=real(string_digits(expression))

//Here I'm defining what operation to check for. With this system, the variable must be listed before the constant, in the form "spd>4"
if string_contains(expression,"+"){op=0}
if string_contains(expression,"-"){op=1}
if string_contains(expression,"="){op=2}


if string_contains(expression,"str")
{
if op=0{o_player.str+=value}//Adding
if op=1{o_player.str+=-value}//Subtracting
if op=2{o_player.str=value}//Setting
}

if string_contains(expression,"spd")
{
if op=0{o_player.spd+=value}//Adding
if op=1{o_player.spd+=-value}//Subtracting
if op=2{o_player.spd=value}//Setting
}

if string_contains(expression,"nameLearned")
{
    
}



