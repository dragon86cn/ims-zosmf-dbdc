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
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDXRRESL#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKS#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSA#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.MODBLKSB#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end
// SETPROG APF,ADD,DSNAME=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.EXITLIB#if(${instance-DFS_SMS_ENVIRONMENT} == false),VOL=${instance-DFS_DS_VOLUME2}
#else,SMS
#end