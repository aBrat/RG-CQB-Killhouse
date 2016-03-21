/**********Parachute Deploy*********
Function for a simulated deployment of a parachute.
Spawned from the action menu entry added by Parah_EH.sqf.


Arguments:
0: Unit

Usage:
[player] spawn RG_fnc_Para_Deploy;

Return Value:
none
*/

_unit = _this select 0;
_unit removeAction parachute_Action;
para_action_active = false;

if (isNull (unitBackpack _unit)) then {
    _unit addBackpack "b_parachute";//B_B_Parachute_02_F
    _unit action ["OpenParachute", _unit];
} else {
    _backpack	= unitBackpack _unit;
    _backpack_classname	= backpack _unit;
    _backpack_items	= getItemCargo _backpack;
    _backpack_magazines = magazinesAmmoCargo _backpack;
    _backpack_weapons = getWeaponCargo _backpack;
    _unit addBackpack "b_parachute";

    _unit action ["OpenParachute", _unit];

    _unit addBackpack _backpack_classname;
    clearAllItemsFromBackpack _unit;
    _backpack_new	= unitBackpack _unit;
    {_backpack_new addMagazineAmmoCargo [_x select 0,1,_x select 1]} forEach _backpack_magazines;
    for "_i" from 0 to (count (_backpack_weapons select 0) - 1) do {
            (_backpack_new) addWeaponCargoGlobal [(_backpack_weapons select 0) select _i,(_backpack_weapons select 1) select _i];
        };
    for "_i" from 0 to (count (_backpack_items select 0) - 1) do {
            (_backpack_new) addItemCargoGlobal [(_backpack_items select 0) select _i,(_backpack_items select 1) select _i];
        };
};
sleep .1;
_para = ((nearestObjects [player, ["ParachuteBase"], 5]) select 0);

//Smooth landing without gliding over the land
while {((getPosATL _unit select 2) > 0.99) && (alive _unit)} do {
    sleep .01;
};
if (alive _unit) then {
    deletevehicle _para;
    _unit switchMove "AmovPercMevaSrasWrflDf_AmovPknlMstpSrasWrflDnon";
    sleep .1;
};
