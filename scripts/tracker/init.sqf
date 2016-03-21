//RG task force tracker init
//USER DELETED//
if (hasInterface) then {

//Array
_tracker_init_classnames = execVM "scripts\tracker\classnames_to_track.sqf";
waitUntil {sleep 0.1; scriptDone _tracker_init_classnames;};

//Init only for those who would be able to use it
if ((typeOf player) in RG_tracker_classnames_to_track) then {

//Map
execVM "scripts\tracker\map.sqf";
sleep .1;

//GPS
execVM "scripts\tracker\GPS.sqf";
sleep .1;
};
};