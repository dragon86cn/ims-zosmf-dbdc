//PROCS JCLLIB ORDER=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB
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
//HIDAM    EXEC PROC=DLIBATCH,SOUT='*',
//         MBR=DFSDDLT0,PSB=DFSIVPA,
//         DBRC=N,IRLM=N
//*
//* OVERRIDE PROC DD STATEMENTS
//*
//G.IEFRDER  DD DUMMY,
//           UNIT=SYSALLDA,
//           DCB=BLKSIZE=6144
//*
//* ADDITIONAL DD STATEMENTS
//*
//G.IEFRDER2 DD DUMMY,
//           UNIT=SYSALLDA,
//           DCB=BLKSIZE=6144
//*
//DFSIVD1  DD DISP=OLD,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1
//DFSIVD1I DD DISP=OLD,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I
//*
//DFSVSAMP DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB(DFSVSMDB)
//SYSIN    DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.INSTALL(PHONEIN)
//DFSSTAT  DD SYSOUT=*
//PRINTDD  DD SYSOUT=*
//*