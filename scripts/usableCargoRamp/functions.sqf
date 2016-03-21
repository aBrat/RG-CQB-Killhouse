/*
	script name:		Usable Cargo Ramp fo CH-49 Mohawk
	description:		Open and close the cargo ramp, get in and get out using cargo ramp (action menu). Adds lights audio signals in the cargo compartment, for parachuting (or whatever you want). Adds the "get out to the left side action.
	version:			v2.3
	author:				Zigomarvin
	official thread:	http://forums.bistudio.com/showthread.php?169340-Usable-cargo-ramp-for-CH-49-Mohawk
	
	Changelog:
	
	v2.3 - 04/18/2014
		fixed a bug produced buy the previous fix...
	
	v2.2 - 04/18/2014
		fixed a bug
	
	v2.1 - 04/16/2014
		New cargo ramp positions: closed, slightly open, drop position, open.
		Pilot can turn on lights of colours or play signal sounds in the cargo compartment.
		Co-pilot now can handle cargo ramp, new lights and new sounds.
		You can get out to the left side.
	
	v2.0 - never released
		New system (no longer ammo box, all in one file, less bugs (maybe no more)...).
	
	v1.1 - 12/05/2013
		FIXED: script wasn't started correctly when the server had many things to load.
		FIXED: "get out" action is no longer removed when the chopper get full.
		Added some priorities in actions.
	
	v1.0 - 12/01/2013
		release
	
	how to use:
		1. if you are already using an older version of this script, remove the "usableCargoRamp" folder which is in "scripts" folder
		2. copy/paste the "scripts" folder in your mission root
		3. open the description.ext and copy the CfgSounds class in your mission description.ext
		4. put this in your CH-49 init field: _n = [this] execVM "scripts\usableCargoRamp\usableCargoRamp.sqf";

   Modified by [RG]eRazeri for different vehicles etc
*/

if !(hasInterface) exitWith {};

player setVariable ["usableCargoRamp_functions_initialized",true,false];



//////////////////////////////////////////////
//////////////////// misc ////////////////////
//////////////////////////////////////////////

// remove all action
Z_fnc_clientRemoveAllActions = {
	private ["_unit", "_veh", "_array", "_actionsToRemove"];
	
	_unit = _this select 0;
	_veh = _this select 1;
	_array = _this select 2;
	
	_actionsToRemove = _veh getVariable _array;
	
	{
		_unit removeAction _x;
	} forEach _actionsToRemove;
	
	_veh setVariable [_array, [], false];
};

// update actions-to-remove array
Z_fnc_updateActionsToRemoveArray = {
	private ["_heli", "_id", "_array", "_actionsToRemove"];
	
	_heli = _this select 0;
	_id = _this select 1;
	_array = _this select 2;
	
	_actionsToRemove = _heli getVariable _array;
	[_actionsToRemove, _id] call BIS_fnc_arrayPush;
	_heli setVariable [_array, _actionsToRemove, false];
};

// check some conditions to add the action
Z_fnc_ifPlayerIsNearFromChopper = {
	private ["_heli", "_player", "_return", "_isWater", "_pos"];
	
	_heli = _this select 0;
	_player = _this select 1;
	_return = false;
	
	if (_heli getVariable 'doorStatus' == 'open' && vehicle _player == _player && _heli emptyPositions 'Cargo' > 0) then {
		_isWater = surfaceIsWater getPos _heli;
		_pos = getPosATL _player;
		
		if (_isWater) then {
			_pos = getPosASL _player;
		};
		
		if ((_heli worldToModel _pos) distance [0, -5, -3.5] < 2.5) then {
			_return = true;
		};
	};
	
	_return
};

