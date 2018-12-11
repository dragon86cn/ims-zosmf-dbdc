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
//CS       EXEC PGM=IDCAMS,DYNAMNBR=200
//DD1      DD   DSN=${instance-zCloud_PROCLIB},DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSIN DD *
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}CTL)' FILE(DD1)
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}DLI)' FILE(DD1)
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}DRC)' FILE(DD1)
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}OM)' FILE(DD1)
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}SC)' FILE(DD1)
    DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}RM)' FILE(DD1)
	DELETE '${instance-zCloud_PROCLIB}(${instance-DFS_IMS_SSID}ODBM)' FILE(DD1)
	SET MAXCC=0
//*