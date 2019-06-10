/*                                                                   *
//* ALLOCATE WORK DATA SETS
//************************************************************@SCPYRT**
//*                                                                   *
//*  LICENSED MATERIALS - PROPERTY OF IBM                             *
//*                                                                   *
//*  5635-A04                                                         *
//*                                                                   *
//*      COPYRIGHT IBM CORP. 1989,2015 ALL RIGHTS RESERVED            *
//*                                                                   *
//*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR      *
//*  DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH          *
//*  IBM CORP.                                                        *
//*                                                                   *
//************************************************************@ECPYRT**
//* SCRATCH THE DATA SETS IF THEY ALREADY EXIST
//*
//SCRATCH  EXEC PGM=IDCAMS,DYNAMNBR=200
//SYSPRINT DD SYSOUT=*
//AMSDUMP  DD SYSOUT=*
//SYSIN    DD *
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I CLUSTER
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC101 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC102 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC103 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC101 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC102 -
        NONVSAM SCRATCH
 DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC103 -
        NONVSAM SCRATCH
//*
  SET MAXCC=0
//ALLOCATE EXEC PGM=IDCAMS,DYNAMNBR=200
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  ALLOCATE - 
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1') -
     FILE(DFSIVD1)                -
     RECFM(F,B,S)               -
     LRECL(2048)                -
     BLKSIZE(2048)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(2) CYLINDERS         -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC101') -
     FILE(IC101D1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(15,5) TRACKS         -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC102') -
     FILE(IC102D1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(15,5) TRACKS         -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC103') -
     FILE(IC103D1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(15,5) TRACKS         -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC101') -
     FILE(IC101I1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(5,5) TRACKS          -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC102') -
     FILE(IC102I1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(5,5) TRACKS          -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
     DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC103') -
     FILE(IC103I1)              -
     DSORG(PS)                  -
     NEW CATALOG                -
     SPACE(5,5) TRACKS          -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})
 DEFINE CLUSTER(                                -
                NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I) -
                INDEXED                         -
                KEYS(10 05)                     -
                FREESPACE(10 10)                -
                RECORDSIZE(16 16)               -
                SHAREOPTIONS(3 3)               -
                SPEED                           -
                UNIQUE                          -
                #if(${instance-DFS_SMS_ENVIRONMENT} == false)
                    VOL(${instance-DFS_DS_VOLUME1})              -
                #end
                TRACKS(05)                      -
               )                                -
           DATA(                                -
                NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I.DATA) -
               CONTROLINTERVALSIZE(2048)       -
              )                                -
         INDEX(                                -
               NAME(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I.INDX) -
               CONTROLINTERVALSIZE(4096)       -
              )
//*