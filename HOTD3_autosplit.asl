state("hod3pc")
{
    int chapterNumber: 0x0000656C, 0x0;
    int menuValue: 0x001E5040, 0x38, 0x8, 0x84C;
    //float IGT: 0x00310D58, 0x234;
}

start 
{
    if(current.menuValue != 0){
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
