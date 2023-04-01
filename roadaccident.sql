create table trafficviolation (
state varchar,
	overspeedingaccident int,
	overspeedingdeath int,
	overspeedingmajor int,
	overspeedingminor int,
	overspeedingtotal int,
	drunkdriveaccident int,
	drunkdrivedeath int,
	drunkdrivemajor int,
	drunkdriveminor int,
	drunkdrivetotal int,
	wrongsidedriveaccident int,
	wrongsidedrivedeath int,
	wrongsidedrivemajor int,
	wrongsidedriveminor int,
	wrongsidedrivetotal int,
	redlightaccident int,
	redlightdeath int,
	redlightmajor int,
	redlightminor int,
	redlighttotal int,
	useofphoneaccident int,
	useofphonedeath int,
	useofphonemajor int,
	useofphoneminor int,
	useofphonetotal int,
	otheraccident int,
	otherdeath int,
	othermajor int,
	otherminor int,
	othertotal int
);
select * from trafficviolation;


create table diffvehicle(
state varchar,
	walkeraccident int,
	walkerdeath int,
	walkermajor int,
	walkerminor int,
	bicycleaccident int,
	bicycledeath int,
	bicyclemajor int,
	bicycleminor int,
	bikeaccident int,
	bikedeath int,
	bikemajor int,
	bikeminor int,
	rickshawaccident int,
	rickshawdeath int,
	rickshawmajor int, 
	rickshawminor int,
	caraccident int,
	cardeath int,
	carmajor int,
	carminor int,
	truckaccident int,
	truckdeath int,
	truckmajor int,
	truckminor int,
	busaccident int,
	busdeath int,
	busmajor int,
	busminor int,
	evaccident int,
	evdeath int,
	evmajor int,
	evminor int,
	otheraccident int,
	otherdeath int,
	othermajor int,
	otherminor int,
	totalaccident int,
	totaldeath int,
	totalmajor int,
	totalminor int
);

select * from diffvehicle;

create table deaddriver(
state varchar,
	m18 int,
	f18 int,
	m1825 int,
	f1825 int,
	m2535 int,
	f2535 int,
	m3545 int,
	f3545 int,
	m4560 int,
	f4560 int,
	m60 int,
	f60 int,
	ageunknownm int,
	ageunknownf int
);

select * from deaddriver;


create table deadpassenger(
state varchar,
	m18 int,
	f18 int,
	m1825 int,
	f1825 int,
	m2535 int,
	f2535 int,
	m3545 int,
	f3545 int,
	m4560 int,
	f4560 int,
	m60 int,
	f60 int,
	ageunknownm int,
	ageunknownf int
);

select * from deadpassenger;



create table deadpedestrians(
state varchar,
	m18 int,
	f18 int,
	m1825 int,
	f1825 int,
	m2535 int,
	f2535 int,
	m3545 int,
	f3545 int,
	m4560 int,
	f4560 int,
	m60 int,
	f60 int,
	ageunknownm int,
	ageunknownf int
);

select * from deadpedestrians;


create table license(
state varchar,
	valid int,
	ll int,
	without int,
	other int,
	total int
);

select * from license;


create table mfdeadinvehicle (
state varchar,
	walkerm int,
	walkerf int,
	walkert int,
	bicyclem int,
	bicyclef int,
	bicyclet int,
	bikem int,
	bikef int,
	biket int,
	rickshawm int,
	rickshawf int,
	rickshawt int,
	carm int,
	carf int,
	cart int,
	truckm int,
	truckf int,
	truckt int,
	busm int,
	busf int,
	bust int,
	evm int,
	evf int,
	evt int,
	otherm int,
	otherf int,
	othert int
);

select * from mfdeadinvehicle;


-- query lines to find desired output



--query to find deaddriver m/f

select state, m18+m1825+m2535+m3545+m4560+m60+ageunknownm as deaddriverm
from deaddriver
where state like 'Tot%' ;


select state, f18+f1825+f2535+f3545+f4560+f60+ageunknownf as deaddriverf
from deaddriver
where state like 'Tot%' ;


--query to find deadpassenger m/f

select state, m18+m1825+m2535+m3545+m4560+m60+ageunknownm as deadpassengerm
from deadpassenger
where state like 'Tot%' ;


select state, f18+f1825+f2535+f3545+f4560+f60+ageunknownf as deadpassengerf
from deadpassenger
where state like 'Tot%' ;


--query to find deadpedestrians m/f

select state, m18+m1825+m2535+m3545+m4560+m60+ageunknownm as deadpedestriansm
from deadpedestrians
where state like 'Tot%' ;


select state, f18+f1825+f2535+f3545+f4560+f60+ageunknownf as deadpedestriansf
from deadpedestrians
where state like 'Tot%' ;


--query to find total accident,death,major,minor from diff vehicle table

select state, totalaccident, totaldeath, totalmajor, totalminor
from diffvehicle
where state like 'Tot%' ;



--query to find vehicle info m&f from m&fdeadinvehicle

select state, bicyclem,bikem,rickshawm,carm,truckm,busm,evm,otherm
from mfdeadinvehicle
where state like 'Tot%' ;

select state, bicyclef,bikef,rickshawf,carf,truckf,busf,evf,otherf
from mfdeadinvehicle
where state like 'Tot%' ;



--query to find info for map from m&fdeadinvehicle table


select state, 
walkerm+bicyclem+bikem+rickshawm+carm+truckm+busm+evm+otherm as maledead,
walkerf+bicyclef+bikef+rickshawf+carf+truckf+busf+evf+otherf as femaledead,
walkert+bicyclet+biket+rickshawt+cart+truckt+bust+evt+othert as totaldead
from mfdeadinvehicle
where state not like 'Tot%' ;



--query to find reason for accident section from traffic violation table 


select state,overspeedingaccident,overspeedingdeath,overspeedingmajor,overspeedingminor,
drunkdriveaccident,drunkdrivedeath,drunkdrivemajor,drunkdriveminor,
wrongsidedriveaccident,wrongsidedrivedeath,wrongsidedrivemajor,wrongsidedriveminor,
redlightaccident,redlightdeath,redlightmajor,redlightminor,
useofphoneaccident,useofphonedeath,useofphonemajor,useofphoneminor,
otheraccident,otherdeath,othermajor,otherminor
from trafficviolation
where state like 'Tot%' ;



--query to find license related accident 

select state, valid,ll,without,other
from license
where state like 'Tot%' ;


