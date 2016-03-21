sleep 20;//sleep a while so that all is good

//Check that acre is running
if (isClass(configFile >> "CfgPatches" >> "acre_main")) then {

//run only on server
if (isServer) then {

//Make sure that antennas exists
if (!isNull mobile_antenna_x_8x && !isNull mobile_antenna_8x_9x) then {

//assign objects for the retrans points
_antenna_1 = mobile_antenna_x_8x;
_antenna_2 = mobile_antenna_8x_9x;

//assign radio to use
_retrans_radio = "ACRE_PRC117F";//117 has 1.2 Meter VHF Antenna AND 13" UHF Antenna  ACRE_PRC117F VS ACRE_PRC119

//assing retrans power in mW
_retrans_power = 40000;

//343 short range channel frequencies
_sr_chan_1 = 2401;
_sr_chan_2 = 2402;
_sr_chan_3 = 2403;
_sr_chan_4 = 2404;
_sr_chan_5 = 2405;
_sr_chan_6 = 2406;
_sr_chan_7 = 2407;
_sr_chan_8 = 2408;
_sr_chan_9 = 2409;
_sr_chan_10= 2410;
_sr_chan_11= 2411;
_sr_chan_12= 2412;
_sr_chan_13= 2413;
_sr_chan_14= 2414;
_sr_chan_15= 2415;
_sr_chan_16= 2416;

//Long range channel frequencies
_chan_1 = 36.625;
_chan_2 = 37.775;
_chan_3 = 40.275;
_chan_4 = 42.675;
_chan_5 = 47.350;
_chan_6 = 51.850;
_chan_7 = 54.500;
_chan_8 = 58.400; 
_chan_9 = 62.800;
_chan_10= 65.050;

_chan_81=281.500;
_chan_82=285.275;
_chan_83=290.025;
_chan_84=293.850;
_chan_85=295.200;
_chan_86=298.725; 
_chan_87=302.550;
_chan_88=303.950;
_chan_89=305.875;
_chan_90=309.725;

_chan_91=313.525;
_chan_92=315.400;
_chan_93=318.575;
_chan_94=323.225;
_chan_95=326.525;
_chan_96=331.075;
_chan_97=333.700;
_chan_98=335.475;
_chan_99=339.425;
_chan_100=342.675;

//Create them
//[Radio, object, 1st frequency, 2nd frequency, power]
[ _retrans_radio, _antenna_1, _chan_1, _chan_81, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_2, _chan_82, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_3, _chan_83, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_4, _chan_84, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_5, _chan_85, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_6, _chan_86, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_7, _chan_87, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_8, _chan_88, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_9, _chan_89, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_1, _chan_10,_chan_90, _retrans_power] call acre_api_fnc_attachRxmtToObj;

sleep 1;

[ _retrans_radio, _antenna_2, _chan_81, _chan_91, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_82, _chan_92, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_83, _chan_93, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_84, _chan_94, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_85, _chan_95, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_86, _chan_96, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_87, _chan_97, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_88, _chan_98, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_89, _chan_99, _retrans_power] call acre_api_fnc_attachRxmtToObj;
sleep 0.2;
[ _retrans_radio, _antenna_2, _chan_90,_chan_100, _retrans_power] call acre_api_fnc_attachRxmtToObj;

};
};
};
};
