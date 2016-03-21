//Init made for the cargo ramp thingy by eRazeri
_veh = _this select 0;

if (
(typeOf _veh == "RG_Merlin_CTRG")
||
(typeOf _veh == "RG_Merlin_DS")
||
(typeOf _veh == "RG_Merlin_WD")
) then {
if (isNil {player getVariable "usableCargoRamp_functions_initialized"}) then {
execVM "scripts\usableCargoRamp\functions.sqf";
};
[_veh] execVM "scripts\usableCargoRamp\merlin.sqf";
};

if (
(typeOf _veh == "RG_Ghosthawk_CTRG")
||
(typeOf _veh == "RG_Ghosthawk_DS")
||
(typeOf _veh == "RG_Ghosthawk_WD")
) then {
if (isNil {player getVariable "usableCargoRamp_functions_initialized"}) then {
execVM "scripts\usableCargoRamp\functions.sqf";
};
[_veh] execVM "scripts\usableCargoRamp\ghosthawk.sqf";
};

if (
(typeOf _veh == "RG_Wildcat_CTRG")
||
(typeOf _veh == "RG_Wildcat_DS")
||
(typeOf _veh == "RG_Wildcat_WD")
||
(typeOf _veh == "RG_Wildcat_unarmed_CTRG")
||
(typeOf _veh == "RG_Wildcat_unarmed_DS")
||
(typeOf _veh == "RG_Wildcat_unarmed_WD")
) then {
if (isNil {player getVariable "usableCargoRamp_functions_initialized"}) then {
execVM "scripts\usableCargoRamp\functions.sqf";
};
[_veh] execVM "scripts\usableCargoRamp\wildcat.sqf";
};