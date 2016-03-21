if(hasInterface) then {
private ["_playerRespawn"];

if (isNil "Abrat1") then {Abrat1= objNull};
if (isNil "lead") then {lead= objNull};
if (isNil "sic") then {sic= objNull};
if (isNil "gren") then {gren= objNull};
if (isNil "mrk") then {mrk= objNull};
if (isNil "mech") then {mech= objNull};
if (isNil "medic") then {medic= objNull};
if (isNil "aur1") then {aur1= objNull};
if (isNil "aur2") then {aur2= objNull};
if (isNil "lat") then {lat= objNull};


if ((local Abrat1)) then 
	{
	removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "TRYK_U_B_MARPAT_Desert2";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACE_DefusalKit";
player addItemToVest "ACE_Clacker";
player addItemToVest "MineDetector";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 3 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 6 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 4 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 4 do {player addItemToBackpack "1Rnd_HE_Grenade_shell";};
player addHeadgear "TRYK_R_CAP_TAN";
player addGoggles "TRYK_Beard4";

player addWeapon "arifle_mas_m4_m203c_d";
player addPrimaryWeaponItem "muzzle_mas_snds_Mc";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addPrimaryWeaponItem "optic_mas_Arco_camo";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "ItemGPS";
player linkItem "TRYK_TAC_SET_NV_TAN_2";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];

	}; 
	
if ((local lead)) then 
	{
	removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;


player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4_m203c_d";
player addPrimaryWeaponItem "muzzle_mas_snds_Mc";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addPrimaryWeaponItem "optic_mas_Arco_camo";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];

	};

if ((local sic)) then 
	{
	removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;


player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 5 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "ACE_tourniquet";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4_m203c_d";
player addPrimaryWeaponItem "muzzle_mas_snds_Mc";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addPrimaryWeaponItem "optic_mas_Arco_camo";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};
	
if ((local gren)) then 
	{
	comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACE_DefusalKit";
player addItemToVest "ACE_Clacker";
player addItemToVest "MineDetector";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {player addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "muzzle_mas_snds_Mc";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "DemoCharge_Remote_Mag";
for "_i" from 1 to 2 do {player addItemToBackpack "SLAMDirectionalMine_Wire_Mag";};
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4_m203c_d";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};
	
if ((local mech)) then 
	{
	comment "Exported from Arsenal by Cpl.aBrat";

comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "muzzle_mas_snds_Mc";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "ToolKit";
player addItemToBackpack "ACE_wirecutter";
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4c_d";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";
	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};
	
if ((local mrk)) then 
	{
	comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 4 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
for "_i" from 1 to 4 do {player addItemToVest "rhsusf_20Rnd_762x51_m118_special_Mag";};
player addItemToVest "hlc_20Rnd_762x51_T_M14";
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "optic_Hamr";
player addItemToBackpack "NLAW_F";
player addHeadgear "TRYK_R_CAP_OD_US";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "rhs_weap_m14ebrri";
player addPrimaryWeaponItem "rhsusf_acc_anpeq15A";
player addPrimaryWeaponItem "optic_SOS";
player addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};	
	
if ((local medic)) then 
	{
	removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellBlue";};
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_blue";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
for "_i" from 1 to 2 do {player addItemToVest "Chemlight_yellow";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShellYellow";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 5 do {player addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "muzzle_mas_snds_Mc";
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "ACE_personalAidKit";
player addItemToBackpack "ACE_surgicalKit";
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4c_d";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};	
	
	
if ((local aur1) || (local aur2)) then 
	{
	comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "optic_mas_Hamr_camo";
player addItemToBackpack "200Rnd_mas_556x45_T_Stanag";
for "_i" from 1 to 2 do {player addItemToBackpack "200Rnd_mas_556x45_Stanag";};
player addHeadgear "TRYK_R_CAP_OD_US";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "LMG_mas_M249_F_d";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addPrimaryWeaponItem "bipod_01_F_snd";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";

	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};

if ((local lat)) then 
	{
	comment "Remove existing items";
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

comment "Add containers";
player forceAddUniform "TRYK_U_B_TANTAN_CombatUniform";
player addItemToUniform "ACE_EarPlugs";
player addItemToUniform "ACE_Flashlight_MX991";
player addItemToUniform "ACE_IR_Strobe_Item";
player addItemToUniform "ACE_microDAGR";
player addItemToUniform "ACE_MapTools";
for "_i" from 1 to 4 do {player addItemToUniform "ACE_CableTie";};
player addVest "TRYK_V_tacv1LC_CY";
player addItemToVest "ACRE_PRC148_ID_1";
for "_i" from 1 to 2 do {player addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {player addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {player addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {player addItemToVest "12Rnd_mas_45acp_Mag";};
for "_i" from 1 to 4 do {player addItemToVest "30Rnd_mas_556x45_Stanag";};
player addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";
player addBackpack "TRYK_B_Kitbag_aaf";
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_packingBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_elasticBandage";};
for "_i" from 1 to 10 do {player addItemToBackpack "ACE_quikclot";};
player addItemToBackpack "optic_mas_Holosight_camo";
player addItemToBackpack "muzzle_mas_snds_Mc";
for "_i" from 1 to 2 do {player addItemToBackpack "ACE_morphine";};
player addItemToBackpack "ACE_tourniquet";
player addItemToBackpack "NLAW_F";
player addHeadgear "H_Cap_brn_SPECOPS";
player addGoggles "TRYK_TAC_SET_TAN";

comment "Add weapons";
player addWeapon "arifle_mas_m4c_d";
player addPrimaryWeaponItem "acc_mas_pointer_IR";
player addWeapon "launch_NLAW_F";
player addWeapon "hgun_mas_glocksf_F";
player addHandgunItem "muzzle_mas_snds_L";
player addHandgunItem "acc_mas_pointer_gun_IR";
player addHandgunItem "optic_mas_MRD";
player addWeapon "Rangefinder";

comment "Add items";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadioAcreFlagged";
player linkItem "TRYK_HRPIGEAR_NV";
	_playerRespawn = player addEventHandler ["Respawn", {_this execVM "scripts\mission\loadouts.sqf";}];
	};
};