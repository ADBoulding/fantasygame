///scr_lChange(newLocal)
///Changes the location your player is in
global.previousL = global.location;
global.location = newLocal;
global.lStuff = "main";
scr_runRoom(newLocal);

