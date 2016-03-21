//Add all units to Zeus
//execVM "scripts\mission\zeus.sqf";
if (isServer) then {
sleep 10;
{
_x addCuratorEditableObjects [playableunits + switchableunits - (entities "VirtualMan_F"),true];//players
} foreach allCurators;
};
