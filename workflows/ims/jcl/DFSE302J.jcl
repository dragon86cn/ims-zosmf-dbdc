//PROCUPDT PROC MBR=TEMPNAME
//*
//P        EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB(&MBR)
//SYSIN    DD DUMMY
//        PEND
//INSTUPDT PROC MBR=TEMPNAME  
//*
//P        EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.INSTALL(&MBR)
//SYSIN    DD DUMMY
//        PEND
//*********************************************************************
//* ADD SCRIPT TO TIME CONTROL OPTION (TCO) DATA SET
//*********************************************************************
//TCFUPDT  PROC MBR=TEMPNAME
//*
//T        EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.TCFSLIB(&MBR)
//SYSIN    DD DUMMY
//        PEND
//***************************************************************
//COPYSKEL PROC MBR=TEMPNAME
//*
//CS       EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSIN    DD DUMMY
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB(&MBR)
//        PEND
//***************************************************************
//*
//***************************************************************
//* THE FOLLOWING STEP ADDS THE OLCUTL MEMBER TO IMS PROCLIB
//* FOR ONLINE CHANGE OPERATIONS
//***************************************************************
//OLCUTL  EXEC PROC=COPYSKEL,MBR=OLCUTL
//CS.SYSUT1 DD DATA,DLM=$$
//*
//       PROC TYPE=,IN=,OUT=,SOUT=A,SYS=,SYS2=,
//        OLCGLBL='DUMMY,',OLCLOCL=
//S      EXEC PGM=DFSUOCU0,PARM=(&TYPE,&IN,&OUT)
//STEPLIB  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.SDFSRESL,DISP=SHR
//MODBLKS  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.MODBLKS,DISP=SHR
//MODBLKSA DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSA,DISP=SHR
//MODBLKSB DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.MODBLKSB,DISP=SHR
//IMSACB   DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.ACBLIB,DISP=SHR
//IMSACBA  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.ACBLIBA,DISP=SHR
//IMSACBB  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.ACBLIBB,DISP=SHR
//FORMAT   DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.FORMAT,DISP=SHR
//FORMATA  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.FORMATA,DISP=SHR
//FORMATB  DD DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS2.FORMATB,DISP=SHR
//MODSTAT  DD &OLCLOCL.DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.&SYS.MODSTAT,
//         DISP=SHR
//OLCSTAT  DD &OLCGLBL.DSN=IMSPLEX.OLCSTAT,
//         DISP=OLD
//SYSUDUMP DD SYSOUT=&SOUT
//SYSPRINT DD SYSOUT=&SOUT
//SYSUT3   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//SYSUT4   DD UNIT=SYSDA,SPACE=(CYL,(1,1))
//COPYCTL  DD DSN=&&COPYCTL,DISP=(NEW,DELETE),
//         UNIT=SYSDA,SPACE=(CYL,(1,1))
$$
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSVSMXX MEMBER TO IMS PROCLIB
//* WHICH WILL BE USED BY THE BATCH IMS SYSTEMS.
//* THIS MEMBER DEFINES THE ISAM/OSAM AND VSAM BUFFER POOLS,
//* AND TRACE OPTIONS.
//*
//***************************************************************
//***************************************************************
//DFSVSMDB EXEC PROC=PROCUPDT,MBR=DFSVSMDB
//P.SYSUT1 DD *
VSRBF=4096,5
VSRBF=2048,5
VSRBF=1024,5
VSRBF=512,5
IOBF=(8192,5)
IOBF=(2048,5)
OPTIONS,BGWRT=YES,INSERT=SKP,DUMP=YES
OPTIONS,DL/I=OUT,LOCK=ON,DISP=ON,SCHD=ON,DLOG=ON,LATC=ON,SUBS=ON
DLITRACE,LOG=YES,COMP
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSSBPRM MEMBER TO IMS PROCLIB.  THIS
//* MEMBER WILL BE REFERENCED VIA THE DFSCTL DD STATEMENT IN IMS
//* BATCH AND ONLINE DEPENDENT REGIONS.
//* THIS MEMBER DEFINES THE OSAM SEQUENTIAL BUFFERING CONTROL
//* STATEMENTS.
//***************************************************************
//***************************************************************
//DFSSBPRM EXEC PROC=PROCUPDT,MBR=DFSSBPRM
//P.SYSUT1 DD *
SBPARM ACTIV=COND,BUFSETS=4,DB=IVPDB1
SBIC
SBCO
SBSNAP BHBUF=NO,SBBUFCB=NO,SBBUF=NO
SBESNAP EVAL=NEG
SNAPDEST LOG
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSVSMXX MEMBER TO IMS PROCLIB
//* WHICH WILL BE USED BY THE DBC, DBT, XRF, AND DCC SYSTEMS.
//* THIS MEMBER DEFINES:
//*    - ISAM/OSAM AND VSAM BUFFER POOLS
//*    - TRACE OPTIONS
//*    - INITIAL OLDS AND WADS SPECIFICATIONS
//***************************************************************
//***************************************************************
//DFSVSMDC EXEC PROC=PROCUPDT,MBR=DFSVSMDC
//P.SYSUT1 DD *
VSRBF=8192,5
VSRBF=4096,5
VSRBF=2048,5
VSRBF=1024,5
VSRBF=512,5
IOBF=(8192,5,Y,Y)
IOBF=(2048,5,Y,Y)
SBONLINE,MAXSB=10
OPTIONS,BGWRT=YES,INSERT=SKP,DUMP=YES,DUMPIO=YES
OPTIONS,VSAMFIX=(BFR,IOB),VSAMPLS=LOCL
OPTIONS,DL/I=OUT,LOCK=OUT,DISP=OUT,SCHD=OUT,DLOG=OUT,LATC=ON,SUBS=ON
OPTIONS,STRG=ON
OLDSDEF OLDS=(00,01,02,03,04,05,99),BUFNO=005,MODE=DUAL
WADSDEF WADS=(0,1,8,9)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSHSSP1 MEMBER TO IMS PROCLIB.  THIS
//* MEMBER WILL BE REFERENCED VIA THE DFSCTL DD STATEMENT IN IMS
//* BMP DEPENDENT REGIONS.
//* THIS MEMBER DEFINES THE DEDB HSSP CONTROL STATEMENTS.
//***************************************************************
//***************************************************************
//DFSHSSP1 EXEC PROC=PROCUPDT,MBR=DFSHSSP1
//P.SYSUT1 DD *
SETO DB=IVPDB3,PCB=HSSP,IC=(1,CONTINUE)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSHSSP2 MEMBER TO IMS PROCLIB.  THIS
//* MEMBER WILL BE REFERENCED VIA THE DFSCTL DD STATEMENT IN IMS
//* BMP DEPENDENT REGIONS.
//* THIS MEMBER DEFINES THE DEDB HSSP CONTROL STATEMENTS.
//***************************************************************
//***************************************************************
//DFSHSSP2 EXEC PROC=PROCUPDT,MBR=DFSHSSP2
//P.SYSUT1 DD *
SETO DB=DBFSAMD3,PCB=CUSPCB,IC=(1,CONTINUE)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSFIXNN MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES FIXED PAGES IN THE IMS VIRTUAL
//* CONTROL REGION.
//***************************************************************
//***************************************************************
//DFSFIXDC EXEC PROC=PROCUPDT,MBR=DFSFIXDC
//P.SYSUT1 DD *
NUC=033
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSDRFNN MEMBER TO IMS PROCLIB.
//*
//***************************************************************
//***************************************************************
//DFSDRFDC EXEC PROC=PROCUPDT,MBR=DFSDRFDC
//P.SYSUT1 DD *
* THIS IS A DUMMY COMMENT ENTRY
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSDSCTX MEMBER TO IMS PROCLIB.
//*
//* THIS IS A NULL MEMBER
//***************************************************************
//***************************************************************
//DFSDSCTX EXEC PROC=PROCUPDT,MBR=DFSDSCTI
//P.SYSUT1 DD *
* THIS IS A DUMMY COMMENT ENTRY
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSMPLXX MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES MODULES TO BE PRELOADED INTO AN IMS
//* REGION.
//***************************************************************
//***************************************************************
//DFSMPLDC EXEC PROC=PROCUPDT,MBR=DFSMPLDC
//P.SYSUT1 DD *
CSQACLST,CSQAMLST,CSQAPRH,CSQAVICM,CSQFSALM,CSQQDEFV,
CSQQCONN,CSQQDISC,CSQQTERM,CSQQINIT,CSQQBACK,CSQQCMMT,
CSQQESMT,CSQQPREP,CSQQTTHD,CSQQWAIT,CSQQNORM,CSQQSSOF,
CSQQSSON,CSQFSTAB,CSQQRESV,CSQQSNOP,CSQQCMND,CSQQCVER,
CSQQTMID,CSQQTRGI,CSQQCON2,
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSVFLQQ MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES MODULES TO BE MANAGED BY MVS VIRTUAL
//* FETCH FOR AN IMS MESSAGE PROCESSING REGION.
//***************************************************************
//***************************************************************
//DFSVFLDC EXEC PROC=PROCUPDT,MBR=DFSVFLDC
//P.SYSUT1 DD *
IEFBR14
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSINTXX MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES PRE-INITIALIZATION ROUTINES FOR AN
//* IMS DEPENDENT REGION.
//***************************************************************
//***************************************************************
//DFSINTDC EXEC PROC=PROCUPDT,MBR=DFSINTDC
//P.SYSUT1 DD *
IEFBR14
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DBFMSDBX MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES THE MSDB START PROCEDURE.
//***************************************************************
//***************************************************************
//DBFMSDBC EXEC PROC=PROCUPDT,MBR=DBFMSDBC
//P.SYSUT1 DD *
DBD=DBFSAMD1,NBRSEGS=2,F
DBD=DBFSAMD2,NBRSEGS=2,F
DBD=IVPDB4,NBRSEGS=6,F
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSTCF MEMBER TO IMS TCFSLIB.
//* THIS MEMBER DEFINES THE DEFAULT STARTUP SCRIPT FOR TCO.
//*
//DFSTCF   EXEC PROC=TCFUPDT,MBR=DFSTCF
//T.SYSUT1 DD DATA,DLM=$$
/STA DC
/OPN NODE USER1
/OPN NODE USER2
/STA REGION IMSMSG
*TIME      DFSTXIT0            S                       ****
$$
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSJVMAP MEMBER TO IMS PROCLIB.
//* THIS MEMBER MAPS THE PSBs TO JAVA APPLICATION NAMES.
//***************************************************************
//***************************************************************
//DFSJVMAP EXEC PROC=PROCUPDT,MBR=DFSJVMAP
//P.SYSUT1 DD *
**********************************************************************
* This is a mapping of PSB names to Java samples.
* The Java samples are delivered in the samples.jar file.
* The location of this samples.jar file must be specified separately
* by the DFSJVMMS member in the shareable application classpath.
* PSB          Regions   Java programs
* --------     -------   -------------
* DFSIVP37     JMP       IMSIVP.class
* DFSIVP67     JBP       IMSIVPJBP.class
**********************************************************************
DFSIVP37=samples/ivp/ims/IMSIVP
*
**********************************************************************
* The exec parms in the JBP region proc are set as:
* MBR=DFSJBP and PSB=DFSIVP67
**********************************************************************
DFSJBP=samples/ivp/ims/IMSIVPJBP
*
DFSCATS2=samples/ivp/opendb/OpenDBCatalogSQLType2
DFSCATD2=samples/ivp/opendb/OpenDBCatalogDLIType2
*
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSJVMEV MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES THE JVM ENVIRONMENT.
//*
//DFSJVMEV EXEC PROC=PROCUPDT,MBR=DFSJVMEV
//P.SYSUT1 DD DATA,DLM='$$'
**********************************************************************
* Specify the location of Java native code (libJavTDLI.so) and Java
Virtual Machine (JVM) installation.
**********************************************************************
LIBPATH=>
/usr/lpp/java160/J6.0/bin/j9vm:>
/usr/lpp/java160/J6.0/bin/:>
/u/${instance-DFS_IMS_USERID}/>
usr/lpp/ims/ims13/imsjava/lib:>
/u/${instance-DFS_IMS_USERID}/>
usr/lpp/ims/ims13/imsjava/classic/lib
$$
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE INPUT PARM FILE TO IMS PROCLIB.
//* THIS FILE HAS INSTRUCTIONS TO CREATE AN OMVS FILE.
//***************************************************************
//***************************************************************
//DFSPARMF EXEC PROC=PROCUPDT,MBR=DFSPARMF
//P.SYSUT1 DD DATA,DLM=$$
sh echo '-Djava.class.path=>' > /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/imsudb.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/imsutm.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/samples/OpenDBIVP.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsjavaBase.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsjavaTM.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsJDBC.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsDBJCA.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsXQuery.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/imsDAS.jar:>'
                                           >> /tmp/dfsjvmpr.props;
