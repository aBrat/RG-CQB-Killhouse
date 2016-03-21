//Unlikely this will be used - but keep in for now

/* Example on how to execute from init.sqf

//setSkillz & nvg removal & GPS adder, looper designed for ALiVE & Zeus by eRazeri
[
1,//AI Skill settings, check the script for the exact skill settings
0,//Opfor nvg removal
0,//Blufor nvg removal
0,//RG nvg removal
0,//Add GPS to player if he hasnt got one
1,//Enable rpt logging
1 //Enable Extensive Skill rpt logging for debugging etc
] execVM "scripts\difficulty.sqf";

*/

//sleep a while so that all is good
sleep 5;

//Here you can change the multipliers
//Zeus and Dedicated server will have different final skills, use debugging to see the values!
//The values needs to be redefine to make them similar, look in the zeus loop
//     value desc             SkillFinal range:
_asp = 0.3;//Aiming Speed     [0.5,1]
_aac = 0.16;//Aiming Accuracy  [0,2]
_ash = 0.2;//Aiming Shake     [0,3]
_com = 0.8;//Commanding       [0,1]
_gen = 0.2;//General          [0,1]
_cou = 0.7;//Courage          [0,7]
_rls = 0.7;//Reload Speed     [0,1]
_sdi = 0.1;//Spot Distance    [0.3,0.5]
_sti = 0.2;//Spot Time        [0,0.9]

//get settings from init.sqf array
_SKILLS = _this select 0;
_NVG_O = _this select 1;
_NVG_B = _this select 2;
_NVG_RG = _this select 3;
_GPS = _this select 4;
_LOG = _this select 5;
_SKILL_LOG = _this select 6;

//if they dont exits make them null
if (isNil "Admin_1") then {Admin_1 = objNull};
if (isNil "Admin_2") then {Admin_2 = objNull};

//check for Zeus player (this is because Zeus spawned AIs are local to Zeuses client)
if ((local Admin_1) || (local Admin_2)) then {
sleep 5;//Make Zeuses sleep 5 seconds so that they are not in sync with server loop.

While {_SKILLS==1} do {
//Here we loop through all units and tag them with a check variable
{
if (side _x == east && local _x) then {
 
if ((_SKILLS==1) && isNil {_x getVariable "Skill_already_defined"}) then
{
_x setVariable ["Skill_already_defined", true];

//each value is serately adjusted to go near dedicateds values 
_x setSkill ["aimingSpeed", _asp - 0.13];
_x setSkill ["aimingAccuracy", _aac - 0.08];
_x setSkill ["aimingShake", _ash - 0.08];
_x setSkill ["commanding", _com - 0.14];
_x setSkill ["general", _gen - 0.05333333];
_x setSkill ["courage", _cou - 0.17];
_x setSkill ["reloadSpeed", _rls - 0.17];
_x setSkill ["spotdistance", _sdi - 0.0266666];
_x setSkill ["spottime", _sti - 0.05333];

if (_LOG==1) then {diag_log format ["Changed skills of %1 by eRazeris looper", _x];};

if (_SKILL_LOG==1) then {
sleep 1;
diag_log format ["aimingSpeed:    Multiplier used: %1, skillFinal %2", _asp, _x skillFinal "aimingSpeed"];
diag_log format ["aimingAccuracy: Multiplier used: %1, skillFinal %2", _aac, _x skillFinal "aimingAccuracy"];
diag_log format ["aimingShake:    Multiplier used: %1, skillFinal %2", _ash, _x skillFinal "aimingShake"];
diag_log format ["commanding:     Multiplier used: %1, skillFinal %2", _com, _x skillFinal "commanding"];
diag_log format ["general:        Multiplier used: %1, skillFinal %2", _gen, _x skillFinal "general"];
diag_log format ["courage:        Multiplier used: %1, skillFinal %2", _cou, _x skillFinal "courage"];
diag_log format ["reloadSpeed:    Multiplier used: %1, skillFinal %2", _rls, _x skillFinal "reloadSpeed"];
diag_log format ["spotdistance:   Multiplier used: %1, skillFinal %2", _sdi, _x skillFinal "spotdistance"];
diag_log format ["spottime:       Multiplier used: %1, skillFinal %2", _sti, _x skillFinal "spottime"];
};
};
};
sleep 0.01;
} forEach allUnits;
sleep 20;
};
};

