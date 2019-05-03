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
//* SKELETON: DFSIXSC3
//*
//* FUNCTION: RUN THE IMS SYSTEM DEFINITION STAGE1
//*********************************************************************
//*
//STAGE1   EXEC PGM=ASMA90,PARM='NOOBJ,DECK',TIME=(${instance-DFS_IXUSTIM1})
//SYSPRINT DD SYSOUT=*
//SYSLIB   DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.ADFSMAC
//SYSPUNCH DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.INSTALL(IV3C301J)
//SYSUT1   DD UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,(05,05)),DCB=OPTCD=C
//SYSUT2   DD UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,(05,05)),DCB=OPTCD=C
//SYSUT3   DD UNIT=${instance-DFS_IMS_UNIT},SPACE=(CYL,(05,05)),DCB=OPTCD=C
//SYSIN    DD *
* SKELETON: DFSIXSC1
*
* FUNCTION: STAGE 1 SOURCE FOR AN IMS DB/DC SYSTEM: ${instance-DFS_IMS_SSID}
***********************************************************************
**************************************************************@SCPYRT**
*                                                                     *
*  LICENSED MATERIALS - PROPERTY OF IBM                               *
*                                                                     *
*  5635-A04                                                           *
*                                                                     *
*      COPYRIGHT IBM CORP. 1989,2015 ALL RIGHTS RESERVED              *
*                                                                     *
*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR        *
*  DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH            *
*  IBM CORP.                                                          *
*                                                                     *
**************************************************************@ECPYRT**
*
* IMSCTRL MACRO --
*
         IMSCTRL  SYSTEM=(VS/2,(ALL,DB/DC),390),                       X
               IRLM=NO,                                                X
#formatLine("               IRLMNM=${instance-DXR_IRLM_SSID},",71,16,false,"X")
#formatLine("               CMDCHAR=${instance-DFS_IMS_CRC},",71,16,false,"X")
#formatLine("               DBRCNM=${instance-DFS_IMS_SSID}DRC,",71,16,false,"X")
#formatLine("               DLINM=${instance-DFS_IMS_SSID}DLI,",71,16,false,"X")
               DCLWA=YES,                                              X
#formatLine("               IMSID=${instance-DFS_IMS_SSID},",71,16,false,"X")
               NAMECHK=(YES,S1),                                       X
               MAXREGN=(005,512K,A,A),                                 X
               MCS=(2,7),                                              X
               DESC=7,                                                 X
               ETOFEAT=(,,ALL),                                        X
               MAXCLAS=016
*
* IMSCTF  MACRO --
*
         IMSCTF SVCNO=(,${instance-zCloud_IMS_SVC_Type2},${instance-zCloud_IMS_SVC_Type4}),                                      X
               LOG=SNGL,                                               X
               CPLOG=500000,                                           X
               RDS=(LGDK,4096),                                        X
               PRDR=${instance-DFS_IMS_SSID}RDR
*
* MSGQUEUE MACRO --
*
         MSGQUEUE DSETS=(LGDK,LGDK,LGDK),                              X
               RECLNG=(392,3360),                                      X
               BUFFERS=(5,6720),                                       X
               SHUTDWN=100
*
* BUFPOOLS MACRO --
*
         BUFPOOLS PSB=24000,                                           X
               SASPSB=(4000,20000),                                    X
               PSBW=12000,                                             X
               DMB=24000,                                              X
               FORMAT=24000,                                           X
               FRE=30
**********************************************************************
*   IVP DATABASES DEFINITION
**********************************************************************
         DATABASE DBD=IVPDB1,ACCESS=UP               HIDAM/OSAM
         DATABASE INDEX,DBD=IVPDB1I,ACCESS=UP        HIDAM/VSAM INDEX
         DATABASE DBD=IVPDB2,ACCESS=UP               HDAM/VSAM
         DATABASE DBD=IVPDB3,ACCESS=UP               DEDB
         DATABASE DBD=IVPDB4                         MSDB
