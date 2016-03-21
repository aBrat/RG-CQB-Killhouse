// [EVO] Dan's vehicle respawn script
// Its very basic, but that should hopefully improve performance
// Takes into account changes that have been made to the scripting library
// Will run only on the server, as it only needs to run in one place, but obviously can be used in both singleplayer and multiplayer
//put this in init: 0 = [this,10] execVM "vehicle_respawn.sqf";
//put this in init: 0 = [this] execVM "vehicle_respawn.sqf";

_vehicle = _this select 0; //get vehicle's details
//_respawntime = _this select 1; //get the init set respawn time
_respawntime = 300; //manually set respawn time
_facingofvehicle = getDir _vehicle; //get original facing
_positionofvehicle = getPosATL _vehicle; //get original position
_vehicletype = typeOf _vehicle; //get the vehicle type
_n = 1;

if(isServer) then{
	while{_n == 1} do{
		if(!alive _vehicle) then { //true if vehicle is not alive
			sleep _respawntime; // respawn time between deletion and then respawn
			_vehicle = _vehicletype createVehicle _positionofvehicle; // create a new vehicle of same type at starting position
			_vehicle setPosATL _positionofvehicle; //set correct position
			_vehicle setDir _facingofvehicle; //set correct facing of the vehicle
			[[[_vehicle,_respawntime],"scripts\f18\f18e_init.sqf"],"BIS_fnc_execVM",false,false] spawn BIS_fnc_MP; //replacement for the old setVehicleInit, this does the same and causes the new vehicle to have the respawn script when created
			_n = 0; // break out condition
		};
		sleep 20; //def 60, sleep for a bit in order to reduce processing calls (increase this to whatever you like, longer gives better performance but also increases response delay)
	};
};