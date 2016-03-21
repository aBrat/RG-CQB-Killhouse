// Loadout, respawn, painting and emergency ejection init script by eRazeri
//vehicle init line: f18e_init = [this] execVM "scripts\f18\f18e_init.sqf";
_f18e = _this select 0;
respaE = [_f18e] execVM "scripts\f18\f18e_respawn.sqf";
fa18_dynamic_loadoutscript = [_f18e,
"js_m_fa18_aim9x_x1",   //Station 1
"js_m_fa18_aim9x_x1",   //Station 2
"js_m_fa18_Maverick_x1",//Station 3
"js_m_fa18_Maverick_x1",//Station 4
"js_m_fa18_bombrack_x1",//Station 5
"js_m_fa18_bombrack_x1",//Station 6
"js_m_fa18_bombrack_x1",//Station 7
"js_m_fa18_bombrack_x1",//Station 8
"js_m_fa18_aim120c_x1", //Station 9
"js_m_fa18_aim120c_x1", //Station 10
"js_m_fa18_GBU12_x1",   //Station 11
"js_m_fa18_GBU12_x1",   //Station 12
"js_m_fa18_GBU12_x1",   //Station 13
"js_m_fa18_GBU12_x1",   //Station 14
"js_m_fa18_Maverick_x1",//Station 15
"js_m_fa18_Maverick_x1",//Station 16
"js_m_fa18_Maverick_x1",//Station 17
"js_m_fa18_Maverick_x1",//Station 18
"js_m_fa18_wing_tank_x1"//Station 19
] execvm "js_jc_fa18\scripts\LOADOUTS\FA18_instant_loadouts.sqf";
if (isServer) then {_f18e addBackpackCargoGlobal ["RG_Talon_BugOutBag",1];};