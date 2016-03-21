_heli = _this select 0;


////////////////////////////////////////////////
//////////////////// server ////////////////////
////////////////////////////////////////////////

if (isServer) then {
	waitUntil {!isNull _heli};
	
	_heli setVariable ["doorActionsStatus", "closed", true]; // action var, don't need to wait the ramp to be in the specified position to hide the action (drop position, open position)
	_heli setVariable ["doorStatus", "closed", true]; // by default, the cargo ramp is closed
	_heli setVariable ["lightStatus", "off", true]; // by default, the light is turned off
	_heli setVariable ["gunner", nil, true]; // seems "gunner _heli" doesn't works so this variable is used to store the co-pilot when this one get in
};

if !(hasInterface) exitWith {};

////////////////////////////////////////////////////
//////////////////// cargo ramp ////////////////////
////////////////////////////////////////////////////

// create cargo ramp action
Z_fnc_clientCreateCargoRampAction_merlin = {
	private ["_unit", "_heli", "_doorStatus", "_condition", "_id"];
	
	_unit = _this select 0;
	_heli = _this select 1;
	_doorStatus = _this select 2;
	_condition = format ["vehicle _target getVariable 'doorActionsStatus' != '%1'", _doorStatus];
	
	_id = _unit addAction [
		[_doorStatus] call Z_fnc_actionText,
		"call Z_fnc_clientCargoRampManager_merlin",
		[_heli, _doorStatus],
		6.12,
		false,
		true,
		"",
		_condition
	];
	
	[_heli, _id, "doorActionsToRemove"] call Z_fnc_updateActionsToRemoveArray;
};

// set cargo ramp position
Z_fnc_clientCargoRampManager_merlin = {
	private ["_unit", "_heli", "_doorStatus"];
	
	_unit = _this select 1;
	_heli = (_this select 3) select 0;
	_doorStatus = (_this select 3) select 1;
	
	[_heli, _doorStatus] call Z_fnc_clientCargoRampAnimation_merlin;
};

// cargo ramp animation
Z_fnc_clientCargoRampAnimation_merlin = {
	private ["_heli", "_doorStatus", "_crew", "_sleep"];

	_heli = _this select 0;
	_doorStatus = _this select 1;

	if (_doorStatus == "closed") then {
		_heli animate ["CargoRamp_Open", 0];
		_heli setVariable ["doorActionsStatus", "closed", true];
		_heli setVariable ["doorStatus", "closed", true];
	};
	
	if (_doorStatus == "drop") then {
		_heli animate ["CargoRamp_Open", 0.6];
		_heli setVariable ["doorActionsStatus", "drop", true];
		
		//_crew = [_heli] call Z_fnc_clientGetCrew;
		//[[_heli, _doorStatus], "Z_fnc_clientCargoRampSoundForCrew", _crew, false] spawn BIS_fnc_MP;
		
		//_sleep =  abs ((0.6 - (_heli animationPhase "CargoRamp_Open")) * 5) + 0.5;
		//sleep _sleep;
    waitUntil {sleep .1;_heli animationPhase "CargoRamp_Open" == 0.6};
		
		if (_heli animationPhase "CargoRamp_Open" == 0.6) then {
			_heli setVariable ["doorStatus", "drop", true];
		};
	};
	
	if (_doorStatus == "open") then {
		_heli animate ["CargoRamp_Open", 1];
		_heli setVariable ["doorActionsStatus", "open", true];
		
		//_crew = [_heli] call Z_fnc_clientGetCrew;
		//[[_heli, _doorStatus], "Z_fnc_clientCargoRampSoundForCrew", _crew, false] spawn BIS_fnc_MP;
		
		//_sleep = (5 - ((_heli animationPhase "CargoRamp_Open") * 5)) + 0.5;
		//sleep _sleep;
		waitUntil {sleep .1;_heli animationPhase "CargoRamp_Open" == 1};
    
		if (_heli animationPhase "CargoRamp_Open" == 1) then {
			_heli setVariable ["doorStatus", "open", true];
		};
	};
};

////////////////////////////////////////////////
//////////////////// lights ////////////////////
////////////////////////////////////////////////

// create lights objects on player connection
Z_fnc_clientCreateLightsObjects_merlin = {
	private ["_heli", "_lights", "_lightsPositions", "_light", "_lightParams", "_brightness", "_color"];
	
	_heli = _this select 0;
	_lights = [];
	_lightsPositions = [[0, -1.3, -0.41], [0, 1.735, -0.41]];
	
	{
		_light = "#lightpoint" createVehicleLocal getPos _heli;
		[_lights, _light] call BIS_fnc_arrayPush;
		_light attachTo [_heli, _x];
		_light setLightAttenuation [0.5, 0, 10, 50];
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

_heli setVariable ["doorActionsToRemove", [], false];
_heli setVariable ["lightActionsToRemove", [], false];
_heli setVariable ["signalActionsToRemove", [], false];

waitUntil {
	sleep 0.1;
	_var = _heli getVariable "doorActionsStatus";
	!isNil "_var";
};

waitUntil {
	sleep 0.1;
	_var = _heli getVariable "doorStatus";
	!isNil "_var";
};

waitUntil {
	sleep 0.1;
	_var = _heli getVariable "lightStatus";
	!isNil "_var";
};

_lights = [_heli] call Z_fnc_clientCreateLightsObjects_merlin;





/////////////////////////////////////////////////
//////////////////// actions ////////////////////
/////////////////////////////////////////////////

// get in using cargo ramp action
_id = _heli addAction [
	["getIn"] call Z_fnc_actionText,
	"player action ['GetInCargo', (_this select 3) select 0]",
	[_heli],
	6,
	true,
	true,
	"",
	"
		if (_target distance player < 10) then {
			[_target, player] call Z_fnc_ifPlayerIsNearFromChopper
		}
	"
];

// on get in
_heli addEventHandler ["GetIn", {
	_heli = _this select 0;
	_pos = _this select 1;
	_unit = _this select 2;
	
	if (local _unit) then {
		_doorStatus = _heli getVariable "doorStatus";
		_lightStatus = _heli getVariable "lightStatus";
		
		if (_pos == "driver" || _pos == "gunner") then {
			if (_heli getVariable "doorActionsStatus" in ["open", "drop"] && isPlayer _unit) then {
				[_heli, _doorStatus] spawn Z_fnc_clientCargoRampSoundForCrew;
			};
			
			if (_pos == "gunner") then {
				_heli setVariable ["gunner", _unit, true];
			};
			
			[_unit, _heli, "closed"] call Z_fnc_clientCreateCargoRampAction_merlin;
			[_unit, _heli, "drop"] call Z_fnc_clientCreateCargoRampAction_merlin;
			[_unit, _heli, "open"] call Z_fnc_clientCreateCargoRampAction_merlin;
			
			[_unit, _heli, "off"] call Z_fnc_clientCreateLightAction;
			[_unit, _heli, "red"] call Z_fnc_clientCreateLightAction;
			
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
			
			// get out to the left side
			_id = _unit addAction [
				["getOutLeft"] call Z_fnc_actionText,
				"call Z_fnc_getOutLeftCargoRamp",
				[_heli],
				6.2,
				false,
				true,
				"",
				"getPos (vehicle _target) select 2 < 10 && speed (vehicle _target) < 20"
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
	
	{
		deleteVehicle _x;
	} forEach _lights;
	
	//player removeEventHandler ["killed", _playerEventHandler];
};