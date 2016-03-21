//These scripts will be executed only on the SERVER

[ //This is the settings array for qbt optimizer
	[
		// General settings
		10,	    // Time between loops (default 5s)
		false,	// Enable log file
		30,	    // Write to log interval (default 30s)		
		false	  // Enable debug
	],

	[
		// Server settings, these are runned only on server side, -1 to disable feature
		600,	// WeaponHolder stay time		
		-1,	// Immobile/destroyed vehicle stay time 1200		
		-1,		// Dead body stay time 600		
		-1,	// Explosive stay time, Disabled for AGM Explosives (v.93) to work properly		
		-1,	// Mine stay time, Disabled for AGM Explosives (v.93) to work properly			
		600,	// Chemlight (& SmokeShell) stay time (class SmokeShell includes chemlights as well)		
		-1    // Disable unneeded AI features (FSM) distance from nearest player
	],

	[
		// Client settings, these are runned only on client side, -1 to disable feature		
		-1,	// Player & AI simulation distance, stops updating locations on clients -> messes up with acre comms & ctab
		-1	// Distance where to find static objects to disable simulation of (qbt recommends 500), increase to save bandwidth, beware of issues it might cause
	]
] execVM "scripts\qbt_optimizer.sqf";



//Add an EH that runs when player disconnects from the server
_EH_HandleDisconnect = addMissionEventHandler ["HandleDisconnect",{

_unit = _this select 0;//Object
_id =   _this select 1;//Number
_uid =  _this select 2;//String
_name = _this select 3;//String

//Delete the unit the player used to occupy
deleteVehicle _unit;
}];


//Spawns a code to loop every 5 minutes to delete ammoboxes that have fallen trough the ground
//This is a fix for the wreckmanager not deleting them.
[] spawn {
while{true}do{
sleep 300;
{
if ((getPosATL _x select 2) < -10) then{
_veh = _x;
{_veh removeAllEventHandlers _x} forEach (missionNamespace getVariable "qbt_optimize_cfg_arrEventHandlers");
{_veh removeAllMPEventHandlers _x} forEach (missionNamespace getVariable "qbt_optimize_cfg_arrMPEventHandlers");
deletevehicle _veh;
}; 
sleep 0.1;//Sleep between runs to not eat performance
} forEach vehicles;
};
};