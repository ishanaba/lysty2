CREATE USER IF NOT EXISTS SA SALT 'a28bd8cb145c71c7' HASH '9a07a87f88dc472aae9ee0f6b6126f96a1bceb938fb637c276dcf3a91b6bd170' ADMIN;
CREATE CACHED TABLE PUBLIC.SONGS( 
    ID INT DEFAULT NOT NULL AUTO_INCREMENT , 
    NAME VARCHAR(255), 
    PATH VARCHAR(2500) 
);
ALTER TABLE PUBLIC.SONGS ADD CONSTRAINT PUBLIC.CONSTRAINT_4 PRIMARY KEY(ID);

CREATE CACHED TABLE PUBLIC.ATTRIB_DEFINITIONS( 
    ID INT DEFAULT NOT NULL AUTO_INCREMENT, 
    NAME VARCHAR(255), 
    VALUETTYPE VARCHAR(255) 
);
ALTER TABLE PUBLIC.ATTRIB_DEFINITIONS ADD CONSTRAINT PUBLIC.CONSTRAINT_1 PRIMARY KEY(ID);
CREATE CACHED TABLE PUBLIC.ATTRIBS( 
    SONGID INT SELECTIVITY 12, 
    ATTRIBUTE VARCHAR(255) SELECTIVITY 1, 
    VALUE VARCHAR(2500) SELECTIVITY 30 
);
CREATE CACHED TABLE PUBLIC.SELPROFILES( 
    ID INT DEFAULT NOT NULL AUTO_INCREMENT, 
    NAME VARCHAR(255), 
    SIZE INT, 
    SIZETYPE INT, 
    STRATEGY VARCHAR(255), 
    STRATEGYATTRIBS TEXT 
);
ALTER TABLE PUBLIC.SELPROFILES ADD CONSTRAINT PUBLIC.CONSTRAINT_15 PRIMARY KEY(ID);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SELPROFILES;
CREATE CACHED TABLE PUBLIC.SELPROFILE_SONGS( 
    SELPROFILEID INT, 
    SONGID INT, 
    RELPOSITION INT 
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.SELPROFILE_SONGS;
CREATE CACHED TABLE PUBLIC.FOLDER_INDEX_TIMESTAMPS( 
    FOLDER VARCHAR(2500), 
    LASTINDEXTIME LONG 
);
-- 112 +/- SELECT COUNT(*) FROM PUBLIC.FOLDER_INDEX_TIMESTAMPS;
CREATE CACHED TABLE PUBLIC.EXTRACTORS( 
    ID INT DEFAULT NOT NULL AUTO_INCREMENT,
    NAME VARCHAR(500), 
    ADDEDTIME LONG 
);
ALTER TABLE PUBLIC.EXTRACTORS ADD CONSTRAINT PUBLIC.CONSTRAINT_49 PRIMARY KEY(ID);
-- 1 +/- SELECT COUNT(*) FROM PUBLIC.EXTRACTORS;
CREATE CACHED TABLE PUBLIC.CONFIG( 
    NAME VARCHAR(255), 
    VALUE VARCHAR(255) 
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.CONFIG;
insert into config (name,value) values ('last_run_script','0');