echo '/u/${instance-DFS_IMS_USERID}/>' >> /tmp/dfsjvmpr.props;
echo 'usr/lpp/ims/ims13/imsjava/classic/ivp/samples.jar:.'
                                           >> /tmp/dfsjvmpr.props;
export X="`sed -e "s/ //g" /tmp/dfsjvmpr.props`";
echo $X > /tmp/dfsjvmpr.props;
export X="`sed -e "s/>//g" /tmp/dfsjvmpr.props`";
echo $X > /tmp/dfsjvmpr.props;
export X="`sed -e "s/ //g" /tmp/dfsjvmpr.props`";
echo $X > /tmp/dfsjvmpr.props;
$$
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSJVMMS MEMBER TO IMS PROCLIB.
//* THIS MASTER JVM MEMBER SET THE LOCATION OF JAVA ARCHIVE,
//* APPLICATION CODE, AND JVM OPTIONS.
//DFSJVMMS EXEC PROC=PROCUPDT,MBR=DFSJVMMS
//P.SYSUT1 DD *
********************************************************************
* Specify the profile that has environment settings and JVM options.
********************************************************************
-Xoptionsfile=/tmp/dfsjvmpr.props
*
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE HWSCFGIV MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES IMS CONNECT CONFIGURATION WITH FOCUS ON
//* AN ISC CONNECTION WITH A REMOTE/ISC CICS-CURRENTLY NOT
//* IMPLEMENTED
//***************************************************************
//***************************************************************
//*//HWSCFGIV EXEC PROC=PROCUPDT,MBR=HWSCFGIV
//*//P.SYSUT1 DD *
//*HWS=(ID=${instance-DFS_IMS_SSID}HWS1,XIBAREA=100,RACF=N)
//*ADAPTER=(XML=Y)
//*TCPIP=(CICSPORT=(ID=${instance-zCloud_CICSPort},KEEPAV=0),
//*EXIT=(HWSIMSO0,HWSIMSO1,HWSSMPL0,HWSSMPL1,HWSCSLO0,HWSCSLO1,
//*HWSSOAP1,HWSDPWR1),
//*HOSTNAME=TCPIP,IPV6=Y,MAXSOC=600,TIMEOUT=5000,
//*PORTID=(9999,9998,LOCAL))
//*DATASTORE=(ID=${instance-DFS_IMS_SSID},GROUP=${instance-DFS_IMSXCFGroup},
//*     MEMBER=${instance-DFS_IMS_SSID}HWS1,
//*TMEMBER=${instance-DFS_IMSPlex},DRU=HWSYDRU0)
//*ISC=(ID=${instance-DFH_CICS_SSID},NODE=ISCTCP1,
//*     LCLIMS=${instance-DFS_IMS_SSID},
//*     IMSPLEX=(MEMBER==${instance-DFS_IMS_SSID}HWS,TMEMBER=),
//*     RMTCICS=${instance-DFH_CICS_SSID},
//*     CICSAPPL=${instance-DFH_CICS_APPLID},
//*     CICSPORT=${instance-zCloud_CICSPort},
//*     CICSNETID=${instance-DFH_CICS_APPLID})
//*RMTCICS=(ID=${instance-DFH_CICS_SSID},HOSTNAME=TCPIP.HOSTNAME,
//*     PORT=${instance-zCloud_CICSPort})
//*/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE BPECFGIV MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES IMS CONNECT BPE EXECUTION ENVIRONMENT SETTINGS.
//***************************************************************
//***************************************************************
//BPECFGIV EXEC PROC=PROCUPDT,MBR=BPECFGIV
//P.SYSUT1 DD *
********************************************************************
********************************************************************
* CONFIGURATION FILE FOR BPE
********************************************************************
LANG=ENU                             /* LANGUAGE FOR MESSAGES     */
                                     /* (ENU = U.S. ENGLISH)      */
