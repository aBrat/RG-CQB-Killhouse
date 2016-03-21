//RG task force tracker for Map
//PINPONELLE//
disableSerialization;
waitUntil {sleep .1; !(isNull (findDisplay 12))};
((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", "_this call rg_fnc_trackerDrawMap"];