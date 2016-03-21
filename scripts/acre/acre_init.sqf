sleep 10;//sleep a while so that all is good

//check that acre is running
if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {

//Get settings from init.sqf 
_TERRAIN_LOSS = _this select 0;
_TERRAIN_LOSS_VAL = _this select 1;
_INGAME_MESSAGES = _this select 2;
_RETRANS = _this select 3;

//Do it, do iit!
if (_TERRAIN_LOSS==1) then {

[_TERRAIN_LOSS_VAL] call acre_api_fnc_setLossModelScale;

} else {
[0] call acre_api_fnc_setLossModelScale;
};

if (_INGAME_MESSAGES==1) then {
execVM "scripts\acre\disable_ingame_messages.sqf";
};

if (_RETRANS==1) then {
execVM "scripts\acre\retrans.sqf";
};

};