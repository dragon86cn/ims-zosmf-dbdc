//* SKELETON: DFSIXSOY
//*********************************************************************
//* FUNCTION:  ALLOCATE AND PREPARE CATALOG DATABASES ENVIRONMENT
//*********************************************************************
//*
//ZCLUDPRC JCLLIB ORDER=(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB)
//********************************************************
//* SCRATCH DATA SETS
//********************************************************
//SCRATCH  EXEC PGM=IDCAMS,DYNAMNBR=200
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.CATDEF           PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.A00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.B00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.C00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.D00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.L00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.X00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCX000.A00001  PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.HWSRCDR          PURGE
    SET MAXCC=0
/*
//********************************************************
//* ALLOCATE CATALOG DATA SETS
//********************************************************
//ALLOCATE EXEC PGM=IDCAMS,DYNAMNBR=200
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
   ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.CATDEF') -
     FILE(CATDF)                 -
       RECFM(F,B)                  -
       LRECL(80)                   -
       BLKSIZE(3200)          -
       DSORG(PS)                   -
       NEW CATALOG                 -
       SPACE(50,10) CYL -
      VOL(${instance-DFS_DS_VOLUME2})              -
      UNIT(${instance-DFS_IMS_UNIT})
   ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.A00001') -
      FILE(A00001)               -
      RECFM(F,B,S)               -
      LRECL(4096)                -
      BLKSIZE(4096)              -
      DSORG(PS)                  -
      NEW CATALOG                -
      SPACE(20,20) CYLINDERS     -
      VOLUME(${instance-DFS_DS_VOLUME2})          -
      UNIT(${instance-DFS_IMS_UNIT})
   ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.B00001') -
      FILE(B00001)               -
      RECFM(F,B,S)               -
      LRECL(4096)                -
      BLKSIZE(4096)              -
      DSORG(PS)                  -
      NEW CATALOG                -
      SPACE(20,20) CYLINDERS     -
      VOLUME(${instance-DFS_DS_VOLUME2})          -
      UNIT(${instance-DFS_IMS_UNIT})
   ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.C00001') -
      FILE(C00001)               -
      RECFM(F,B,S)               -
      LRECL(4096)                -
      BLKSIZE(4096)              -
      DSORG(PS)                  -
      NEW CATALOG                -
      SPACE(20,20) CYLINDERS     -
      VOLUME(${instance-DFS_DS_VOLUME2})          -
      UNIT(${instance-DFS_IMS_UNIT})
   ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.D00001') -
      FILE(D00001)                 -
      RECFM(F,B,S)               -
      LRECL(4096)                -
      BLKSIZE(4096)              -
      DSORG(PS)                  -
      NEW CATALOG                -
      SPACE(20,20) CYLINDERS     -
      VOLUME(${instance-DFS_DS_VOLUME2})          -
      UNIT(${instance-DFS_IMS_UNIT})
  DEFINE CLUSTER(                                 -
                 NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.X00001) -
                 CYLINDERS(2 1)                   -
                 REUSE                            -
                 INDEXED                          -
                 KEYS(16,5)                       -
                 FREESPACE(80 10)                 -
                 RECORDSIZE(22 22)                -
                 SHAREOPTIONS(3 3)                -
                 SPEED                            -
                 VOLUMES(${instance-DFS_DS_VOLUME2})               -
                )                                 -
            DATA(CONTROLINTERVALSIZE(4096))
  DEFINE CLUSTER(                                 -
                 NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.L00001) -
                 CYLINDERS(1 1)                   -
                 REUSE                            -
                 FREESPACE(80 10)                 -
                 SHAREOPTIONS(3 3)                -
                 SPEED                            -
                 VOLUMES(${instance-DFS_DS_VOLUME2})               -
                )                                 -
            DATA(                                   -
                 NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.L00001.D) -
                 CISZ(512)                          -
                 KEY(9,0)                           -
                 RECSZ(50,50)                       -
                )                                   -
           INDEX(                                   -
                 NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000.L00001.S) -
                 CISZ(2048)                         -
                )
  DEFINE CLUSTER(                                 -
                 NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCX000.A00001) -
                 CYLINDERS(2 1)                   -
                 REUSE                            -
                 INDEXED                          -
                 KEYS(37,45)                            -
                 FREESPACE(80 10)                       -
                 RECORDSIZE(82 82)                      -
                 SHAREOPTIONS(3 3)                      -
                 SPEED                                  -
                 VOLUMES(${instance-DFS_DS_VOLUME2})                     -
                )                                       -
            DATA(CONTROLINTERVALSIZE(4096))
/*
//********************************************************
//* ALLOCATION FOR IMS CONNECT TRACE RECORDER DATA SET
//********************************************************
//ALLOCAT2 EXEC PGM=IEFBR14
//HWSRCDR  DD  DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.HWSRCDR,
//             DISP=(NEW,CATLG,DELETE),
//             UNIT=${instance-DFS_IMS_UNIT},
//             VOL=SER=${instance-DFS_DS_VOLUME2},
//             DCB=(RECFM=VB,LRECL=22524,BLKSIZE=22528),
//             SPACE=(CYL,(50),,CONTIG)
//*
//********************************************************
//* FUCNTION: COPY DBD FOR THE ZCLOUD IMS CATALOG DB
//********************************************************
//COPY     EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//IN1      DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL
//*
//OUT1     DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DBDLIB
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(2,2))
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(2,2))
//SYSUT4   DD UNIT=SYSDA,SPACE=(CYL,(2,2))
//SYSIN    DD *
  COPY INDD=((IN1,R)),OUTDD=OUT1
  SELECT M=(DFSCD000,DFSCX000)
//********************************************************
//* FUCNTION: COPY PSB FOR THE ZCLOUD IMS CATALOG DB
//********************************************************
//COPY     EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//IN1      DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL
//*
//OUT1     DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PSBLIB
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(2,2))
//SYSUT4   DD UNIT=SYSDA,SPACE=(CYL,(2,2))
//SYSIN    DD *
  COPY INDD=((IN1,R)),OUTDD=OUT1
  SELECT M=(DFSCPL00,DFSCP001,DFSCP000)
//*
//*  FUNCTION: PERFORM ACBGEN FOR THE CATALOG DBD AND PSB
//*
//ACBGEN   EXEC PROC=ACBGEN,SOUT='*',COMP='POSTCOMP'
//G.SYSIN  DD *
  BUILD PSB=ALL
//*
//*  Defining the IMS Catalog without DBRC
//*
//CATDEF   EXEC PGM=DFS3UCD0,REGION=0M
//DFSRESLB DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,DISP=SHR
//STEPLIB  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,DISP=SHR
//IMS      DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DBDLIB
//DFSHDBSC DD  DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.CATDEF,DISP=SHR
//SYSPRINT DD  SYSOUT=A
//SYSUDUMP DD  SYSOUT=A
//SYSIN    DD  *
HALDB=(NAME=DFSCD000)
PART=(NAME=DFSCD000,PART=DFSD001,
      DSNPREFX=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCD000,
      KEYSTHEX=FFFFFFFFFFFFFFFFFFFFFFFFFFFF)
HALDB=(NAME=DFSCX000)
PART=(NAME=DFSCX000,PART=DFSX001,
      DSNPREFX=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSCX000,
      KEYSTHEX=FFFFFFFFFFFFFFFFFFFFFFFFFFFF)