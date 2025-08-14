//The House of the Dead 2 ASL
//Supports load remover, auto split and auto start

//Addresses and functions by Spyran

//Game should be restarted each time you wish to use the autosplitter

state("hod2")
{
    //74 = Arcade Mode | 6 = Original Mode
    int gameStart: "hod2.exe", 0x3DA3F8;

    int chapterChange: "hod2.exe", 0x5780B0;
    int HoldYourFire: "hod2.exe", 0x003DB4, 0x55c;
    int FinalRoom: "hod2.exe", 0x5C7D30;
    float BossHP: "hod2.exe", 0x3C2338;
    
}

start 
{
   return( 
        (current.gameStart == 74) ||
        (current.gameStart == 6)
    );
}

split
{
    return( 
        (current.chapterChange != old.chapterChange) ||
        (current.FinalRoom == 4 && current.BossHP < 1 && old.BossHP > 1)
    );
}

/*
Load remover currently inactive as the leaderboard does not use it for timing

isLoading
{
    if(current.HoldYourFire == 0){
        return true;
    } else {
        return false;
    }
} */



