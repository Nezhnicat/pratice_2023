create  table  "Music-project".City (
	CityId  int  ,
	City char(25),
	constraint  City_pk primary  key  (CityId)
);

create  table   "Music-project".Artist (
	ArtistId int,
	Artist char(40),
	constraint  Artist_pk primary  key  (ArtistId)
);

create  table  "Music-project".Weekday (
	WeekdayId int ,
	Weekday char(10),
	constraint  Weekday_pk primary  key  (WeekdayId)
);

create  table   "Music-project".Genre (
	GenreId int ,
	Genre char(30),
	constraint  Genre_pk primary  key  (GenreId)
);

create  table  "Music-project".track (
	genreid int ,
	trackid int ,
	track char(35),
	constraint  track_pk primary  key  (trackid),
	constraint  track_fk foreign  key  (genreid) references  "Music-project".genre(genreid)
);

create  table  "Music-project".users(
  CityId int  ,
  UserId char(10) ,
  constraint  users_pk primary  key  (UserId),
  constraint  usesr_fk foreign  key  (CityId) references  "Music-project".city(CityId)
  );
 
 create  table "Music-project".performances
(
   id serial primary key,
   trackid int ,
   artistid int ,
   constraint  performances_fk foreign  key  (trackid) references  "Music-project".track(trackid),
   constraint  performances_fk_1 foreign  key  (artistid) REFERENCES "Music-project".artist(artistid));

  create table "Music-project".listenings(
  id serial primary key,
  userid char(10),
  trackid int ,
  artistid int ,
  weekdayid int ,
  time float ,
  report_date date ,
  constraint  listenings_fk foreign  key  (id) references  "Music-project".performances(id),
  constraint  listenings_fk_1 foreign  key  ( userid ) references  "Music-project".users( userid ),
  constraint  listenings_fk_2 foreign  key  (trackid) references  "Music-project".track(trackid),
  constraint  listenings_fk_3 foreign  key  (artistid) references  "Music-project".artist(artistid),
  constraint  listenings_fk_4 foreign  key  (weekdayid) references "Music-project".weekday(weekdayid)
  
  );