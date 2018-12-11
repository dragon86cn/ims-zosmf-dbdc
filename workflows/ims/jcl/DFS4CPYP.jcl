//* SKELETON: DFSIXSED
//*
//* FUNCTION: COPY STARTED TASK (STC) PROCEDURES TO
//*           ${instance-zCloud_PROCLIB}
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
//*
//*********************************************************************
//* CTRL NAME= ${instance-DFS_IMS_SSID}CTL    v
//* DBRC NAME= ${instance-DFS_IMS_SSID}DRC    v
//* DLI NAME=  ${instance-DFS_IMS_SSID}DLI    v
//* OM  NAME=  ${instance-DFS_IMS_SSID}OM     v
//* SCI NAME=  ${instance-DFS_IMS_SSID}SC     v
//* RM  NAME=  ${instance-DFS_IMS_SSID}RM     v
//*********************************************************************
//COPYSTC  PROC
//*
//CS       EXEC PGM=IEBCOPY
//SYSPRINT DD SYSOUT=*
//IMSPROC  DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB
//SYS1PROC DD DISP=SHR,DSN=${instance-zCloud_PROCLIB}
//SYSUT3   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//SYSUT4   DD UNIT=SYSALLDA,SPACE=(CYL,(1,1))
//        PEND
//STEP01   EXEC PROC=COPYSTC
//CS.SYSIN DD *
           COPY INDD=((IMSPROC,R)),OUTDD=SYS1PROC
             SELECT MEMBER=((IMS,${instance-DFS_IMS_SSID}CTL))
             SELECT MEMBER=${instance-DFS_IMS_SSID}DLI
             SELECT MEMBER=${instance-DFS_IMS_SSID}DRC
             SELECT MEMBER=${instance-DFS_IMS_SSID}OM
             SELECT MEMBER=${instance-DFS_IMS_SSID}SC
             SELECT MEMBER=${instance-DFS_IMS_SSID}RM
//*