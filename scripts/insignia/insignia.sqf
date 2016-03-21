//Assigns RG insignia to the unit if conditions are met

_uid = getPlayerUID player;

private ["_uid"];


if (hasInterface) then {

_playerInsigniaRespawn = player addEventHandler ["Respawn", { _this execVM "scripts\insignia\onPlayerRespawn.sqf";}];

[[player, "RealityGaming"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP;


 sleep 2;

if (_uid == "76561198130725681") then { [[player, "RG_P_Helios"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197961235764") then { [[player, "RG_P_Doolz"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198052752160") then { [[player, "RG_P_Abrat"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197997404957") then { [[player, "RG_P_Zepplin1"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198027156344") then { [[player, "RG_P_Icarus"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197960768688") then { [[player, "RG_P_Veged"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197970724251") then { [[player, "RG_P_Blackheart"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198093562000") then { [[player, "RG_P_Villhelm"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197994097572") then { [[player, "RG_P_Andrews"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198032511782") then { [[player, "RG_P_Ninja"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198018760253") then { [[player, "RG_P_Lao"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198128427489") then { [[player, "RG_P_Elementz"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561197967022182") then { [[player, "RG_P_Squeaks"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };
if (_uid == "76561198070612855") then { [[player, "RG_P_Jonas"], "BIS_fnc_setUnitInsignia", nil, true, true] call BIS_fnc_MP; };


};