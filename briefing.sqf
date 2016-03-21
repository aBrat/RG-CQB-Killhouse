//save as briefing.sqf and execVM from init.sqf


switch (side player) do 
{

case WEST: // BLUFOR briefing goes here
{
//player createDiaryRecord ["Diary", ["*The Note Title*", "*The Note Message*"]];




_notes = player createDiaryRecord ["Diary",["Credits","
Credits
<br/><br/>
Mission by:
<br/><br/>
RG aBrat<br/>
"]];

_notes = player createDiaryRecord ["Diary",["Scripts","
Resources 
<br/><br/>
ALiVE<br/>
ACE</br>
CUP</br>
And ofc. Love <3</br>
"]];

_notes = player createDiaryRecord ["Diary",["Mission Notes","
Win/Loose
<br/><br/>
"]];
/*
_notes = player createDiaryRecord ["Diary",["OPORD","
1. SITUATION
<br/>----------------------<br/>
Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut 
laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation 
ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor 
in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at 
vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.<br/>
Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. 
<font color='#FF0000'><marker name='unw'>West UN checkpoint</marker></font> 
and also provoked the UN troops by sporadic small arms fire. <br/><br/>
  
  1.a Enemy Forces<br/><br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/>
  <img image='101hq.jpg'/>
  <br/><br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/>
  <img image='unw.jpg'/>
  <br/><br/>
    Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/>
  <img image='radar.jpg'/>
  <br/><br/>
    Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/>
  <img image='field.jpg'/>
  <br/><br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.  <br/>
  <img image='town.jpg'/>
  <br/><br/>
  
  1.b Friendly Forces<br/><br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
  
  1.c Attachments/Detachments<br/><br/>
Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
2. MISSION
<br/>----------------------<br/>
Intent:<br/>
Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. 
<br/><br/>
Recon:<br/>
<br/><br/>
Plan:<br/>
Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
Coordination:<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
ROE:<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
Environment:<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
Force Procection:<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
3. SUSTAINMENT
<br/>----------------------<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/><br/>
4. COMMAND AND CONTROL
<br/>----------------------<br/>
  Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius. <br/>
"]];
//Task1 - COMMENT
//task_1 = player createSimpleTask ["TASKNAME"]; 
//task_1 setSimpleTaskDescription ["TASK DESCRIPTION","Example Task","WHAT WILL BE DISPLAYED ON THE MAP"]; 
//task_1 setSimpleTaskDestination (getMarkerPos "task_1");
//task_1 setTaskState "Assigned"; 
//player setCurrentTask task_1;
//Task2 - COMMENT
//task_2 = player createSimpleTask ["TASKNAME"]; 
//task_2 setSimpleTaskDescription ["TASK DESCRIPTION","Example Task","WHAT WILL BE DISPLAYED ON THE MAP"]; 
//task_2 setSimpleTaskDestination (getMarkerPos "task_2");
*/


};


case EAST: // OPFOR briefing goes here
{ 
};


case RESISTANCE: // RESISTANCE/INDEPENDENT briefing goes here
{ 
};


case CIVILIAN: // CIVILIAN briefing goes here
{ 
};
};

//RG introduction page visible for all
player createDiarySubject ["RG", "Reality Gaming"];

player createDiaryRecord ["RG", 
[
	"Reality Gaming", 
	"
	<br/><font size='20' color='#FFBF00'>REALITY GAMING</font>
<br/> 
<br/>
<img image='http://forums.realitygamer.org/staffupload/images/insignia.jpg' width='128'/><br/><br/>
<font color='#FFBF00'>RG (Reality Gaming)</font> is an international Online Community made up of ex-forces and senior online professionals. We are an 18+ mature tactical group with decades of experience conducting large scale operations and campaigns.
<br/> <br/>
Our group has been playing the ARMA series since 2007 and have a structured mission building team dedicated to creating realistic scenarios for our highly trained members. Our community uses military rank and allows you to qualify and earn specialist roles within our Task Force. We use a highly edited customised version of ARMA 3 for all our missions development alongside scheduled training every week.
<br/><br/>
Our Community offers you:<br/>
The chance to chat with others on our Teamspeak (3) server.<br/>
Exchange game experiences on our forum.<br/>
Post new game video's within our YouTube channel.<br/>
Play on our high performance dedicated Servers and Participate in our gaming events.<br/>
Gain real life experience and develop leadership skills.<br/>
Train in ACRE 2 and ARMA 3 weapons system.<br/>
First hand training from real soldiers.<br/>
Our spirit and friendship developed over several years.<br/><br/>
Visit us at http://www.realitygamer.org
"
]];