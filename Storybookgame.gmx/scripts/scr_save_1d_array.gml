///scr_save_1d_array(array_name, section, array_key_str)
//converts a 1d array into a list, saves the list in the open ini as a string
//assumes ini is already opened
var array_name = argument0; //name of our array to save
var array_section = argument1;
var array_key_str = argument2; //str to use as key to save a retriue3v
var length; //length of array
var temp_list_name; //temp list name
var i; //loop
var temp_list_str; //stores the list string

length = array_length_1d(array_name); //get length of 1d array
temp_list = ds_list_create(); //temp list to store array so we can write it

//output the array to a list
for (i = 0; i < length; i += 1) //global.gridWidth
  {
  ds_list_add(temp_list, array_name[i]); //add each array value to list in turn up to array length
  }

//convert the list to a str for saving in ini
temp_list_str = ds_list_write(temp_list);

//save the string as per arguments - note the INI MUST ALREADY BE OPEN
ini_write_string(array_section, array_key_str, temp_list_str);

ds_list_destroy(temp_list); //we are done with the list now, destroy