**********************************************************************
*   IVP BATCH/BMP APPLICATION DEFINITION
**********************************************************************
         SPACE 2
         APPLCTN PSB=DFSIVP6,PGMTYPE=BATCH           HIDAM/OSAM-ASSEM
         SPACE 2
         APPLCTN PSB=DFSIVP61,PGMTYPE=BATCH          HIDAM/OSAM-PASCAL
         SPACE 2
         APPLCTN PSB=DFSIVP62,PGMTYPE=BATCH          HIDAM/OSAM-C
         SPACE 2
         APPLCTN PSB=DFSIVP64,PGMTYPE=BATCH          HIDAM/OSAM-COBOL
         SPACE 2
         APPLCTN PSB=DFSIVP65,PGMTYPE=BATCH          HIDAM/OSAM-REXX
         SPACE 2
         APPLCTN PSB=DFSIVP67,PGMTYPE=BATCH          HDAM/VSAM -JAVA
         SPACE 2
         APPLCTN PSB=DFSIVP7,PGMTYPE=BATCH           HDAM/VSAM
         SPACE 2
         APPLCTN PSB=DFSIVP9,PGMTYPE=BATCH           HIDAM/OSAM OLIC
         SPACE 2
         APPLCTN PSB=DFSIVPA,PGMTYPE=BATCH           HIDAM LOAD
         SPACE 2
         APPLCTN PSB=DFSIVPB,PGMTYPE=BATCH           HDAM  LOAD
         SPACE 2
         APPLCTN PSB=DFSIVP8,PGMTYPE=BATCH           DEDB/VSAM
         SPACE 2
         APPLCTN PSB=DFSIVPC,PGMTYPE=BATCH           DEDB (DB LOAD)
         SPACE 2
**********************************************************************
*   IVP NON-CONVERSATIONAL APPLICATIONS DEFINITION FOR DB/DC
**********************************************************************
         SPACE 2
         APPLCTN PSB=DFSIVP1,PGMTYPE=TP              HIDAM/OSAM
           TRANSACT CODE=IVTNO,MODE=SNGL,AOI=TRAN,                     X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         SPACE
         APPLCTN PSB=DFSIVP2,PGMTYPE=TP              HDAM/VSAM
           TRANSACT CODE=IVTNV,MODE=SNGL,                              X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         SPACE 2
**********************************************************************
*   IVP CONVERSATIONAL APPLICATION DEFINITION FOR DB/DC
**********************************************************************
         SPACE 2
         APPLCTN PSB=DFSIVP3,PGMTYPE=TP              HDAM/VSAM-ASSEM
           TRANSACT CODE=IVTCV,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         APPLCTN PSB=DFSIVP31,PGMTYPE=TP             HDAM/VSAM-PASCAL
           TRANSACT CODE=IVTCP,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         APPLCTN PSB=DFSIVP32,PGMTYPE=TP             HDAM/VSAM-C
           TRANSACT CODE=IVTCC,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         APPLCTN PSB=DFSIVP34,PGMTYPE=TP             HDAM/VSAM-COBOL
           TRANSACT CODE=IVTCB,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         APPLCTN PSB=DFSIVP35,PGMTYPE=TP             HDAM/VSAM-REXX
           TRANSACT CODE=IVTCX,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         APPLCTN PSB=DFSIVP37,PGMTYPE=TP             HDAM/VSAM-JAVA
           TRANSACT CODE=IVTCM,SPA=(80,),MODE=SNGL,                    X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         SPACE 2
**********************************************************************
*   IVP DEDB AND MSDB APPLICATION DEFINITIONS FOR DB/DC
**********************************************************************
         SPACE 2
         APPLCTN RESIDENT,PSB=DFSIVP4,FPATH=256      DEDB
           TRANSACT CODE=IVTFD,MODE=SNGL,                              X
               MSGTYPE=(SNGLSEG,RESPONSE,1)
         SPACE 2
         APPLCTN RESIDENT,PSB=DFSIVP5,FPATH=256      MSDB
           TRANSACT CODE=IVTFM,MODE=SNGL,                              X
               MSGTYPE=(SNGLSEG,RESPONSE,1)
**********************************************************************
*   IVP APPLICATIONS DEFINITION FOR DB/DC, DCCTL
**********************************************************************
         SPACE 2
         APPLCTN GPSB=IVPREXX,PGMTYPE=TP,LANG=ASSEM  REXXTDLI SAMPLE
           TRANSACT CODE=IVPREXX,MODE=SNGL,                            X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
         SPACE 2
