CREATE TABLE "Music-project".City (
	CityId int  NOT NULL,
	City char(25) NOT NULL,
	CONSTRAINT City_pk PRIMARY KEY (CityId)
);

CREATE TABLE "Music-project".Artist (
	ArtistId int NOT NULL,
	Artist char(40) NOT NULL,
	CONSTRAINT Artist_pk PRIMARY KEY (ArtistId)
);

CREATE TABLE "Music-project".Weekday (
	WeekdayId int NOT NULL,
	Weekday char(10) NOT NULL,
	CONSTRAINT Weekday_pk PRIMARY KEY (WeekdayId)
);

CREATE TABLE "Music-project".Genre (
	GenreId int NOT NULL,
	Genre char(30) NOT NULL,
	CONSTRAINT Genre_pk PRIMARY KEY (GenreId)
);

CREATE TABLE "Music-project".track (
	genreid int NOT NULL,
	trackid int NOT NULL,
	track char(35) NOT NULL,
	CONSTRAINT track_pk PRIMARY KEY (trackid),
	CONSTRAINT track_fk FOREIGN KEY (genreid) REFERENCES "Music-project".genre(genreid)
);

CREATE TABLE "Music-project".users(
  CityId int  NOT NULL,
  UserId char(10)  NOT NULL,
  CONSTRAINT users_pk PRIMARY KEY (UserId),
  CONSTRAINT usesr_fk FOREIGN KEY (CityId) REFERENCES "Music-project".city(CityId)
  );
 
 CREATE TABLE "Music-project".performances
(
   id serial primary key,
   trackid int not null,
   artistid int not null,
   CONSTRAINT performances_fk FOREIGN KEY (trackid) REFERENCES "Music-project".track(trackid),
   CONSTRAINT performances_fk_1 FOREIGN KEY (artistid) REFERENCES "Music-project".artist(artistid));

  create table "Music-project".listenings(
  id serial primary key,
  userid char(10)not null,
  trackid int not null,
  artistid int not null,
  weekdayid int not null,
  time float not null,
  report_date date not null,
  CONSTRAINT listenings_fk FOREIGN KEY (id) REFERENCES "Music-project".performances(id),
  CONSTRAINT listenings_fk_1 FOREIGN KEY ( userid ) REFERENCES "Music-project".users( userid ),
  CONSTRAINT listenings_fk_2 FOREIGN KEY (trackid) REFERENCES "Music-project".track(trackid),
  CONSTRAINT listenings_fk_3 FOREIGN KEY (artistid) REFERENCES "Music-project".artist(artistid),
  CONSTRAINT listenings_fk_4 FOREIGN KEY (weekdayid) REFERENCES "Music-project".weekday(weekdayid)
  
  );