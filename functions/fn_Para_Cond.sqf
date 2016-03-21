/**********Parachute Condition check*********
Function to return boolean based on if it`s good to add the action to open a parachute.
Called from Parah_EH.sqf when getOut EH is triggered.


Arguments:
0: Unit

Usage:
[_unit] call RG_fnc_Para_Cond

Return Value:
Boolean
*/
_unit = _this select 0;
if ((local _unit) && (_unit == player) && !(isTouchingGround _unit) && !(backpack _unit == "B_Parachute") && ((getPosATL _unit select 2) > 30) && (alive _unit)) then {true} else {false};