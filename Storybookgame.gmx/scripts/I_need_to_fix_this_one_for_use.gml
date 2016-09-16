///scr_after(substr1, substr2, str)
{
    if (string_pos(substr1, str) > string_pos(substr2, str))
    {
        return true;
    }
    else
    {
        return false;
    }
}
    

