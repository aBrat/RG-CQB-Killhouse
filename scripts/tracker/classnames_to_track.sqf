//RG task force tracker, array of classnames that can track and are being tracked.
//Evil Grin//
RG_tracker_classnames_to_track = [];


//Highroller tracking
tracker_HR_array = [
"RG_CompanyCO_DS",
"RG_CompanyXO_DS",
"RG_CompanyRSM_DS",
"RG_CompanyCO_WD",
"RG_CompanyXO_WD",
"RG_CompanyRSM_WD"
];

RG_leader_classnames_array = [

//HighRoller
"RG_CompanyCO_DS",
"RG_CompanyXO_DS",
"RG_CompanyRSM_DS",
"RG_CompanyCO_WD",
"RG_CompanyXO_WD",
"RG_CompanyRSM_WD",

//Platoon command
"RG_PlatoonCO_DS",
"RG_PlatoonXO_DS",
"RG_PlatoonMedic_DS",
"RG_PlatoonCO_WD",
"RG_PlatoonXO_WD",
"RG_PlatoonMedic_WD",

//Gambler
"RG_InfantryLdr_DS",
"RG_Infantry2ic_DS",
"RG_InfantryLdr_WD",
"RG_Infantry2iC_WD",
"RG_SlingshotLdr_DS",
"RG_SlingshotLdr_WD",

//Gambler CSG
"RG_SupportCom_DS",
"RG_SupportLdr_DS",
"RG_SupportCom_WD",
"RG_SupportLdr_WD",

//Gambler CSG Pilots
"RG_SupportJet_DS",
"RG_SupportHeli_DS",
"RG_SupportJet_WD",
"RG_SupportHeli_WD",

//Vegas
"RG_VegasLdrC_DS",
"RG_VegasLdrC_WD"

];

if ((typeOf player) in tracker_HR_array) then {
      RG_tracker_classnames_to_track = RG_tracker_classnames_to_track + RG_leader_classnames_array;
};


//Platoon command
tracker_Platoon_leader_array = [
"RG_PlatoonCO_DS",
"RG_PlatoonXO_DS",
"RG_PlatoonMedic_DS",
"RG_PlatoonCO_WD",
"RG_PlatoonXO_WD",
"RG_PlatoonMedic_WD"
];
tracker_Gambler_SQL_array = [
"RG_InfantryLdr_DS",
"RG_Infantry2ic_DS",
"RG_InfantryLdr_WD",
"RG_Infantry2iC_WD",
"RG_SlingshotLdr_DS",
"RG_SlingshotLdr_WD",
"RG_PlatoonXO_DS",
"RG_PlatoonMedic_DS",
"RG_PlatoonCO_WD",
"RG_PlatoonXO_WD",
"RG_PlatoonMedic_WD"
];
if ((typeOf player) in tracker_Platoon_leader_array) then {
      RG_tracker_classnames_to_track = RG_tracker_classnames_to_track + tracker_Gambler_SQL_array;
};



//Gambler
tracker_Gambler_leader_array = [
"RG_InfantryLdr_DS",
"RG_Infantry2ic_DS",
"RG_InfantryLdr_WD",
"RG_Infantry2iC_WD",
"RG_SlingshotLdr_DS",
"RG_SlingshotLdr_WD"
];
tracker_FT_members_array = [
"RG_InfantryGrn_DS",
"RG_InfantryLAT_DS",
"RG_InfantryAuR_DS",
"RG_InfantryMrk_DS",
"RG_InfantryMech_DS",
"RG_InfantryMed_DS",
"RG_InfantryGrn_WD",
"RG_InfantryLAT_WD",
"RG_InfantryAuR_WD",
"RG_InfantryMrk_WD",
"RG_InfantryMech_WD",
"RG_InfantryMed_WD",
"RG_InfantryLdr_DS",
"RG_Infantry2ic_DS",
"RG_InfantryLdr_WD",
"RG_Infantry2iC_WD",
"RG_SlingshotLdr_DS",
"RG_SlingshotLdr_WD"
];


if ((typeOf player) in tracker_Gambler_leader_array) then {
      RG_tracker_classnames_to_track = RG_tracker_classnames_to_track + tracker_FT_members_array;
};




//Vegas
tracker_Vegas_leader_array = [
"RG_VegasLdrC_DS",
"RG_VegasLdrC_WD"
];
tracker_Vegas_members_array = [
"RG_VegasLdrC_DS",
"RG_VegasAUR_DS",
"RG_VegasOpr_DS",
"RG_VegasOprGL_DS",
"RG_VegasOprAT_DS",
"RG_VegasEOD_DS",
"RG_VegasMed_DS",
"RG_VegasSpot_DS",
"RG_VegasSnp_DS",
"RG_VegasUAV_DS",
"RG_VegasLdrC_WD",
"RG_VegasAUR_WD",
"RG_VegasOpr_WD",
"RG_VegasOprGL_WD",
"RG_VegasOprAT_WD",
"RG_VegasEOD_WD",
"RG_VegasMed_WD",
"RG_VegasSpot_WD",
"RG_VegasSnp_WD",
"RG_VegasUAV_WD"
];
if ((typeOf player) in tracker_Vegas_leader_array) then {
      RG_tracker_classnames_to_track = RG_tracker_classnames_to_track + tracker_Vegas_members_array;
};






//CSG
tracker_Talon_leader_array = [
"RG_SupportCom_DS",
"RG_SupportLdr_DS",
"RG_SupportCom_WD",
"RG_SupportLdr_WD"
];



tracker_Talon_members_array = [
"RG_SupportCom_DS",
"RG_SupportLdr_DS",
"RG_SupportCom_WD",
"RG_SupportLdr_WD",
"RG_SupportJet_DS",
"RG_SupportHeli_DS",
"RG_SupportJet_WD",
"RG_SupportHeli_WD",
"RG_SupportCrew_DS",
"RG_SupportDet_DS",
"RG_SupportMed_DS",
"RG_SupportCrew_WD",
"RG_SupportMed_WD",
"RG_SupportDet_WD"
];
if ((typeOf player) in tracker_Talon_leader_array) then {
      RG_tracker_classnames_to_track = RG_tracker_classnames_to_track + tracker_Talon_members_array;
};





