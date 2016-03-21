//RG task force tracker for GPS
//TWISTY MOUSTACHE//
disableSerialization;
_minimap=controlNull;
while {isNull _minimap} do {
    {
        if !(isNil {_x displayctrl 101}) then {_minimap= _x displayctrl 101};
        }
        count (uiNamespace getVariable "IGUI_Displays");
        sleep .1;
    };
_minimap ctrlAddEventHandler ["Draw", "_this call rg_fnc_trackerDrawMap;"];