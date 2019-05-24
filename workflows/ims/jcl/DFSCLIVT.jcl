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
//ASSEM1   PROC SRC=TEMPNAME
//*
//C        EXEC PGM=ASMA90,PARM='OBJECT,NODECK'
//SYSPRINT DD SYSOUT=*
//SYSLIB   DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSMAC
//         DD DISP=SHR,DSN=SYS1.MACLIB
//         DD DISP=SHR,DSN=ASM.SASMMAC2
//SYSLIN   DD UNIT=SYSALLDA,DISP=(,PASS,DELETE),SPACE=(CYL,(1,1)),
//            DCB=(RECFM=F,LRECL=80,BLKSIZE=80)
//SYSUT1   DD UNIT=SYSALLDA,DISP=(,DELETE,DELETE),SPACE=(CYL,(1,1))
//SYSUT2   DD UNIT=SYSALLDA,DISP=(,DELETE,DELETE),SPACE=(CYL,(1,1))
//SYSUT3   DD UNIT=(SYSALLDA,SEP=(SYSLIB,SYSUT1,SYSUT2)),
//            DISP=(,DELETE,DELETE),SPACE=(CYL,(1,1))
//SYSIN    DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSISRC(&SRC)
//*
//L        EXEC PGM=IEWL,
//         PARM='XREF,LIST',COND=(0,LT,C)
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DISP=(OLD,DELETE,DELETE),
//            DSN=*.C.SYSLIN,VOL=REF=*.C.SYSLIN
//         DD DDNAME=SYSIN
//RESLIB   DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL
//SYSLMOD  DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PGMLIB
//SYSUT1   DD UNIT=(SYSALLDA,SEP=(SYSLMOD,SYSLIN)),
//            DISP=(,DELETE,DELETE),SPACE=(CYL,(1,1))
//         PEND
//*********************************************************************
//DFSIVA1  EXEC PROC=ASSEM1,SRC=DFSIVA1
//L.SYSIN  DD *
 INCLUDE  RESLIB(DFSLI000)
   ENTRY  DFSIVA1
   ALIAS  DFSIVP1
   ALIAS  DFSIVPD2
    NAME  DFSIVA1(R)
/*