//start running on Server
if (isServer) then {
While {(_SKILLS==1) || (_NVG_O==1) || (_NVG_B==1) || (_NVG_RG==1) || (_GPS==1)} do {
//Here we loop through all units and tag them with a check variable
{
if (side _x == east) then {
 
if ((_SKILLS==1) && isNil {_x getVariable "Skill_already_defined"} && local _x) then
{
_x setVariable ["Skill_already_defined", true];
 
_x setSkill ["aimingSpeed", _asp];
_x setSkill ["aimingAccuracy", _aac];
_x setSkill ["aimingShake", _ash];
_x setSkill ["commanding", _com];
_x setSkill ["general", _gen];
_x setSkill ["courage", _cou];
_x setSkill ["reloadSpeed", _rls];
_x setSkill ["spotdistance", _sdi];
_x setSkill ["spottime", _sti];
if (_LOG==1) then {diag_log format ["Changed skills of %1 by eRazeris looper", _x];};
if (_SKILL_LOG==1) then {
sleep 1;
diag_log format ["aimingSpeed:    Multiplier used: %1, skillFinal %2", _asp, _x skillFinal "aimingSpeed"];
diag_log format ["aimingAccuracy: Multiplier used: %1, skillFinal %2", _aac, _x skillFinal "aimingAccuracy"];
diag_log format ["aimingShake:    Multiplier used: %1, skillFinal %2", _ash, _x skillFinal "aimingShake"];
diag_log format ["commanding:     Multiplier used: %1, skillFinal %2", _com, _x skillFinal "commanding"];
diag_log format ["general:        Multiplier used: %1, skillFinal %2", _gen, _x skillFinal "general"];
diag_log format ["courage:        Multiplier used: %1, skillFinal %2", _cou, _x skillFinal "courage"];
diag_log format ["reloadSpeed:    Multiplier used: %1, skillFinal %2", _rls, _x skillFinal "reloadSpeed"];
diag_log format ["spotdistance:   Multiplier used: %1, skillFinal %2", _sdi, _x skillFinal "spotdistance"];
diag_log format ["spottime:       Multiplier used: %1, skillFinal %2", _sti, _x skillFinal "spottime"];
};
};

if ((_NVG_O==1) && isNil {_x getVariable "NVG_O_already_removed"}) then
{
_x setVariable ["NVG_O_already_removed", true];
_x unassignItem "NVGoggles_OPFOR";
_x unlinkItem "NVGoggles_OPFOR"; 
_x removeItem "NVGoggles_OPFOR"; 
_x addPrimaryWeaponItem "acc_flashlight"; 
_x enableGunLights "forceOn";
if (_LOG==1) then {diag_log format ["Removed OPFOR NVGs from %1 by eRazeris looper", _x];};
};
sleep 0.01;
};
if (side _x == west) then {
if ((_NVG_B==1) && isNil {_x getVariable "NVG_B_already_removed"}) then
{
_x setVariable ["NVG_B_already_removed", true];
_x unassignItem "NVGoggles"; 
_x unlinkItem "NVGoggles";
_x removeItem "NVGoggles"; 
_x addPrimaryWeaponItem "acc_flashlight"; 
_x enableGunLights "forceOn";
if (_LOG==1) then {diag_log format ["Removed BLUFOR NVGs from %1 by eRazeris looper", _x];};
};
if ((_NVG_RG==1) && isNil {_x getVariable "NVG_RG_already_removed"}) then
{
_x setVariable ["NVG_RG_already_removed", true];
_x unassignItem "RG_NVGoggles"; 
_x unlinkItem "RG_NVGoggles";
_x removeItem "RG_NVGoggles";
_x addPrimaryWeaponItem "acc_flashlight";
if (_LOG==1) then {diag_log format ["Removed RG NVGs from %1 by eRazeris looper", _x];};
};
if ((_GPS==1) && isNil {_x getVariable "GPS_already_added"}) then
{
_x setVariable ["GPS_already_added", true];
if (!("ItemGPS" in items player) && !("ItemGPS" in assignedItems player)) then {player addItem "ItemGPS";};
if (_LOG==1) then {diag_log format ["Added GPS to %1 by eRazeris looper", _x];};
};
sleep 0.01;
};
} forEach allUnits;
sleep 10;
};
};