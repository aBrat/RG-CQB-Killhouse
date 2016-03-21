/**********RG_fnc_MinesNear*********
A quick function to check for mines nearby and return an array of them


Arguments:
none

Usage:
_array = call RG_fnc_MinesNear;

Return Value:
Array - Contains a list of all mines & explosives in a 30 meter radius from player position
*/
_detected_mines_array = getPosATL player nearObjects ["MineGeneric",15];
_detected_mines_array = _detected_mines_array + (getPosATL player nearObjects ["BoundingMineBase",20]); 
_detected_mines_array = _detected_mines_array + (getPosATL player nearObjects ["DirectionalBombBase",25]); 
_detected_mines_array = _detected_mines_array + (getPosATL player nearObjects ["PipeBombBase",25]); 
_detected_mines_array;
