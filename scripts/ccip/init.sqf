// CCIP script by Joni Mäkelä, eRazeri kiittää ja kuittaa mahtavasta työstä!
if !(hasInterface) exitWith {}; //only run this on clients

execVM "scripts\ccip\jonimake_ccip.sqf";

_userslist=
    [//list of classnames able to use this script, if left empty, runs on everyone   
    	"RG_PilotLead_DS",
			"RG_PilotJet_DS",
			"RG_PilotHeli_DS",
      "RG_PilotLead_WD",
			"RG_PilotJet_WD",
			"RG_PilotHeli_WD"
    ];

_vehiclelist=
    [//vehicle classnames able to use this script, if left empty, runs on all planes
    "RG_Warthog",
    "B_Plane_CAS_01_F"
    ];

if ((typeOf (vehicle player) in _userslist) || (count _userslist == 0)) then {

    while {true} do {//endless loop


    if ((typeOf (vehicle player) in _vehiclelist) || (((vehicle player) isKindOf "plane") && (count _vehiclelist == 0))) then {

            _plane = (vehicle player);

            _getoutHandleri = _plane addEventHandler ["GetOut", {_this spawn ccip_shutdown}];
            _EngineHandleri = _plane addEventHandler ["Engine", {[(_this select 0), (_this select 1)] spawn ccip_start}];

            if(isPlayer driver _plane) then {
                _handle = [_plane, isEngineOn _plane] spawn ccip_start;
            };

            waitUntil {sleep 3; ((vehicle player) != _plane)};
            
            _plane removeEventHandler ["GetOut", _getoutHandleri];
            _plane removeEventHandler ["Engine", _EngineHandleri];
            _plane spawn ccip_shutdown;
        };
        sleep 10;
    };
};