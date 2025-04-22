state("hod3pc")
{
    int chapterNumber: "hod3pc.exe", 0x3B8B60;
    byte menuValue: "hod3pc.exe", 0x366748;
    float IGT: "hod3pc.exe", 0x3B7FF4;
    int boss5Death: "hod3pc.exe", 0x306FD0;
    int roomboss5: "hod3pc.exe", 0x306FA0;
}

start 
{
   return current.menuValue == 1 && old.menuValue == 0;
}

split
{
    return( 
        (current.chapterNumber != old.chapterNumber) ||
        (current.chapterNumber == 5 && current.boss5Death < 1 && old.boss5Death > 1)
    );
    
}

reset
{
    return current.menuValue == 0 && old.menuValue == 1;
}

isLoading
{
    if(current.IGT == old.IGT){
        return true;
    } else {
        return false;
    }
}

