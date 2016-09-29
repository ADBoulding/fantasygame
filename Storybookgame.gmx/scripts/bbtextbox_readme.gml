/*

  _   _                      
 | | | | ___ __ _  __ _  ___ 
 | |_| |(_-</ _` |/ _` |/ -_)
 \___/ /__/\__,_|\__, |\___|
                 |___/      

Call textbox(input) where input is the text that should be drawn.Text can be
marked up by using some basic BB code commands.

    The following text is [color=green]green[/color].

Displays the input as "The following text is green", where green is drawn green.
The engine also remembers previously set values of colors. This is usefull while
nesting your tags.

    This is [color=green]green, this is [color=blue]blue[/color] and
    this is green again[/color].
    
There are also some other tags. Like [instant] that will skip the animation.
By default, every step, one more letter is shown. This can be changed easily
in different ways, depending on your preferences.

    - If you want to have a slower text, use [speed=...] with a new value
      < 1, if you want it faster > 1, these can also be nested like colours
      in the previous example.
    - Change the default settings in the create event of obj_textbox to have
      the value you want.
    - Use -1 to disable text animation completely, or start
      your input with [instant] (this can also be used mid-text).
    - Always want an instant text, use instant_textbox()

Use \ if you want to delay a text, without drawing any characters.
    
Currently you can't escape any characters. Drawing a \ is not possible, neither
are [ and ]. If you want it, add an escaping mechanism, but I might add it
later.


  ___                          _      
 | __|__ __ __ _  _ __   _ __ | | ___ 
 | _| \ \ // _` || '  \ | '_ \| |/ -_)
 |___|/_\_\\__,_||_|_|_|| .__/|_|\___|
                        |_|           

*/

var str;
str  = "Hello!\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ # ##This is some text!";
str += "#A test with different kinds of [color=c_red]co[/color][color=c_blue]lou[/color]";
str += "[color=c_green]rs[/color]!";
str += "#[speed=0.25]Really slow text[/speed] and changing [background=back_1]backgrounds!";
str += "#[speed=4]Also some really fast text![/speed]";
str += "##[font=fnt_messageboxb]Also possible to have multiple ";
str += "fonts and [color=purple]combine [speed=0.2]them[/speed].[/color].";
str += "###\\\\\\\\\\\\\\ And another [background=back_2] changing background![/font] :)";

return textbox(str);

