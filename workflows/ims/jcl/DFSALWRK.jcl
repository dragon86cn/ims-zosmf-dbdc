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
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.INSTALL -
         NONVSAM SCRATCH
  SET MAXCC=0
//ALLOCATE EXEC PGM=IDCAMS,DYNAMNBR=200
//AMSDUMP  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.INSTALL')  -
      FILE(INSTALL)               -
	  RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(3200)               -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(5,2) CYL              -
      DIR(46)                     -
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
      VOL(${instance-DFS_DS_VOLUME1})              -
#end
      UNIT(${instance-DFS_IMS_UNIT})