#
# DEFINITIONS FOR BPE SYSTEM TRACES
#
TRCLEV=(*,HIGH,BPE,PAGES=20)         /* DEFAULT TRACES TO HIGH    */
TRCLEV=(STG,MEDIUM,BPE)              /* STORAGE TRACE             */
TRCLEV=(CBS,MEDIUM,BPE)              /* CONTROL BLK SRVCS TRACE   */
TRCLEV=(DISP,HIGH,BPE)               /* DISPATCHER TRACE          */
TRCLEV=(AWE,HIGH,BPE)                /* AWE SERVER TRACE          */
TRCLEV=(SSRV,HIGH,BPE)               /* SYSTEM SERVICE TRACE      */
#
# DEFINITIONS FOR IMS CONNECT TRACES
#
TRCLEV=(*,HIGH,HWS,PAGES=20)         /* DEFAULT TRACES TO HIGH    */
TRCLEV=(HWSI,HIGH,HWS,PAGES=100)     /* OTMA COMM ACTIVITY TRACE  */
TRCLEV=(HWSN,HIGH,HWS,PAGES=100)     /* LOCAL OPT DRIVER ACTIVITY */
TRCLEV=(HWSW,HIGH,HWS,PAGES=100)     /* TCP/IP DRIVER ACTIVITY    */
TRCLEV=(OTMA,HIGH,HWS,PAGES=100)     /* XCF CALLS TRACE           */
TRCLEV=(TCPI,HIGH,HWS,PAGES=100)     /* TCP/IP CALLS TRACE        */
EXITMBR=(HWSEXIT0,HWS)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE DFSRSRXX MEMBER TO IMS PROCLIB.
//* THIS MEMBER SPECIFIES THE RSR OPTIONS USED BY THE ONLINE
//* ACTIVE AND TRACKING SUBSYSTEMS IN AN RSR COMPLEX.
//***************************************************************
//***************************************************************
//DFSRSR00 EXEC PROC=PROCUPDT,MBR=DFSRSR00
//P.SYSUT1 DD *
RSR(NO)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE HWSCFODB MEMBER TO IMS PROCLIB.
//* THIS MEMBER DEFINES IMS CONNECT CONFIGURATION USED TO RUN
//* THE OPEN DATABASE SAMPLE
//***************************************************************
//***************************************************************
//HWSCFODB EXEC PROC=PROCUPDT,MBR=HWSCFODB
//P.SYSUT1 DD *
HWS=(ID=${instance-DFS_IMS_SSID}HWS,XIBAREA=100,RACF=N,RRS=${instance-DFS_useRRS})
TCPIP=(HOSTNAME=TCPIP,PORTID=(${instance-DFS_REGION_TCPIPPORT},LOCAL),RACFID=SYS1,TIMEOUT=5000,
IPV6=Y,SSLPORT=(${instance-DFS_REGION_SSLTCPIPPORT}),SSLENVAR=HWSDPSSL,MAXSOC=600,
EXIT=(HWSIMSO0,HWSIMSO1,HWSSMPL0,HWSSMPL1,HWSCSLO0,HWSCSLO1,HWSSOAP1,
HWSDPWR1))
DATASTORE=(ID=${instance-DFS_IMS_SSID},GROUP=${instance-DFS_IMSXCFGroup},MEMBER=${instance-DFS_IMS_SSID}HWS,
TMEMBER=${instance-DFS_IMS_SSID},DRU=HWSYDRU0,APPL=APPLID1)
IMSPLEX=(MEMBER=${instance-DFS_IMS_SSID}HWS,TMEMBER=${instance-DFS_IMSPlex})
ADAPTER=(XML=Y)
ODACCESS=(ODBMAUTOCONN=Y,IMSPLEX=(MEMBER=HWS1,TMEMBER=${instance-DFS_IMSPlex}),
     DRDAPORT=(ID=${instance-DFS_PORTID},PORTTMOT=6000),ODBMTMOT=6000)
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE CSLDI001 MEMBER TO IMS PROCLIB.
//* THIS MEMBER IS SPECIFIED BY THE ODBMINIT= 001 AND IS USED
//* TO RUN THE OPEN DATABASE SAMPLE
//***************************************************************
//***************************************************************
//CSLDI001 EXEC PROC=PROCUPDT,MBR=CSLDI001
//P.SYSUT1 DD *
********************************************************************
**  CSLDI001 member:                                               *
**  This PROCLIB member is specified by the ODBMINIT=001           *
**  value on the ODBM start up procedure:${instance-DFS_IMS_SSID}ODB1.
**                                                                 *
**  Parameters specified here are used for ODBM initialization.    *
**                                                                 *
**  ODBM configuration parameters are specified in the             *
**  CSLDC001 PROCLIB member which can be specified by either       *
**  THE ODBMCFG=001 EXEC parameter or in this PROCLIB member       *
**  ON THE ODBMCFG=001 parameter.                                  *
**                                                                **
********************************************************************
ODBMNAME=${instance-DFS_IMS_SSID}OD${instance-DFS_PORTID}
IMSPLEX(NAME=${instance-DFS_IMSPlex})
ODBMCFG=001
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE CSLDC001 MEMBER TO IMS PROCLIB.
//* THIS MEMBER IS SPECIFIED BY THE ODBMCFG = 001 AND IS USED
//* TO RUN THE OPEN DATABASE SAMPLE
//***************************************************************
//***************************************************************
//CSLDC001 EXEC PROC=PROCUPDT,MBR=CSLDC001
//P.SYSUT1 DD *
********************************************************************
**  This PROCLIB member is specified by the ODBMCFG=001      **
**  value on the ODBM start up procedure or from the              **
**  ODBMCFG=001 parameter in the DFSDI001 PROCLIB member *
**                                                                **
**  Parameters specified here are used for ODBM configuration.    **
**                                                                **
**  This member is split into 2 sections.                         **
**                                                                **
********************************************************************
**  <SECTION=GLOBAL_DATASTORE_CONFIGURATION>                      **
**  This section defines configuration parameters that will be    **
**  used when their corresponding parameters are not present in   **
**  the local datastore section.                                  **
**                                                                **
**  Defaults shown                                                **
**  IDRETRY=0  (Can only be specified here.)                      **
**  TIMER=60   (Can only be specified here.)                      **
**  MAXTHRDS=1                                                    **
**  FPBUF=000                                                     **
**  FPBOF=000                                                     **
**  CNBA=325                                                      **
**                                                                **
********************************************************************
**  <SECTION=LOCAL_DATASTORE_CONFIGURATION>                       **
**  This section defines ODBM configuration parameters.           **
**                                                                **
**  Multiple ODBMs may be appended, each with its unique          **
**  ODBMNAME=odbmname. Optional parameters that are not           **
**  specified in an ODBM configuration statement group will       **
**  take on the corresponding parameter value specified in        **
**  the global datastore section, if one was specified.           **
**                                                                **
**  ODBM(NAME=odbmname,                                           **
**       DATASTORE(NAME=datastorename),                           **
**       ALIAS(NAME=aliasname),                                   **
**       FPBUF=nnn,                                               **
**       FPBOF=nnn,                                               **
**       CNBA=nnn,                                                **
**       MAXTHRDS=nnn                                             **
**                   )                                            **
**                                                                **
**  MAXTHRDS=                                                     **
**  FPBUF=                                                        **
**  FPBOF=                                                        **
**  CNBA=                                                         **
********************************************************************
<SECTION=LOCAL_DATASTORE_CONFIGURATION>
ODBM(NAME=${instance-zCloud_IMSODBM}
DATASTORE(NAME=${instance-DFS_IMS_SSID}
ALIAS(NAME=${instance-DFS_IMS_SSID})
)
)
//*
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE CSLDC001 MEMBER TO IMS PROCLIB.
//* THIS MEMBER IS SPECIFIED BY THE ODBMCFG = 001 AND IS USED
//* TO RUN THE OPEN DATABASE SAMPLE
//***************************************************************
//***************************************************************
//BPEODBM  EXEC PROC=PROCUPDT,MBR=BPEODBM
//P.SYSUT1 DD *
********************************************************************
* CONFIGURATION FILE FOR BPE FOR ODBM                              *
********************************************************************
LANG=ENU                            /* LANGUAGE FOR MESSAGES     */
                                    /* (ENU = U.S. ENGLISH)      */