**********************************************************************
*   IVP APPLICATIONS DEFINITION - AUTO DEALER SAMPLE - JAVA
**********************************************************************
         DATABASE DBD=AUTODB,ACCESS=UP               HDAM,OSAM
         DATABASE DBD=EMPDB2,ACCESS=UP               LOGICAL
         DATABASE DBD=SINDEX11,ACCESS=UP             INDEX,VSAM
         DATABASE DBD=SINDEX22,ACCESS=UP             INDEX,VSAM
         APPLCTN PSB=AUTPSB11,PGMTYPE=TP,SCHDTYP=PARALLEL
          TRANSACT CODE=AUTRAN11,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL,   X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
          TRANSACT CODE=AUTRAN12,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL,   X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
          SPACE 2
**********************************************************************
*   IVP APPLICATIONS DEFINITION - PURCHASE ORDER SAMPLE - XQUERY
**********************************************************************
         DATABASE DBD=IPODB,ACCESS=UP                PHIDAM,OSAM
         APPLCTN PSB=IPOPSB,PGMTYPE=TP,SCHDTYP=PARALLEL
          TRANSACT CODE=IPOQRY,MODE=SNGL,                              X
               MSGTYPE=(SNGLSEG,NONRESPONSE,1)
**********************************************************************
*   IMS SAMPLE DATABASES DEFINITION
**********************************************************************
         SPACE 2
         DATABASE DBD=DI21PART,ACCESS=UP              HISAM/VSAM
         EJECT  ,
**********************************************************************
*   IMS SAMPLE APPLICATION DEFINITION - CICS
**********************************************************************
         SPACE 2
         APPLCTN PSB=DFHSAM04,PGMTYPE=BATCH
         SPACE 2
         APPLCTN PSB=DFHSAM14,PGMTYPE=BATCH
         SPACE 2
         APPLCTN PSB=DFHSAM24,PGMTYPE=BATCH
         SPACE 2
         APPLCTN PSB=DFHSAM05,PGMTYPE=BATCH
         SPACE 2
         APPLCTN PSB=DFHSAM15,PGMTYPE=BATCH
         SPACE 2
         APPLCTN PSB=DFHSAM25,PGMTYPE=BATCH
         EJECT  ,
**********************************************************************
*   IMS SAMPLE APPLICATION DEFINITION
**********************************************************************
         SPACE 2
         APPLCTN  PSB=DFSSAM01,PGMTYPE=BATCH
         SPACE 2
         SPACE 2
         APPLCTN  PSB=DFSSAM02
         TRANSACT CODE=PART,PRTY=(7,10,2),INQUIRY=YES,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM03
         TRANSACT CODE=DSPINV,PRTY=(7,10,2),INQUIRY=YES,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM04
         TRANSACT CODE=ADDPART,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         TRANSACT CODE=ADDINV,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         TRANSACT CODE=DLETPART,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         TRANSACT CODE=DLETINV,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM05
         TRANSACT CODE=CLOSE,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM06
         TRANSACT CODE=DISBURSE,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM07
         TRANSACT CODE=DSPALLI,PRTY=(7,10,2),INQUIRY=NO,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DFSSAM08,PGMTYPE=BATCH
         SPACE 2
         APPLCTN  PSB=DFSSAM09,PGMTYPE=BATCH           GENERAL PURPOSE
         SPACE 2
**********************************************************************
*   FAST PATH SAMPLE DATABASES DEFINITION
**********************************************************************
         SPACE 2
         DATABASE DBD=DBFSAMD1           GENERAL LEDGER - MSDB
         DATABASE DBD=DBFSAMD2                   TELLER - MSDB
         DATABASE DBD=DBFSAMD3,ACCESS=UP CUSTOMER ACCNT - DEDB
         DATABASE DBD=DBFSAMD4,ACCESS=UP CUSTOMER  LOAN - HDAM/VSAM
         EJECT  ,
