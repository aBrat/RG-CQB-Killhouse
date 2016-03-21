if ((hasInterface)) then {
RG_mineDetector_enabled = false;

player addEventHandler ["Put", {
    if (_this select 2 == "MineDetector" && !("MineDetector" in items player) && secondaryWeapon player != "MineDetector") then {
    RG_mineDetector_enabled = false;
    };
}];

player addEventHandler ["Take", {
    if (_this select 2 == "MineDetector" && !(RG_mineDetector_enabled)) then {
    [] spawn RG_fnc_MineDetector;
    };
}];

player addEventHandler ["Respawn", {
    if (_this select 0 == player && !(RG_mineDetector_enabled) && ("MineDetector" in items player || secondaryWeapon player == "MineDetector")) then {
    [] spawn RG_fnc_MineDetector;
    };
}];

if ("MineDetector" in items player || secondaryWeapon player == "MineDetector" && !(RG_mineDetector_enabled)) then {
[] spawn RG_fnc_MineDetector;
};

};//END