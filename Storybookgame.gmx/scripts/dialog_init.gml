///dialog_init(file,section)
//This is the same as dialog_load, but it always loads the first item in a dialog tree
ini_open(working_directory+"assets\dialogue\"+argument0)
var dia_grid=ds_grid_create(25,9)
var dia_string=ini_read_string(argument1,"Init","")
ds_grid_read(dia_grid,dia_string);
dia_dest[0]=ds_grid_get(dia_grid,2,0);
dialog_load(argument0,argument1,dia_dest[0]);

ini_close()