#
# DEFINITIONS FOR BPE SYSTEM TRACES
#
TRCLEV=(*,HIGH,BPE,PAGES=20)        /* DEFAULT TRACES TO HIGH    */
TRCLEV=(STG,MEDIUM,BPE)             /* STORAGE TRACE             */
TRCLEV=(CBS,MEDIUM,BPE)             /* CONTROL BLK SRVCS TRACE   */
TRCLEV=(DISP,HIGH,BPE)              /* DISPATCHER TRACE          */
TRCLEV=(AWE,HIGH,BPE)               /* AWE SERVER TRACE          */
TRCLEV=(SSRV,HIGH,BPE)              /* SYSTEM SERVICE TRACE      */
#--------------------------------------#
# DEFINITIONS FOR CQS TRACES           #
#--------------------------------------#
TRCLEV=(*,HIGH,CQS)                   /* SET DEFAULT FOR ALL CQS    */
                                      /* TRACES TO HIGH.            */
#
#--------------------------------------#
# DEFINITIONS FOR ODBM TRACES          #
#--------------------------------------#
TRCLEV=(*,HIGH,ODBM)                  /* SET DEFAULT FOR ALL ODBM   */
                                      /* TRACES TO HIGH.            */
#--------------------------------------#
# DEFINITIONS FOR OM TRACES            #
#--------------------------------------#
TRCLEV=(*,HIGH,OM)                    /* SET DEFAULT FOR ALL OM     */
                                      /* TRACES TO HIGH.            */
