=RG= Mission Template
This repository contains the mission template for Reality Gaming, a gaming community.
This is not intended as a finished mission, but is here as a collaborative tool
for the bare bones mission template for mission makers of the community to build from.

What it contains
The Taskforce unit structure. Common modules with predefined settings

Different factions
Currently we have two different factions:
_WD is woodland camouflage units
_DS is desert camouflage units

The classnames differ only by the suffix.
This makes it easy to change the unit from one faction to another using a simple search and replace.
You can convert the _WD units into _DS (or other way around) easily with search and replace in the mission.sqm-file.

ALiVE Multispawn
The Mission template now features ALiVE Multispawn module.
Read about the usage here: http://alivemod.com/wiki/index.php/Multispawn
There are numerous markers on the map designating these points per faction.
Used respawn types are in the functionality order:
-Building
-Faction
-Fallback to vanilla system

Vanilla respawn system
Vanilla respawn system only works as a fallback in the case of all ALiVE respawn points not working. The marker for vanilla respawn: "respawn_west" is located near the ALiVE multispawn markers and it`s called "Fallback Respawn".
For info on vanilla respawn systems: https://community.bistudio.com/wiki/Arma_3_Respawn

Required Modules
Alive, Zeus, AGM, Game Logic, Headless client

These should stay pretty much the same - configure if you need a spercific result
Scripts are initialized from different locations:
-Init.sqf
-InitPlayerLocal.sqf
-initPlayerServer.sqf
-InitServer.sqf
-scripts\XEH_Init\typeof.sqf
More info on Event Scripts.

Functions
There are numerous functions built into the template.
You can browse them at missionroot/functions folder or ingame with functions library/missionConfigFile

Headless Client
There is also a headless client slot.
It exists there only as a placeholder as we don't have a HC setup currently running.
https://community.bistudio.com/wiki/Arma_3_Headless_Client
http://forums.bistudio.com/showthread.php?183918-Dedicated-Client-Headless-Client-feedback-(dev-branch)