if(hasInterface) then 
{
private ["_playerRespawn"];
private ["_adminRespawn"];

if (isNil "Admin1") then {Admin1 = objNull};
if (isNil "Admin2") then {Admin2 = objNull};
if (isNil "CQBT1") then {CQBT1 = objNull};
if (isNil "CQBT2") then {CQBT2 = objNull};
if (isNil "Helios1") then {Helios1 = objNull};
if (isNil "Mars1") then {Mars1 = objNull};
if (isNil "ADMIN1") then {ADMIN1 = objNull};
if (isNil "Helios2") then {Helios2 = objNull};
if (isNil "Mars2") then {Mars2 = objNull};
if (isNil "ADMIN2") then {ADMIN2 = objNull};
if (isNil "Andrews1") then {Andrews1= objNull};
if (isNil "Andrews2") then {Andrews2= objNull};

//Admin command access to select units
if ((local Admin1) || (local Admin2) || (local CQBT1) || (local CQBT2) || (local Helios1) || (local Mars1) || (local ADMIN1) || (local Helios2) || (local Mars2) || (local ADMIN2)) then 
	{

			Debug_Console_Action = player addAction["<t color='#FFFF11'>Debug Console</t>", "createDialog ""RscDisplayDebugPublic""", nil, 1, false, True, "", "_this == Admin1 || _this ==  Admin2 || _this ==  CQBT1 || _this ==  CQBT2 || _this ==  Helios1 || _this ==  Mars1 || _this == ADMIN1 || _this ==  Helios2 || _this ==  Mars2 || _this == ADMIN2"];
      _playerRespawn = player addEventHandler ["Respawn", { _this execVM "scripts\Admin\AdminRespawn.sqf";}]; 
			
	};  

if ((local Andrews1) || (local Andrews2))  then 
	{

			Splendid_Camera_Action = player addAction["<t color='#FFFF11'>Splendid Camera</t>", {["Paste",["Stratis",getPos player,getDir player,0.7,[0,0],0,0,855.569,0.3,1]] call bis_fnc_camera;}, nil, 1, false, True, "", "_this == Andrews1 || _this ==  Andrews2 "];
			_adminRespawn = player addEventHandler ["Respawn", { _this execVM "scripts\mission\AndrewsRespawn.sqf";}];
	};

};
