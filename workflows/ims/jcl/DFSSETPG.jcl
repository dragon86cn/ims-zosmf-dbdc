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
#if(${instance-DFS_SMS_ENVIRONMENT} == false)
#set ($volume = "VOL=${instance-DFS_DS_VOLUME2}")
#else
#set ($volume = "SMS")
#end
//* FUNCTION: Authorize IMS Data sets
//***********************************************************************
//STEP01   EXEC PGM=IEFBR14
//SYSPRINT DD SYSOUT=*
// SETPROG APF,FORMAT=DYNAMIC
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDXRRESL,${volume}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL,${volume}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS,${volume}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSA,${volume}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSB,${volume}
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.EXITLIB,${volume}