**********************************************************************
*   FAST PATH SAMPLE APPLICATION DEFINITION
**********************************************************************
         SPACE 2
         APPLCTN  PSB=DBFSAMP1,PGMTYPE=BATCH       DEDB LOAD
         SPACE 2
         APPLCTN  PSB=DBFSAMP3,PGMTYPE=(TP),FPATH=256
         TRANSACT CODE=FPSAMP1,MSGTYPE=(SNGLSEG,RESPONSE)
         SPACE 2
         APPLCTN  PSB=DBFSAMP4
         TRANSACT CODE=FPSAMP2,MODE=SNGL
         SPACE 2
         APPLCTN  PSB=DBFSAMP6,PGMTYPE=BATCH       DEDB MISC.
         SPACE 2
         APPLCTN  PSB=DBFSAMP2,PGMTYPE=BATCH       HDAM LOAD
         SPACE 2
         APPLCTN  PSB=DBFSAMP5,PGMTYPE=BATCH       HDAM MISC.
         SPACE 2
**********************************************************************
*  IVP COMMUNICATIONS NETWORK DEFINITION
**********************************************************************
         SPACE 2
**********************************************************************
*
* THE ${instance-DFS_IMS_SSID} SYSTEM
* MAKE USE OF 5 TERMINALS --
*
*       MVS MASTER CONSOLE   - IMS LTERM NAME = WTOR
*
*       IMS MASTER CONSOLE   - IMS LTERM NAME = PMASTER
*       IMS SECONDARY MASTER - IMS LTERM NAME = SMASTER
*
*       IMS USER TERMINALS   - IMS LTERM NAME = USER1
*       IMS USER TERMINALS   - IMS LTERM NAME = USER2
*
*
* THE MVS MASTER TERMINAL IS DEFINED AUTOMATICALLY.
*
* THE SECONDARY MASTER IS DEFINED AS A PRINTER LINE GROUP. (A SPOOL
* LINE GROUP IS ALSO AVAILABLE FOR USE AS A SECONDARY MASTER)
*
* THE USER MUST MAKE A CHOICE IN THE DEFINITION OF THE OTHER
* TERMINALS.  THIS SAMPLE STAGE 1 SOURCE DECK INCLUDES SAMPLE
* TERMINAL DEFINITIONS FOR THE FOLLOWING TERMINAL TYPE --
*
*           VTAM 3270 LOCAL
*
* THE IVP IS NOT DEPENDENT UPON NODE (LINE/PTERM) NAMES.
*
* LTERM NAMES AND TRANSACTION CODES ARE USED TO ESTABLISH TERMINAL
* SECURITY.
*
* THE USER MUST ENSURE THAT THE SELECTED TERMINALS ARE PROPERLY
* DEFINED TO VTAM AND MVS.
*
* THE MESSAGE FORMAT SERVICES USED BY THE IVP TRANSACTIONS ARE
* DEFINED FOR A DEVICE TYPE OF 3270-A02 (A 24X80 SCREEN SIZE).
* IF THE TERMINALS WHICH ARE SELECTED SPECIFY A DIFFERENT TYPE,
* THEN THE MFS SOURCE WILL HAVE TO BE CHANGED.
*
**********************************************************************
         SPACE 2
*
* COMM    MACRO --
*      THE APPLID OPERAND SPECIFIES VTAM APPLID FOR THE IMS CONTROL
*           REGION.
*           THE PASSWD OPERAND SPECIFIES APPLICATION PASSWORDS.
*           THESE OPERANDS MUST MATCH THE APPLICATION IDENTIFICATION
*           SPECIFIED IN THE  VTAM ACB(S) FOR THESE IMS DB/DC
*           SYSTEMS.
         COMM RECANY=(5,4096),                                         X
#formatLine("               APPLID=${instance-IST_VTAM_IMSAPPLID},",71,16,false,"X")
#formatLine("               PASSWD=${instance-IST_VTAM_IMSAPPLID},",71,16,false,"X")
               OPTIONS=(PAGING,TIMESTAMP,MFSTEST,FMTMAST,              X
               NOUSEMSG,                                               X
               VTAMAUTH,BLKREQD),                                      X
               COPYLOG=ALL
         EJECT ,
**********************************************************************
*   IMS PRINTER LINE GROUP
**********************************************************************
         LINEGRP  DDNAME=IMSPRT1,UNITYPE=${instance-DFS_IMS_LINEGRP}
          LINE     BUFSIZE=166
           TERMINAL
             NAME  (SMASTER,SECONDARY)
             NAME  IMSPRT1
         EJECT ,
