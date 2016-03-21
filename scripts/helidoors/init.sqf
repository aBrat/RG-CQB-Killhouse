//Init made for the helidoors by eRazeri

_veh = _this select 0;

_HelisWithDoors = [
 "RG_Merlin_CTRG",
 "RG_Merlin_DS",
 "RG_Merlin_WD",
 "RG_Ghosthawk_CTRG",
 "RG_Ghosthawk_DS",
 "RG_Ghosthawk_WD",
 "RG_Ghosthawk_NIGHT",
 "B_Heli_Transport_01_F",
 "B_Heli_Transport_01_camo_F",
 "I_Heli_Transport_02_F"
];

if (typeOf _veh in _HelisWithDoors) then {
[_veh] execVM "scripts\helidoors\b2_heliDoors.sqf";
};