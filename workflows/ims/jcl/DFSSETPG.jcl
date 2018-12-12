//**************************************************************@SCPYRT**
//*                                                                     *
//*  LICENSED MATERIALS - PROPERTY OF IBM                               *
//*                                                                     *
//*  5635-A04                                                           *
//*                                                                     *
//*      COPYRIGHT IBM CORP. 1989,2015 ALL RIGHTS RESERVED              *
//*                                                                     *
//*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR        *
//*  DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH            *
//*  IBM CORP.                                                          *
//*                                                                     *
//**************************************************************@ECPYRT**
//* FUNCTION: Authorize IMS Data sets
//***********************************************************************
//STEP01   EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
// SETPROG APF,FORMAT=DYNAMIC
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDXRRESL,VOL=${instance-DFS_DS_VOLUME2}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,VOL=${instance-DFS_DS_VOLUME2}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS,VOL=${instance-DFS_DS_VOLUME2}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSA,VOL=${instance-DFS_DS_VOLUME2}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSB,VOL=${instance-DFS_DS_VOLUME2}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.EXITLIB,VOL=${instance-DFS_DS_VOLUME2}