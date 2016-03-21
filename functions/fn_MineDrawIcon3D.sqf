/**********RG_fnc_MineDrawIcon3D*********
This function draws a mine warning on top of a mine
Also displays distance to the mine in meters


Arguments:
0: Object to draw on top of

Usage:
object call RG_fnc_MineDrawIcon3D;

Return Value:
none
*/
private ["_target","_drawIcon","_drawColor","_drawPos","_drawString"];

_target = _this;

_drawIcon = "\A3\ui_f\data\IGUI\Cfg\Cursors\explosive_ca.paa";
_drawColor = [1,0,0,0.5];
_drawPos = getPosATL _target;
_drawString = _target distance (vehicle player);
_drawString = floor _drawString;
_drawString = str _drawString;

drawIcon3D [_drawIcon, _drawColor, _drawPos, 1, 1, 0, _drawString, 2, 0.0175 * SafeZoneW];