/*

Tip: run this script to test it!


  ___        _  _  _         _         _                   
 | _ ) _  _ (_)| || |_  ___ (_) _ _   | |_  __ _  __ _  ___
 | _ \| || || || ||  _||___|| || ' \  |  _|/ _` |/ _` |(_-<
 |___/ \_,_||_||_| \__|     |_||_||_|  \__|\__,_|\__, |/__/
                                                 |___/     

[instant] will set the speed to -1, which will be used to draw everything
until the next speed change (not with [instant]!). Note that in games where
you don't want any animation, you should use instant_textbox.

[skip] and [next] will immediatly destroy the message box, without checking
for anything else. As the textbox will immediatly close, you don't need to
close this tag.

[color=newcolor] will change the current color to another one, you can select
only from the default known colours of GameMaker:Studio, but you don't have
to start with c_red, you can just use red. You can change this behaviour by
modifying string_to_color.

[font=newfont] will change the current font. This font should be available in
your project, you can't choose from fonts installed on the system. Unless you
import them first.

[speed=newspeed] will set the speed. A speed of 1 means 1 character each step.
A speed of 2 means 2 characters each step. Setting this to -1 has the same
effect as using [instant].

[alpha=newalpha] changes the alpha of the next characters. This should be a
value between 0 and 1 (inclusive), as does GameMaker require when using
draw_set_font(alphavalue).

[sound=snd], [music=snd], [sprite=spr], [background=bck] are all tags which 
can alter some game variables (like the current background, music track,
sound effect, player character). Their implementation depends heavily on the
type of game and should be supplied by the developper using the bbtextbox;
See the step event of obj_textbox around the middle. You can implement your
own tags easily (see end of this readme). Actions don't have a closing tag.
The only implemented tag is [background=bck] currently. It is used by
the example.


All tags, except for [skip] and [next] (which have the same behaviour) and 
those defining specific actions (like [sound=snd] and other), need to be
closed. To close [speed=4] you need to enter [/speed] where the old value
of speed needs to be used again.


    _       _     _  _                                                        
   /_\   __| | __| |(_) _ _   __ _   _  _  ___  _  _  _ _   ___ __ __ __ _ _  
  / _ \ / _` |/ _` || || ' \ / _` | | || |/ _ \| || || '_| / _ \\ V  V /| ' \ 
 /_/ \_\\__,_|\__,_||_||_||_|\__, |  \_, |\___/ \_,_||_|   \___/ \_/\_/ |_||_|
                             |___/   |__/                                     
  _                   
 | |_  __ _  __ _  ___
 |  _|/ _` |/ _` |(_-<
  \__|\__,_|\__, |/__/
            |___/     

You can add your own tags easily. Without any modifications there are two
types of tags:

    - No arguments
    - One argument
    
You could change the parser to have more tags, or you can locally parse the
given argument to have a specific syntax, this is up to you.

In the User Defined 0-event, there is one script. There are two switches
(one for no arguments, one with one argument), which define the opening and
closing tags of all the built-in tags. At the end of this switch you can add
your own tag. Note that if you want to change the visiblity of characters,
you might have to take a deeper look at the code to know how character
information is saved.

When using an argument, the argument itself is available in the local (to
the script) variable 'b', you should use this information immediatly by
saving it somewhere as it will be overwritten later.

If you want to save old values, you should take a look at the current
implementation of [color=c] and [/color], when using [color=c] the old
value is saved on a stack, and the new value is applied.


    _       _     _  _                                                        
   /_\   __| | __| |(_) _ _   __ _   _  _  ___  _  _  _ _   ___ __ __ __ _ _  
  / _ \ / _` |/ _` || || ' \ / _` | | || |/ _ \| || || '_| / _ \\ V  V /| ' \ 
 /_/ \_\\__,_|\__,_||_||_||_|\__, |  \_, |\___/ \_,_||_|   \___/ \_/\_/ |_||_|
                             |___/   |__/                                     
            _    _                
  __ _  __ | |_ (_) ___  _ _   ___
 / _` |/ _||  _|| |/ _ \| ' \ (_-<
 \__,_|\__| \__||_|\___/|_||_|/__/
                                  
If your game requires more type of actions (for example, allowing a guard to
move immediatly after he says "halt"), you must first add a new tag with the
following code:

    actionlist[actions,val_start] = chars+1;
    actionlist[actions,val_type] = "<action>"; // Add a name for your action
    actionlist[actions,val_value] = b;
    actions += 1;
    
<action> should be changed to something uniquely. b contains the raw argument
information. If your tag doesn't have this, you should supply -1 or the 
empty string. An example for parsing [moveguard=404]

Remember that actions do not require a closing tag!


  _     _                              _                             
 | |   (_) __  ___  _ _   ___ ___     | |__  _  _  __ _  ___         
 | |__ | |/ _|/ -_)| ' \ (_-</ -_) _  | '_ \| || |/ _` |(_-< _  _  _ 
 |____||_|\__|\___||_||_|/__/\___|( ) |_.__/ \_,_|\__, |/__/(_)(_)(_)
                                  |/              |___/              
                                  
Attribution is not needed, but is appreciated. For the rest: do whatever you
want to do this type code. You can use it wihout any modification in your
game, or modify it heavily to support some really awesome features.

If you find a bug, send me a message at bbtextbox@bjarno.be (yes, that's 
a separte address for this thing alone). I'll get in touch as soon as possible,
of course this is only the case when using the non-modified version of these
scripts. Do NOT contact me if you want to know how to use this, I think this
readme should suffice.




Used tool for headings:
http://patorjk.com/software/taag/#p=display&h=1&f=Small&t=


*/
