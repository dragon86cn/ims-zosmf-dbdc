//* SKELETON: DFSIXSC0                                                *
//*                                                                   *
//* FUNCTION: ALLOCATE THE SYSTEM DATA SETS NEEDED BY SYSDEF          *
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
//SCRATCH  EXEC PGM=IDCAMS,DYNAMNBR=200
//AMSDUMP  DD DUMMY
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.OBJDSET -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.LGENIN -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.LGENOUT -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.FORMAT -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.TFORMAT -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REFERAL -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSMAC -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.OPTIONS -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSMAC -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSLOAD -
         NONVSAM SCRATCH
  DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSSRC -
         NONVSAM SCRATCH
  SET MAXCC=0
//*
//* ALLOCATE NEW DATA SETS
//*
//ALLOCATE EXEC PGM=IDCAMS,DYNAMNBR=200
//AMSDUMP  DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB')  -
      FILE(PROCLIB)               -
	  RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(3200)               -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(5,2) CYL              -
      DIR(200)                     -
      VOL(${instance-DFS_DS_VOLUME1})                 -
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.OBJDSET')  -
      FILE(OBJDSET)               -
      RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(3200)          -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(10,3) CYL             -
      DIR(120)                    -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.LGENIN')   -
      FILE(LGENIN)                -
      RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(11440)              -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(8,3) CYL              -
      DIR(92)                     -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.LGENOUT')  -
      FILE(LGENOUT)               -
      RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(11440)              -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(5,3) CYL              -
      DIR(92)                     -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
   ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.FORMAT') -
      FILE(FORMAT)                -
      RECFM(U)                    -
      BLKSIZE(32760)              -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(2,2) CYL              -
      DIR(92)                     -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.TFORMAT') -
      FILE(TFORMAT)               -
      RECFM(U)                    -
      BLKSIZE(32760)              -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(2) CYL                -
      DIR(46)                     -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
  ALLOCATE -
      DSNAME('${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REFERAL')  -
      FILE(REFERAL)               -
      RECFM(F,B)                  -
      LRECL(80)                   -
      BLKSIZE(0)                  -
      DSORG(PO)                   -
      DSNTYPE(PDS)                -
      NEW CATALOG                 -
      SPACE(2,2) CYL              -
      DIR(92)                     -
      VOL(${instance-DFS_DS_VOLUME1})          -
      UNIT(${instance-DFS_IMS_UNIT})
/*
//*
//*
//STEP1B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSRESL),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,(83,10,850))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSRESL,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP2B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSMAC,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},DSNTYPE=LIBRARY,
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSMAC),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(2776,4000))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSMAC,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP3B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.OPTIONS,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.OPTIONS),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(1,1,2))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.OPTIONS,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP4B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.MODBLKS),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(22,15,50))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.MODBLKS,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP5B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSMAC,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},DSNTYPE=LIBRARY,
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSMAC),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(1848,270))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSMAC,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP6B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSLOAD,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},DSNTYPE=LIBRARY,
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSLOAD),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(1840,250))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSLOAD,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*
//STEP7B    EXEC PGM=IEBCOPY
//SYSPRINT DD  SYSOUT=A
//OUTDSN    DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSSRC,DISP=(NEW,CATLG),
//             VOL=SER=${instance-DFS_DS_VOLUME1},DSNTYPE=LIBRARY,
//             DCB=(${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSSRC),
//             UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,(3535,500))
//INDSN    DD  DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.ADFSSRC,DISP=SHR
//SYSUT3   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSUT4   DD  UNIT=${instance-DFS_IMS_UNIT},SPACE=(TRK,10)
//SYSIN    DD  *
  COPY  OUTDD=OUTDSN,INDD=INDSN
/*
//*
//*