#--------------------------------------#
# DEFINITIONS FOR RM TRACES            #
#--------------------------------------#
TRCLEV=(*,HIGH,RM)                   /* SET DEFAULT FOR ALL RM     */
                                     /* TRACES TO HIGH.            */
#--------------------------------------#
# DEFINITIONS FOR SCI TRACES           #
#--------------------------------------#
TRCLEV=(*,HIGH,SCI)                  /* SET DEFAULT FOR ALL SCI    */
                                     /* TRACES TO HIGH.  UNCOMMENT */
#
# DEFINITIONS FOR IMS CONNECT TRACES
#
TRCLEV=(*,HIGH,HWS,PAGES=20)        /* DEFAULT TRACES TO HIGH    */
TRCLEV=(HWSI,HIGH,HWS,PAGES=100)    /* OTMA COMM ACTIVITY TRACE  */
TRCLEV=(HWSN,HIGH,HWS,PAGES=100)    /* LOCAL OPT DRIVER ACTIVITY */
TRCLEV=(HWSW,HIGH,HWS,PAGES=100)    /* TCP/IP DRIVER ACTIVITY    */
TRCLEV=(OTMA,HIGH,HWS,PAGES=100)    /* XCF CALLS TRACE           */
TRCLEV=(TCPI,HIGH,HWS,PAGES=100)    /* TCP/IP CALLS TRACE        */
#
# DEFINITIONS FOR EXITS
#
EXITMBR=(HWSEXIT0,HWS)              /* ADAPTER EXITS             */
/*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE REPOSITORY CONFIG MEMBER TO THE
//* IMS PROCLIB. THIS MEMBER DEFINES THE PARAMETERS USED BY
//* REPOSITORY SERVER
//***************************************************************
//***************************************************************
//RSCFIGNM  EXEC PROC=PROCUPDT,MBR=RSCFIGNM
//P.SYSUT1 DD *
XCF_THREADS=8
MAX_COMMUNICATION_RETRY=32
MBR_CORE_MAX=1024
IMSPLEX(NAME=RPLXN)
RSNAME=RSRVNM
PRIMARY_CATALOG_REPOSITORY_INDEX=(
${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REPO.CATPRI.RID)
PRIMARY_CATALOG_REPOSITORY_MEMBER=(
${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REPO.CATPRI.RMD)
SECONDARY_CATALOG_REPOSITORY_INDEX=(
${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REPO.CATSEC.RID)
SECONDARY_CATALOG_REPOSITORY_MEMBER=(
${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.REPO.CATSEC.RMD)
VSAM_BUFNO=128
VSAM_BUFSIZE=8
XCF_GROUP_NAME=REPXCFGN
AUDIT=NO
AUDIT_FAIL=CONTINUE
AUDIT_LEVEL=HIGH
AUDIT_DEFAULT=NOAUDIT
/*
//*
//* THE FOLLOWING STEP ADDS THE BPE CONFIGURATION MEMBER USED BY
//* THE REPOSITORY SERVER INTO THE IMS PROCLIB
//*
//BPERECFN  EXEC PROC=PROCUPDT,MBR=BPERECFN
//P.SYSUT1 DD *
# DEFINITIONS FOR REPO TRACES
TRCLEV=(*,HIGH,REPO,PAGES=300)/* DEFAULT ALL TRACES TO HIGH */
/*
//*
//* THE FOLLOWING STEP ADDS THE CSLRIRRM MEMBER USED BY RM IN
//* THE REPOSITORY INTO THE IMS PROCLIB
//*
//CSLRIRRM  EXEC PROC=PROCUPDT,MBR=CSLRIRRM
//P.SYSUT1 DD *
ARMRST=N,
RMNAME=RRMN,
IMSPLEX(NAME=RPLXN)
<SECTION=REPOSITORY>
REPOSITORY=(NAME=IMSREPNM,TYPE=IMSRSC,GROUP=REPXCFGN,
AUDITACCESS=NOAUDIT)
//*
/*
//*
//* THE FOLLOWING STEP ADDS THE CSLSIRCS MEMBER USED BY SCI IN
//* THE REPOSITORY INTO THE IMS PROCLIB
//*
//CSLSIRCS  EXEC PROC=PROCUPDT,MBR=CSLSIRCS
//P.SYSUT1 DD *
*--------------------------------------------------------------------*
* SCI INITIALIZATION PROCLIB MEMBER.                                 *
*--------------------------------------------------------------------*
ARMRST=N,
SCINAME=${instance-DFS_IMS_SSID}SC,  /* SCI NAME               */
IMSPLEX(NAME=RPLXN)        /* IMSPLEX NAME                       */
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSYDTI MEMBER TO IMS PROCLIB.
//* THIS MEMBER SPECIFIES OTMA DESTINATION ROUTING DESCRIPTORS.
//*
//DFSYDTI  EXEC PROC=PROCUPDT,MBR=DFSYDTI
//P.SYSUT1 DD *
D IMSDTOR1 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=TPIPE1
D IMSDTOR2 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=TPIPE2
D IMSDTOR3 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=TPIPE3
D IMSDTOR4 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=TPIPE4
D IMSDTOR5 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=TPIPE5
D IMSDTOR6 TYPE=IMSCON TMEMBER=${instance-DFS_IMS_SSID}HWS TPIPE=IVPPIPE6

