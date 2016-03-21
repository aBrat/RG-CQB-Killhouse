/**********RG Group Designator*********
Also assigns a variable to the unit for the Tracker to use as an group name.
Arguments:
0: Unit
1: String - The group ID that will be set
Usage:
null = [this,"Admin"] call RG_fnc_groupID;
Return Value:
none
*/
_unit = _this select 0;
_name = _this select 1;
_group = group _unit;

//Assign basic groupID
if (groupID _group != _name) then {
_group setGroupID [_name];
};

//Assign RG Tracker groupID
_unit setVariable ["RG_Tracker_groupID", _name, false];