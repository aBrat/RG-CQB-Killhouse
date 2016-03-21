//These scripts will be executed only on a CLIENT not HC
if (hasInterface) then {

//Execute and load briefing
execVM "briefing.sqf";

//makes players to wait for being initialized
waitUntil { sleep 0.01; !isNull player && isPlayer player };

//Admin commands 
execVM "scripts\Admin\init.sqf"; 

//RG Task Force Tracker
execVM "scripts\tracker\init.sqf";

//CCIP Script, this is important for the RG Warthog to be usable! (turn on only if needed)
//execVM "scripts\ccip\init.sqf";

//Mine detector script
execVM "scripts\mineDetector\mineDetector.sqf";

//Assigns RG insignia to the units
execVM "scripts\insignia\insignia.sqf";

//Assigns Custom loadouts to preset characters
//execVM "scripts\mission\loadouts.sqf"

};//END