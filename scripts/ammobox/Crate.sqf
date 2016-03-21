//Ammo Crate Utility by Jonathan Danek

//Move this sqf script into your missions folder. Place the following line of code in the init of the desired ammobox:

//null = this execVM "Crate.sqf";



//Settings 
_weaponAmount = 5;
_magAmount = 50;
_itemAmount = 10;


//Clear Box
clearWeaponCargoglobal _this;
clearMagazineCargoglobal _this;
clearItemCargoglobal _this;

_this additemcargoGlobal ["FirstAidKit", _itemAmount];
_this additemcargoGlobal ["acc_flashlight", _itemAmount];
_this addWeaponCargoGlobal ["arifle_MX_GL_F", _weaponAmount];
_this addmagazinecargoGlobal ["30Rnd_65x39_caseless_mag", _magAmount];
_this addmagazinecargoGlobal ["30Rnd_556x45_Stanag", _magAmount];
_this addmagazinecargoGlobal ["200Rnd_65x39_cased_Box", _itemAmount];
_this addmagazinecargoGlobal ["20Rnd_762x51_Mag", _itemAmount];
_this addmagazinecargoGlobal ["7Rnd_408_Mag", _itemAmount];
_this addmagazinecargoGlobal ["NLAW_F", _itemAmount];
_this addmagazinecargoGlobal ["HandGrenade", _magAmount];
_this addmagazinecargoGlobal ["ATMine_Range_Mag", _itemAmount];
_this addmagazinecargoGlobal ["DemoCharge_Remote_Mag", _itemAmount];
_this addmagazinecargoGlobal ["SatchelCharge_Remote_Mag", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_HE_Grenade_shell", _magAmount];
_this addmagazinecargoGlobal ["1Rnd_Smoke_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokeBlue_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokeGreen_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokeOrange_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokePurple_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokeRed_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["1Rnd_SmokeYellow_Grenade_shell", _itemAmount];
_this addmagazinecargoGlobal ["UGL_FlareCIR_F", _itemAmount];
_this addmagazinecargoGlobal ["UGL_FlareGreen_F", _itemAmount];
_this addmagazinecargoGlobal ["UGL_FlareRed_F", _itemAmount];
_this addmagazinecargoGlobal ["UGL_FlareWhite_F", _itemAmount];
_this addmagazinecargoGlobal ["UGL_FlareYellow_F", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShell", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellYellow", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellGreen", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellRed", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellPurple", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellOrange", _itemAmount];
_this addmagazinecargoGlobal ["SmokeShellBlue", _itemAmount];
_this addmagazinecargoGlobal ["Chemlight_red", _itemAmount];
_this addmagazinecargoGlobal ["Chemlight_yellow", _itemAmount];
_this addmagazinecargoGlobal ["Chemlight_blue", _itemAmount];