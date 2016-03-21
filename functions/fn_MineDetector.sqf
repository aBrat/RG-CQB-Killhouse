/**********RG_fnc_MineDetector*********
Main MineDetector function, adds actual functionality to having a minedetector on person.


Arguments:
none

Usage:
[] spawn RG_fnc_MineDetector;

Return Value:
none
*/
RG_mineDetector_enabled = true;
RG_mineDrawHandlerAdded = false;

while{("MineDetector" in items player || secondaryWeapon player == "MineDetector") && RG_mineDetector_enabled && alive player} do {
RG_MinesNear = call RG_fnc_MinesNear;
while{(count RG_MinesNear > 0) && RG_mineDetector_enabled && alive player && ("MineDetector" in items player || secondaryWeapon player == "MineDetector")} do {
RG_MinesNear = call RG_fnc_MinesNear;
{
if (random (player distance _x) < 0.5) then {
playSound "ReadoutClick"; 
};
} forEach RG_MinesNear;

if (!RG_mineDrawHandlerAdded) then {
["RG_fnc_MineDrawHandler", "onEachFrame", {
{
_x call RG_fnc_MineDrawIcon3D;
} forEach RG_MinesNear;
}] call BIS_fnc_addStackedEventHandler;
RG_mineDrawHandlerAdded = true;
};
sleep 0.01;
};
if (RG_mineDrawHandlerAdded) then {
["RG_fnc_MineDrawHandler", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
RG_mineDrawHandlerAdded = false;
};
sleep 2;
};
RG_MinesNear = [];
RG_mineDetector_enabled = false;