/*
//*
//* THE FOLLOWING STEP ADDS THE HWSEXIT0 MEMBER TO IMS PROCLIB.
//*
//HWSEXIT0 EXEC PROC=PROCUPDT,MBR=HWSEXIT0
//P.SYSUT1 DD *
EXITDEF(TYPE=XMLADAP,EXITS=(HWSXMLA0),ABLIM=8,COMP=HWS)
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSVSMHP MEMBER TO IMS PROCLIB.
//* THIS MEMBER IS CREATED TO SUPPORT CATALOG.
//*
//DFSVSMHP EXEC PROC=PROCUPDT,MBR=DFSVSMHP
//P.SYSUT1 DD *
24576,50
16384,50
8192,50
4096,50
2048,50
1024,50
512,50
IOBF=(2048,50,N,N)
IOBF=(4096,500,N,N)
IOBF=(6144,50,N,N)
IOBF=(8192,50,N,N)
IOBF=(24576,50,N,N)
LOCKTIME=30
OLDSDEF OLDS=(00,01,02,03),MODE=SINGLE,BUFNO=20
WADSDEF WADS=(0,1)
OPTIONS,DLOG=ON,SCHD=ON,LATC=LOW,STRG=ON,DUMP=YES
OPTIONS,DISP=LOW,LOCK=OUTHIGH,DL/I=OUTHIGH
ARCHDEF MEMBER(ARC1JCL) ALL
/*
//*
//* THE FOLLOWING STEP ADDS THE DFSDFCAT MEMBER TO IMS PROCLIB.
//* THIS MEMBER IS CREATED TO SUPPORT CATALOG.
//*
//DFSDFCAT EXEC PROC=PROCUPDT,MBR=DFSDFCAT
//P.SYSUT1 DD *
<SECTION=CATALOG>
CATALOG=Y
ALIAS=DFSC
RETENTION=(DAYS=40,VERSIONS=55)
*
<SECTION=DATABASE>
UNREGCATLG=(DFSCX000,DFSCD000)
<SECTION=OSAM123>
IOBF=(4096,4,N,N,OSM1)
IOBF=(2K,4,N,N)
IOBF=(513,5,N,N,OSM3)
IOBF=(519,5,N,N,OSM3)
<SECTION=VSAMABC>
POOLID=(VSM1,VSRBF=(2048,500,D))
//*
/*
//*
//***************************************************************
//***************************************************************
//* THE FOLLOWING STEP ADDS THE ${instance-DFS_IMS_SSID}SSM MEMBER TO
//* IMS PROCLIB.  THIS MEMBER WILL BE REFERENCED BY THE MQ BRIDGE
//***************************************************************
//***************************************************************
//${instance-DFS_IMS_SSID}SSM EXEC PROC=PROCUPDT,MBR=${instance-DFS_IMS_SSID}SSM
//P.SYSUT1 DD *
${instance-CSQ_SSID},MQM1,CSQQESMT,,R,
/*
//*
//***************************************************************
//* UPDATE
//*
//***************************************************************
//***************************************************************
//PHONEIN EXEC PROC=INSTUPDT,MBR=PHONEIN
//P.SYSUT1 DD *
S11 1 1 1 1       00001                             
L        ISRT  A1111111                             
L        DATA  LAST1     FIRST1    8-111-1111D01/R01
L        ISRT  A1111111                             
L        DATA  LAST2     FIRST2    8-111-2222D02/R02
L        ISRT  A1111111                             
L        DATA  LAST3     FIRST3    8-111-3333D03/R03
L        ISRT  A1111111                             
L        DATA  LAST4     FIRST4    8-111-4444D04/R04
L        ISRT  A1111111                             
L        DATA  LAST5     FIRST5    8-111-5555D05/R05
L        ISRT  A1111111                             
L        DATA  LAST6     FIRST6    8-111-6666D06/R06
/*
//DFSIVF1 EXEC PROC=INSTUPDT,MBR=DFSIVF1
//P.SYSUT1 DD DISP=SHR,
//         DSN=${instance-DFS_AUTH_LIB_HLQ}.${instance-DFS_AUTH_LIB_SYSHLQ2}.SDFSISRC(DFSIVF1)
/*