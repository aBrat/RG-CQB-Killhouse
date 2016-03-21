//These scripts will be executed on CLIENTS & SERVER

//Disable that annoying saving stuff I hate so much
enableSaving[false,false];

//[] execVM "scripts/mission/loadouts.sqf"; //Needs to be in initPlayerLocal.sqf

/* - Disabled, re-enable if needed for anything
[//setSkillz & nvg removal & GPS adder, looper designed for ALiVE & Zeus by eRazeri
0,//AI Skill settings, check the script for the exact skill settings
1,//Opfor nvg removal
0,//Blufor nvg removal
0,//RG nvg removal
0,//Add GPS to player if he hasnt got one
0,//Enable rpt logging
0 //Enable Extensive Skill rpt logging for debugging etc
] execVM "scripts\difficulty\AI_and_player_difficulty.sqf";
*/

/*
//Causes issues at the moment - Helios
[//ACRE customization
1,//Enable terrain loss, default 1
0.5,//Terrain loss value, suggested value 0.5, default is 1
1,//Disable in game automatic messages, suggested value 1
0//Enable retransmission network, depends on if you have antennas on the mission and want to use them. DISABLED because not yet implemented in ACRE2!!!
] execVM "scripts\acre\acre_init.sqf";
*/

/*
//if (isServer) then 
//{
//		//CuratorModule = your curator module name; true = boolean, if civilians should be editable by zeus as well.
//	//[GC1,true] execVM "ADV_zeus.sqf";
//};
//
//if (isServer) then 
//{
//		//CuratorModule = your curator module name; true = boolean, if civilians should be editable by zeus as well.
//	[Admin_aBrat_1,true] execVM "ADV_zeus.sqf";
//"colorCorrections" ppEffectAdjust [2, 30, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
//"colorCorrections" ppEffectCommit 0;
//"colorCorrections" ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];
//"colorCorrections" ppEffectAdjust [1, 0.8, -0.001, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]];  
//"colorCorrections" ppEffectCommit 3;
//"colorCorrections" ppEffectEnable true;
//"filmGrain" ppEffectEnable true; 
//"filmGrain" ppEffectAdjust [0.02, 1, 1, 0.1, 1, false];
//"filmGrain" ppEffectCommit 3;
//};
*/