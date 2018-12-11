//${instance-DFS_IMS_SSID}ODB1  JOB (ACCTINFO),
//             CLASS=A,MSGCLASS=1,
//             MSGLEVEL=(1,1),REGION=0M,NOTIFY=${DFS_IMS_USERID}
/*JOBPARM SYSAFF=SYE0
//MYLIB JCLLIB ORDER=(${instance-hlq}.${instance-IXUSYSHQ}.PROCLIB)
//******************************************************************
//*     ODBM Procedure
//*
//*
//*     Parameters:
//*     BPECFG  - Name of BPE member
//*     ODBMINIT- Suffix for your CSLDIxxx member
//*     PARM1   - other override parameters e.g.
//*               ARMRST  - Indicates if ARM should be used
//*               ODBMNAME- Name of the ODBM being started
//*               ODBMCFG - Suffix for config member
//*               RRS     - Indicates RRS is (Y) or is not (N) used
//*
//*               example:
//*               PARM1='ARMRST=Y,ODBMNAME=ODBM1,ODBMCFG=000,RRS=Y'
//*
//***********************************************************@SCPYRT**
//*
//*  Licensed Materials - Property of IBM
//*
//*  5635-A04
//*
//*  Copyright IBM Corp. 2007      All Rights Reserved
//*
//*  US Government Users Restricted Rights - Use, duplication or
//*  disclosure restricted by GSA ADP Schedule contract with
//*  IBM Corp.
//*
//***********************************************************@ECPYRT**
//*
//CSLODBM  PROC RGN=3000K,SOUT=A
//*            RESLIB='${instance-hlq}.${instance-IXUSYSHQ}.SDFSRESL',
//*            BPECFG=BPECONFG,
//*            ODBMINIT=001,
//*            PARM1=
//*
//ODBMPROC EXEC PGM=BPEINI00,REGION=3000K,
//  PARM='BPECFG=BPECONFG,BPEINIT=CSLDINI0,ODBMINIT=001'
//*
//STEPLIB  DD  DSN=${instance-hlq}.${instance-IXUSYSHQ}.SDFSRESL ,DISP=SHR
//*        DD  DSN=${instance-hlq}.${instance-IXUSYSHQ}.EXITLIB,DISP=SHR
//         DD  DSN=${instance-zCloud_CSSLIB},DISP=SHR
//PROCLIB  DD  DSN=${instance-hlq}.${instance-IXUSYSHQ}.PROCLIB,DISP=SHR
//SYSPRINT DD  SYSOUT=*
//SYSUDUMP DD  SYSOUT=*
//*
//         PEND
//*
//OPD      EXEC CSLODBM
/*