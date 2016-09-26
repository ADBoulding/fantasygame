///dialog_load(file,section,key)
ini_open(working_directory+"assets\dialogue\"+argument0)
var dia_grid=ds_grid_create(25,9)
var dia_string=ini_read_string(argument1,argument2,"")
ds_grid_read(dia_grid,dia_string)
with (obj_dialogue) {
if string_contains(argument2,"Exit") 
    {
    //Exit dialog
    instance_destroy()
    exit
    }
    
    
if string_contains(argument2,"Message")
{
    //Loading all of the different parts of the speech page: Text, answers, skill checks, etc.
    //Refer to manual to see a visual grid of which variables come from where!
    message =ds_grid_get(dia_grid,0,0)//Message text
    dia_numanswers= ds_grid_get(dia_grid,1,0)
    ds_list_clear(answerList);
    
    n=0
    while n < 10
    {
    answerList[| n] = ds_grid_get(dia_grid,n,1);//populates the ds_list with progression
    dia_answer[n]=ds_grid_get(dia_grid,n,1)//Answer text
    dia_dest[n]=ds_grid_get(dia_grid,n,8)//Answer destination, if picked
    dia_req1[n]=ds_grid_get(dia_grid,n,2)//Skill checks
    dia_req2[n]=ds_grid_get(dia_grid,n,3)
    dia_req3[n]=ds_grid_get(dia_grid,n,4)
    dia_trigger1[n]=ds_grid_get(dia_grid,n,5)//Triggers
    dia_trigger2[n]=ds_grid_get(dia_grid,n,6)
    dia_trigger3[n]=ds_grid_get(dia_grid,n,7)
    
    
    n+=1
    }
    justPressed = true;
    obj_console.console += string(message) + "#";
}
}
ini_close()

