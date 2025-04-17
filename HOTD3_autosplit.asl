state("hod3pc")
{
    int chapterNumber: 0x0000656C, 0x0;
    int menuValue: 0x003DE800, 0x64, 0xC8C;
    float IGT: 0x00310D58, 0x234;
}

start 
{
    if(current.menuValue != 0 && old.menuValue == 1){
        return true;
    }
}

split
{
    if(current.chapterNumber > old.chapterNumber){
        return true;
    }
}

reset
{
 if(current.menuValue == 0){
        return true;
    }
}

isLoading{
    if(current.IGT == old.IGT){
        return true;
    } else {
        return false;
    }
}