// format action text in right language
Z_fnc_actionText = {
	private ["_action", "_language", "_color", "_ramp", "_light", "_signal", "_cargo", "_text"];
	
	_action = _this select 0;
	_language = language;
	_color = "FFFFFF";
	_ramp = "CC2639";
	_light = "EC7724";
	_signal = "90B193";
	_cargo = "28649E";
	_text = "";
	
	switch (_action) do {
		// open
		case "open": {
			_color = _ramp;
			
			switch (_language) do {
				case "French": {_text = "Rampe - ouverte";};
				default {_text = "Cargo ramp - open"};
			};
		};
		
		// drop
		case "drop": {
			_color = _ramp;
			
			switch (_language) do {
				case "French": {_text = "Rampe - position de saut"};
				default {_text = "Cargo ramp - drop position"};
			};
		};
		
		// closed
		case "closed": {
			_color = _ramp;
			
			switch (_language) do {
				case "French": {_text = "Rampe - fermée"};
				default {_text = "Cargo ramp - closed"};
			};
		};
		
		// get in
		case "getIn": {
			_color = _cargo;
			
			switch (_language) do {
				case "French": {_text = "Grimper dans CH-49 Mohawk - par la rampe"};
				default {_text = "Get in using cargo ramp"};
			};
		};
		
		// get out
		case "getOut": {
			_color = _cargo;
			
			switch (_language) do {
				case "French": {_text = "Sortir par la rampe"};
				default {_text = "Get out using cargo ramp"};
			};
		};
		
		// get out to the left side
		case "getOutLeft": {
			_color = _cargo;
			
			switch (_language) do {
				case "French": {_text = "Sortir à gauche"};
				default {_text = "Get out to the left side"};
			};
		};
		
		// jump
		case "jump": {
			_color = _cargo;
			
			switch (_language) do {
				case "French": {_text = "Sauter par la rampe"};
				default {_text = "Jump by cargo ramp"};
			};
		};
		
		// lights off
		case "off": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - éteinte"};
				default {_text = "light - turned off"};
			};
		};
		
		// red light
		case "red": {
			_color = _light;
			
			switch (_language) do {
				case "French": {_text = "Lumière - rouge"};
				default {_text = "Light - red"};
			};
		};
		
		// attention sound
		case "attention": {
			_color = _signal;
			
			switch (_language) do {
				case "French": {_text = "Signal - Attention"};
				default {_text = "Attention"};
			};
		};
	};
	
	format ["<t color='#%1'>%2</t>", _color, _text]
};

Z_fnc_clientCargoRampSoundForCrew = {
	private ["_heli", "_doorStatus", "_missionPath", "_soundPath", "_sleep"];
	
	_heli = _this select 0;
	_doorStatus = _this select 1;
	_missionPath = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
	_soundPath = _missionPath + "scripts\usableCargoRamp\sounds\alarm-ramp.ogg";
	_sleep = if (_doorStatus == "open") then {4} else {2};
	
	while {_heli getVariable "doorActionsStatus" == _doorStatus && vehicle player == _heli && alive _heli} do {
		playSound "alarm_ramp";
		
		sleep _sleep;
	};
};

Z_fnc_clientGetCrew = {
	private ["_heli", "_crew", "_driver", "_gunner"];
	
	_heli = _this select 0;
	_crew = [];
	_driver = driver _heli;
	_gunner = _heli getVariable "gunner";
	
	if (!isNull _driver) then {
		[_crew, _driver] call BIS_fnc_arrayPush;
	};
	
	if (!isNil "_gunner") then {
		[_crew, _gunner] call BIS_fnc_arrayPush;
	};
	
	_crew
};





////////////////////////////////////////////////
//////////////////// lights ////////////////////
////////////////////////////////////////////////

// set light color
Z_fnc_clientSetLightColor = {
	private ["_heli", "_newLightStatus", "_lights", "_lightParams", "_brightness", "_color"];
	
	_heli = _this select 0;
	_newLightStatus = _this select 1;
	_lights = _heli getVariable "lights";
	_lightParams = [_newLightStatus] call Z_fnc_clientLightStatusDecode;
	_brightness = _lightParams select 0;
	_color = _lightParams select 1;
	
	{
		_x setLightBrightness _brightness;
		_x setLightColor _color;
    _x setLightAmbient [0, 0, 0];
    _x setLightDayLight true;
    _x setLightUseFlare true;
		_x setLightFlareSize 0.1;
		_x setLightFlareMaxDistance 200;   
    
	} forEach _lights;
};

// convert light status ("off", "red"...) as light params ([0, [0, 0, 0]], [0.2, [1, 0, 0]]...)
Z_fnc_clientLightStatusDecode = {
	private ["_newLightStatus", "_lightParams"];
	
	_newLightStatus = _this select 0;
	_lightParams = [];
	
	switch (_newLightStatus) do {
		case "white" : {_lightParams = [0.1, [1, 1, 1]]};
		case "red" : {_lightParams = [0.1, [1, 0, 0]]};
		case "green" : {_lightParams = [0.1, [0, 1, 0]]};
		case "off" : {_lightParams = [0, [0, 0, 0]]};
	};
	
	_lightParams
};

// create light action for the pilot (and copilot soon)
Z_fnc_clientCreateLightAction = {
	private ["_unit", "_heli", "_lightStatus", "_lightParams", "_id"];
	
	_unit = _this select 0;
	_heli = _this select 1;
	_lightStatus = _this select 2;
	_condition = format ["vehicle _target getVariable 'lightStatus' != '%1'", _lightStatus];
	
	_id = _unit addAction [
		[_lightStatus] call Z_fnc_actionText,
		"call Z_fnc_clientLightManager",
		[_heli, _lightStatus],
		6.09,
		false,
		true,
		"",
		_condition
	];
	
	[_heli, _id, "lightActionsToRemove"] call Z_fnc_updateActionsToRemoveArray;
};

