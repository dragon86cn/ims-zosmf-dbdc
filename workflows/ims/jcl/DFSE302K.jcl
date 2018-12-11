//COPYSKEL PROC MBR=TEMPNAME
//*
//CS       EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-hlq}.${instance-IXUSYSHQ}.PROCLIB(&MBR)
//        PEND
//***************************************************************
//*
//***************************************************************
//* THE FOLLOWING STEP ADDS THE OLCUTL MEMBER TO IMS PROCLIB
//* FOR ONLINE CHANGE OPERATIONS
//***************************************************************
//OLCUTL  EXEC PROC=COPYSKEL,MBR=OLCUTL
//CS.SYSUT1 DD DATA,DLM=ZZ
//*
//       PROC TYPE=,IN=,OUT=,SOUT=A,SYS=,SYS2=,
//        OLCGLBL='DUMMY,',OLCLOCL=
//S      EXEC PGM=DFSUOCU0,PARM=(&TYPE,&IN,&OUT)
//STEPLIB  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.SDFSRESL,DISP=SHR
//MODBLKS  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.MODBLKS,DISP=SHR
//MODBLKSA DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.MODBLKSA,DISP=SHR
//MODBLKSB DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.MODBLKSB,DISP=SHR
//IMSACB   DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.ACBLIB,DISP=SHR
//IMSACBA  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.ACBLIBA,DISP=SHR
//IMSACBB  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.ACBLIBB,DISP=SHR
//FORMAT   DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.FORMAT,DISP=SHR
//FORMATA  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.FORMATA,DISP=SHR
//FORMATB  DD DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS2.FORMATB,DISP=SHR
//MODSTAT  DD &OLCLOCL.DSN=${instance-hlq}.${instance-IXUSYSHQ}.&SYS.MODSTAT,
//         DISP=SHR
//OLCSTAT  DD &OLCGLBL.DSN=IMSPLEX.OLCSTAT,
//         DISP=OLD
//SYSUDUMP DD SYSOUT=&SOUT
//SYSPRINT DD SYSOUT=&SOUT
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT4   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//COPYCTL  DD DSN=&&COPYCTL,DISP=(NEW,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(1,1))
ZZ