**********************************************************************
*   IMS SPOOL LINE GROUP
**********************************************************************
         LINEGRP  DDNAME=(IVPSPL1,IVPSPL2,IVPSPL3),UNITYPE=SPOOL
          LINE     BUFSIZE=166
SPOOL001   TERMINAL FEAT=AUTOSCH
             NAME  IVPSPL1
         EJECT ,
**********************************************************************
*   IMS VTAM DEFINITIONS
**********************************************************************
         SPACE 2
**********************************************************************
*   IMS 3270 LOCAL - VTAM
**********************************************************************
         SPACE 2
         TYPE  UNITYPE=(3270,LOCAL),TYPE=3270-A02,SIZE=(24,80)
           TERMINAL  NAME=PMASTER1
             NAME  (PMASTER,MASTER)
         SPACE 2
           TERMINAL  NAME=USER1,OPTIONS=(TRANRESP,NOCOPY)
             NAME  USER1
             NAME  HOWARD            USED BY THE IMS SAMPLE APPLICATION
         SPACE 2
           TERMINAL  NAME=USER2,OPTIONS=(TRANRESP,NOCOPY)
             NAME  USER2
         SPACE 2
*
* IMSGEN MACRO --
*
         IMSGEN ASM=(HLASM,SYSLIN),ASMPRT=OFF,                         X
               LKPRT=(XREF,LIST),LKSIZE=(880K,63K),LKRGN=900K,         X
               SUFFIX=I,                                               X
               SURVEY=YES,                                             X
#formatLine("               NODE=(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2},",71,16,false,"X")
#formatLine("               ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2},",71,16,false,"X")
#formatLine("               ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}),",71,16,false,"X")
#formatLine("               OBJDSET=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.OBJDSET,",71,16,false,"X")
               PROCLIB=YES,                                            X
#formatLine("               USERLIB=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,",71,16,false,"X")
               UMAC0=,                                                 X
#formatLine("               MACSYS=${instance-zCloud_MACLIB},",71,16,false,"X")
#formatLine("               MODGEN=${instance-zCloud_MODGEN},",71,16,false,"X")
#formatLine("               SCEERUN=${instance-zCloud_LERuntime},",71,16,false,"X")
               UMAC1=,                                                 X
               UMAC2=,                                                 X
               UMAC3=,                                                 X
               ONEJOB=(YES,YES),                                       X
               JCL=(IMSGEN,                                            X
               ACTINFO1,                                               X
               'PGMRNAME',H,                                           X
               (CLASS=K,                                               X
               MSGLEVEL=(1,1),REGION=512M,                             X
#formatLine("               NOTIFY=${instance-DFS_IMS_USERID})),",71,16,false,"X")
               SCL=(,,(TIME=600)),                                     X
               UJCL1=,                                                 X
               UJCL2=,                                                 X
               UJCL3=,                                                 X
               UJCL4=,                                                 X
               UJCL5=
         END
/*
//*
## ******************************************************************
## Velocity macro to format a line and ensure that the JCL continuation
## character appears in Column 72.
## Note: This macro has been provided by the z/OSMF development team.
## ******************************************************************
#macro(formatLine $line $len $indent $isLastLine $suffix)
#if($line.length() <= $len)
#if($isLastLine)
$line.format("%-${len}s", $line)
#else
$line.format("%-${len}s", $line)$!{suffix}
#end
#else
#makeIndent("$line", $len, $indent, $isLastLine "$!{suffix}")
#end
#end
## ******************************************************************
## Velocity macro to handle indentation if JCL statement does not fit
## in 71 chars.
## Note: This macro has been supplied by the z/OSMF development team.
## ******************************************************************
#macro(makeIndent $line $len $indent $isLastLine $suffix)
$line.substring(0, ${len})$suffix
#set ($left = $line.substring(${len}))
#set ($size = $indent + $left.length())
#set ($left = $left.format("%${size}s", $left))
#if($left.length() <= $len)
#if($isLastLine)
$line.format("%-${len}s", $left)
#else
$line.format("%-${len}s", $left)$suffix
#end
#else
#makeIndent("$left", $len, $indent, $isLastLine, "$suffix")
#end
#end