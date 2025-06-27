//Dexter's Laboratory: Mandark's Lab ASL
//Supports load remover, auto split and auto start

//emu-help tool created by jujstme - https://github.com/Jujstme
//emu-help scripts by TheDementedSalad, addresses and functions by Spyran and Shad0wofeden

state("LiveSplit") {}

startup
{
    // Memory addresses/pointers found using https://retroachievements.org/codenotes.php?g=17768
    Assembly.Load(File.ReadAllBytes("Components/emu-help-v3")).CreateInstance("PS1");
            vars.Loading = vars.Helper.Make<byte>(0x8003103E);
            vars.LevelName = vars.Helper.MakeString(20, 0x8008f274);
            vars.MenuValue = vars.Helper.Make<int>(0x800aa4a4);
            vars.CurrentMovie = vars.Helper.MakeString(20, 0x801ffee8);
            vars.CurrentMovieValue = vars.Helper.Make<int>(0x801ffee8);
}

update
{
    //1 = Loading, 0 = Not Loading
    //print(vars.Loading.Current.ToString());

    if (vars.LevelName.Current != vars.LevelName.Old){
        print("Level Name Change: " + vars.LevelName.Old.ToString() + " -> " + vars.LevelName.Current.ToString());
    }
    
        //print("Menu Value = " + vars.MenuValue.Current.ToString());
    if (vars.CurrentMovie.Current != vars.CurrentMovie.Old){
        print("Current Movie Change: " + vars.CurrentMovieValue.Old.ToString() + " -> " + vars.CurrentMovieValue.Current.ToString());
    }


}


start
{   
    
    // Below code starts the timer when the opening video plays, which isn't immediately after pressing New Adventure. Set 'Start Timer at:' in LiveSplit to 0.5
    return(vars.CurrentMovie.Current == "E_SEG1.STR");
}

split
{
    return(
        // Dee-Dee's Dance Off
        (vars.LevelName.Current == "Lobby1" && vars.LevelName.Old == "DDDance") ||
        //Cootie Call
        (vars.LevelName.Current == "Lobby1" && vars.LevelName.Old == "Cootie") ||
        //What's Buggin Dexter?
        (vars.LevelName.Current == "Lobby2" && vars.LevelName.Old == "Buggin") ||
        //Up 'N' Atom
        (vars.LevelName.Current == "Lobby2" && vars.LevelName.Old == "UNA") ||
        //Soapbox Derby
        (vars.LevelName.Current == "Lobby3" && vars.LevelName.Old == "Soapbox") ||
        //Molecular Mix Off
        (vars.LevelName.Current == "Lobby4" && vars.LevelName.Old == "MixInIt") ||
        //Sub Zero Hero
        (vars.LevelName.Current == "Lobby4" && vars.LevelName.Old == "HotSauce") ||
        //Final Movie
        (vars.CurrentMovieValue.Current == 1179 && vars.LevelName.Current == "Lobby4")


    );
}

isLoading
{
    if(vars.Loading.Current == 1){
        return true;
    } else {
        return false;
    }
}
