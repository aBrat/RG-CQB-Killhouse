//Parachute script
//Author: eRazeri

//Only needs to be runned on clients
if(hasInterface)then{

//Vehicle the EH gets attached to
_veh = _this select 0;

//Check for the vehicle so it`s legit to add EH
if (!(_veh isKindOf "Steerable_Parachute_F") && !(_veh isKindOf "NonSteerable_Parachute_F") && !(_veh isKindOf "B_Parachute")) then {

    _veh addEventHandler ["Killed", {_veh removeAllEventHandlers "GetOut"; _veh removeAllEventHandlers "Killed";}];
    _veh addEventHandler ["GetOut", {
        _unit = _this select 2;
        if ([_unit] call RG_fnc_Para_Cond) then {
            parachute_Action = _unit addAction["Open parachute",{[player] spawn RG_fnc_Para_Deploy;}, nil, 9999, false, true,"","_target == _this"];
            para_action_active = true;

            //What goes up must come down
            [_unit] spawn {
                _unit = _this select 0;
                waitUntil {sleep 1; ((isTouchingGround _unit) || !(alive _unit));};
                if (para_action_active) then {
                    _unit removeAction parachute_Action;
                    para_action_active = false;
                };
            };
        };
    }];
};
};