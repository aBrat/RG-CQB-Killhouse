_heli = _this select 0;





////////////////////////////////////////////////
//////////////////// server ////////////////////
////////////////////////////////////////////////

if (isServer) then {
	waitUntil {!isNull _heli};
  
	_heli setVariable ["lightStatus", "off", true]; // by default, the light is turned off
	_heli setVariable ["gunner", nil, true]; // seems "gunner _heli" doesn't works so this variable is used to store the co-pilot when this one get in
};

if !(hasInterface) exitWith {};

////////////////////////////////////////////////
//////////////////// lights ////////////////////
////////////////////////////////////////////////

// create lights objects on player connection
Z_fnc_clientCreateLightsObjects_wildcat = {
	private ["_heli", "_lights", "_lightsPositions", "_light", "_lightParams", "_brightness", "_color"];
	
	_heli = _this select 0;
	_lights = [];
	_lightsPositions = [[0, 2, 0.6]];
	
	{
		_light = "#lightpoint" createVehicleLocal getPos _heli;
		[_lights, _light] call BIS_fnc_arrayPush;
		_light attachTo [_heli, _x];
		_light setLightAttenuation [0.5, 0, 20, 40];//[1, 0, 0, 7.5]
	} forEach _lightsPositions;
	
	_heli setVariable ["lights", _lights, false];
	
	[_heli, _heli getVariable "lightStatus"] call Z_fnc_clientSetLightColor;
	
	_lights
};

////////////////////////////////////////////////
//////////////////// client ////////////////////
////////////////////////////////////////////////

waitUntil {!isNull player};
waitUntil {!isNull _heli};

_heli setVariable ["lightActionsToRemove", [], false];
_heli setVariable ["signalActionsToRemove", [], false];


waitUntil {
	sleep 0.1;
	_var = _heli getVariable "lightStatus";
	!isNil "_var";
};

//_lights = [_heli] call Z_fnc_clientCreateLightsObjects_wildcat;





/////////////////////////////////////////////////
//////////////////// actions ////////////////////
/////////////////////////////////////////////////


// on get in
_heli addEventHandler ["GetIn", {
	_heli = _this select 0;
	_pos = _this select 1;
	_unit = _this select 2;
	
	if (local _unit) then {
		_lightStatus = _heli getVariable "lightStatus";
		
		if (_pos == "driver" || _pos == "gunner") then {
			if (_heli getVariable "doorActionsStatus" in ["open", "drop"] && isPlayer _unit) then {
				[_heli, _doorStatus] spawn Z_fnc_clientCargoRampSoundForCrew;
			};
			
			if (_pos == "gunner") then {
				_heli setVariable ["gunner", _unit, true];
			};
			
			//[_unit, _heli, "off"] call Z_fnc_clientCreateLightAction;
			//[_unit, _heli, "white"] call Z_fnc_clientCreateLightAction;
			//[_unit, _heli, "red"] call Z_fnc_clientCreateLightAction;
			//[_unit, _heli, "green"] call Z_fnc_clientCreateLightAction;
			
			//[_unit, _heli, "prepare"] call Z_fnc_clientCreateSignalAction;
			//[_unit, _heli, "go"] call Z_fnc_clientCreateSignalAction;
      [_unit, _heli, "attention"] call Z_fnc_clientCreateSignalAction;
		} else {
			_id = _unit addAction [
				["getOut"] call Z_fnc_actionText,
				"call Z_fnc_getOutCargoRamp",
				[_heli],
				6.15,
				true,
				true,
				"",
				"
					if(vehicle _target getVariable 'doorStatus' == 'open') then {
						getPos (vehicle _target) select 2 < 40 && speed (vehicle _target) < 50
					}
				"
			];
			
			[_heli, _id, "doorActionsToRemove"] call Z_fnc_updateActionsToRemoveArray;
				
			// jump
			_id = _unit addAction [
				["jump"] call Z_fnc_actionText,
				"call Z_fnc_getOutCargoRamp",
				[_heli],
				6.15,
				true,
				true,
				"",
				"
					if(vehicle _target getVariable 'doorStatus' == 'drop') then {
						getPos (vehicle _target) select 2 >= 100
					}
				"
			];
			
			[_heli, _id, "doorActionsToRemove"] call Z_fnc_updateActionsToRemoveArray;
			
		};
	};	
}];

// on get out, remove actions
_heli addEventHandler ["GetOut", {
	_heli = _this select 0;
	_pos = _this select 1;
	_unit = _this select 2;
	
	if (local _unit) then {
		if (_pos == "gunner") then {
			_heli setVariable ["gunner", nil, true];
		};
		
		[_unit, _heli, "doorActionsToRemove"] call Z_fnc_clientRemoveAllActions;
		[_unit, _heli, "lightActionsToRemove"] call Z_fnc_clientRemoveAllActions;
		[_unit, _heli, "signalActionsToRemove"] call Z_fnc_clientRemoveAllActions;
	};
}];

// delete everything when chopper get destroyed
  _heli addEventHandler ["Killed", {
	_heli = _this select 0;
	_ligths = _heli getVariable "lights";
	
	{
		deleteVehicle _x;
	} forEach _ligths;
	
	[player, _heli, "doorActionsToRemove"] call Z_fnc_clientRemoveAllActions;
	[player, _heli, "lightActionsToRemove"] call Z_fnc_clientRemoveAllActions;
	[player, _heli, "signalActionsToRemove"] call Z_fnc_clientRemoveAllActions;
}];

// delete lights if chopper get removed
if (hasInterface) then {
	waitUntil {sleep 15; isNull _heli};
	
	//{
	//	deleteVehicle _x;
	//} forEach _lights;
	
	//player removeEventHandler ["killed", _playerEventHandler];
};