// light manager
Z_fnc_clientLightManager = {
	private ["_unit", "_heli", "_lightStatus"];
	
	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	_lightStatus = (_this select 3) select 1;
	
	_heli setVariable ["lightStatus", _lightStatus, true];
	[[_heli, _lightStatus], "Z_fnc_clientSetLightColor", nil, false] spawn BIS_fnc_MP;
};





////////////////////////////////////////////////////
//////////////////// cargo ramp ////////////////////
////////////////////////////////////////////////////

// get out using cargo ramp
Z_fnc_getOutCargoRamp = {
	private ["_unit", "_heli", "_d", "_rampOutPos", "_altitude", "_a", "_isWater"];

	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	
	_unit disableCollisionWith _heli;
	_unit action ["Eject", _heli];
	waitUntil {vehicle _unit == _unit};
	
	_d = if ((speed _heli) >= 40) then {1} else {0};
	_a = if ((speed _heli) >= 40) then {3} else {0};
	_rampOutPos = _heli modelToWorld [0, -5 - _d, -3.5 - _a];

	_isWater = surfaceIsWater (getPos _heli);
		
	if (_isWater) then {
		_unit setPosASL _rampOutPos;
	} else {
		_unit setPos _rampOutPos;
	};
	
	_unit setDir ((getDir _heli) + 180);
	_unit enableCollisionWith _heli;
};





///////////////////////////////////////////////
//////////////////// sound ////////////////////
///////////////////////////////////////////////

// create sound action
Z_fnc_clientCreateSignalAction = {
	private ["_unit", "_heli", "_signal", "_condition", "_id"];
	
	_unit = _this select 0;
	_heli = _this select 1;
	_signal = _this select 2;
	
	_id = _unit addAction [
		[_signal] call Z_fnc_actionText,
		"call Z_fnc_clientSignalManager",
		[_heli, _signal],
		6.09,
		false,
		true,
		"",
		""
	];
	
	[_heli, _id, "signalActionsToRemove"] call Z_fnc_updateActionsToRemoveArray;
};

// signal 
Z_fnc_clientSignalManager = {
	private ["_unit", "_heli", "_doorStatus"];
	
	_heli = (_this select 3) select 0;
	_signal = (_this select 3) select 1;
	
	[[_signal], "Z_fnc_clientSignalForCrew", crew _heli, false] spawn BIS_fnc_MP;
};

Z_fnc_clientSignalForCrew = {
	private ["_signal", "_missionPath", "_soundPath"];
	
	_signal = _this select 0;
	_missionPath = [str missionConfigFile, 0, -15] call BIS_fnc_trimString;
	_soundPath = _missionPath + format ["scripts\usableCargoRamp\sounds\alarm-%1.ogg", _signal];
	
	playSound format ["alarm_%1", _signal];
};




//////////////////////////////////////////////////////////////////
//////////////////// get out to the left side ////////////////////
//////////////////////////////////////////////////////////////////

// get out to the left side
Z_fnc_getOutLeftCargoRamp = {
	private ["_unit", "_heli", "_d", "_outPos"];

	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	
	_unit disableCollisionWith _heli;
	_unit action ["Eject", _heli];
	waitUntil {vehicle _unit == _unit};
	
	_outPos = _heli modelToWorld [-3.13187, 4.77741, -3.33367];
	_unit setPosATL _outPos;
	_unit setDir ((getDir _heli) + -90);
	_unit enableCollisionWith _heli;
};
	
// on player killed, eject unit (free the seat) and remove actions
_playerEventHandler = player addEventHandler ["Killed", {
	_unit = _this select 0;
	_veh = vehicle _unit;
	
	if (_veh != _unit
  &&
  (
  (typeOf _veh == "RG_Merlin_CTRG")
  ||
  (typeOf _veh == "RG_Merlin_DS")
  ||
  (typeOf _veh == "RG_Merlin_WD")
  ||
  (typeOf _veh == "C130J_ported")
  ||
  (typeOf _veh == "MV22_ported")
  ||
  (typeOf _veh == "CH_47F_EP1")
  ||
  (typeOf _veh == "RG_Ghosthawk_CTRG")
  ||
  (typeOf _veh == "RG_Ghosthawk_DS")
  ||
  (typeOf _veh == "RG_Ghosthawk_WD")
  ||
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
  )
  && !isnil {_veh getVariable "doorStatus"}) then {

		_unit action ["Eject", _veh];
		
		[_unit, _veh, "doorActionsToRemove"] call Z_fnc_clientRemoveAllActions;
		[_unit, _veh, "lightActionsToRemove"] call Z_fnc_clientRemoveAllActions;
		[_unit, _veh, "signalActionsToRemove"] call Z_fnc_clientRemoveAllActions;
	};
}];
