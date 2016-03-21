/**********RG Task Force Tracker function*********
initial function from qbt, thanks once again mate!


Arguments:
0: Display control

Return Value:
Array - Meant for debugging information and as such it`s commented out
0: Count of units being tracked
1: Count of units NOT being tracked
*/

private ["_texture","_colorIconLocal","_groupID","_strText"];//,"_tracked_count","_playableUnits_count"
//_tracked_count = 0;
//_playableUnits_count = 0;
{
        if (((typeOf _x) in RG_tracker_classnames_to_track) && (side (group player) == side (group _x))) then {
            if (_x == ((crew (vehicle _x)) select 0))  then {

                _texture = switch (true) do {
                    case (vehicle _x isKindOf "Man"): {"\a3\ui_f\data\map\Markers\NATO\b_inf.paa"};
                    case (vehicle _x isKindOf "Helicopter"): {"\a3\ui_f\data\map\Markers\NATO\b_air.paa"};
                    case (vehicle _x isKindOf "Plane"): {"\a3\ui_f\data\map\Markers\NATO\b_plane.paa"};
                    case (vehicle _x isKindOf "Car"): {"\a3\ui_f\data\map\Markers\NATO\b_motor_inf.paa"};
                    case (vehicle _x isKindOf "Tank"): {"\a3\ui_f\data\map\Markers\NATO\b_armor.paa"};
                    case (vehicle _x isKindOf "Ship"): {"\a3\ui_f\data\map\Markers\NATO\b_naval.paa"};
                    default {"\a3\ui_f\data\map\Markers\NATO\b_unknown.paa"};
                    };

                _colorIconLocal = side (group _x)  call bis_fnc_sidecolor;
                
                if (isnil {(leader _x) getVariable "RG_Tracker_groupID"}) then {
                _groupID = groupID (group _x);
                }else{
                _groupID = (leader _x) getVariable "RG_Tracker_groupID";
                };
                
                _strText = switch (true) do {
                    case (vehicle _x isKindOf "Man"): {_groupID};
                    case (vehicle _x isKindOf "Helicopter"):
                    {
                        switch (true) do {
                            case (faction (vehicle _x) == "RG_TaskForce"): {
                                switch (true) do {
                                case (vehicle _x isKindOf "RG_MH_6_LittleBird_CTRG"): {"Harpy"};
                                case (vehicle _x isKindOf "RG_AH_6_LittleBird_CTRG"): {"Fury"};
                                case (vehicle _x isKindOf "RG_MH_6_LittleBird_NIGHT"): {"Harpy"};
                                case (vehicle _x isKindOf "RG_AH_6_LittleBird_NIGHT"): {"Fury"};
                                default {_groupID};
                                };
                            };
                            case (faction (vehicle _x) == "RG_TaskForce_WD"): {
                                switch (true) do {
                                case (vehicle _x isKindOf "RG_MH_6_LittleBird_WD"): {"Harpy"};
                                case (vehicle _x isKindOf "RG_AH_6_LittleBird_WD"): {"Fury"};
                                default {_groupID};
                                };
                            };
                            case (faction (vehicle _x) == "RG_TaskForce_DS"): {
                                switch (true) do {
                                case (vehicle _x isKindOf "RG_MH_6_LittleBird_DS"): {"Harpy"};
                                case (vehicle _x isKindOf "RG_AH_6_LittleBird_DS"): {"Fury"};
                                default {_groupID};
                                };
							};
                            case (faction (vehicle _x) == "rhs_faction_usarmy_d"): {
                                switch (true) do {
                                case (vehicle _x isKindOf "RHS_UH60M_d"): {"Phantom"};
								case (vehicle _x isKindOf "RHS_UH60M_MEV_d"): {"Dustoff"};
								case (vehicle _x isKindOf "RHS_UH60M_MEV2_d"): {"Dustoff"};
                                case (vehicle _x isKindOf "RHS_CH_47F_light"): {"Atlas"};
                                case (vehicle _x isKindOf "RHS_AH64D"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_GS"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_CS"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_AA"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64DGrey"): {"Hitman"};
                                default {_groupID};
                                };
							};
                            case (faction (vehicle _x) == "rhs_faction_usarmy_wd"): {
                                switch (true) do {
                                case (vehicle _x isKindOf "RHS_UH60M"): {"Phantom"};
								case (vehicle _x isKindOf "RHS_UH60M_MEV"): {"Dustoff"};
								case (vehicle _x isKindOf "RHS_UH60M_MEV2"): {"Dustoff"};
                                case (vehicle _x isKindOf "RHS_CH_47F"): {"Atlas"};
                                case (vehicle _x isKindOf "RHS_AH64D_wd"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_wd_GS"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_wd_CS"): {"Hitman"};
								case (vehicle _x isKindOf "RHS_AH64D_wd_AA"): {"Hitman"};
                                default {_groupID};
                                };
                            };
                            case (vehicle _x isKindOf "B_Heli_Transport_03_F"): {"Atlas"};
                            default {_groupID};
                            };
                    };
                    case (vehicle _x isKindOf "Plane"):
                    {
                        switch (true) do {
                            case (vehicle _x isKindOf "HS_A10"): {"Reaper"};
                            case (vehicle _x isKindOf "JS_JC_FA18E"): {"Valkyrie"};
                            case (vehicle _x isKindOf "JS_JC_FA18F"): {"Griffin"};
							case (vehicle _x isKindOf "F_35C_S"): {"Pegasus"};
							case (vehicle _x isKindOf "F_35C"): {"Pegasus"};
                            default {_groupID};
                            };
                    };
                    //case (vehicle _x isKindOf "Car"): {_groupID};
                    //case (vehicle _x isKindOf "Tank"): {_groupID};
                    //case (vehicle _x isKindOf "Ship"): {_groupID};
                    default {_groupID};
                    };

                if ((typeName (_this select 0)) != "CONTROL") exitWith {};

                (_this select 0) drawIcon [
                    _texture,

                    _colorIconLocal,

                    visiblePosition (vehicle _x),

                    28 min ((2 max (ctrlMapScale (_this select 0))) * 100),

                    28 min ((2 max (ctrlMapScale (_this select 0))) * 100),

                    0,

                    _strText,

                    0,

                    0.033,

                    "TahomaB"
                ];
                //_tracked_count = _tracked_count + 1;
            };
        };
        //_playableUnits_count = _playableUnits_count + 1;
} forEach playableUnits;//AllUnits
//[_tracked_count,_playableUnits_count - _tracked_count];

/* snippet for performance tweaking
[
"[(findDisplay 12) displayCtrl 51]  call rg_fnc_trackerDrawMap;",
[],
1000
] call BIS_fnc_codePerformance;
*/
