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
// SETPROG APF,DELETE,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,SMS
// SETPROG APF,DELETE,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS,SMS
// SETPROG APF,DELETE,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSA,SMS
// SETPROG APF,DELETE,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSB,SMS
//*