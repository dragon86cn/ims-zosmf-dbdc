//*************************************************************@SCPYRT*/
//*                                                                   */
//*  LICENSED MATERIALS - PROPERTY OF IBM                             */
//*                                                                   */
//*  5635-A04                                                         */
//*                                                                   */
//*      COPYRIGHT IBM CORP. 1989,2015 ALL RIGHTS RESERVED            */
//*                                                                   */
//*  US GOVERNMENT USERS RESTRICTED RIGHTS - USE, DUPLICATION OR      */
//*  DISCLOSURE RESTRICTED BY GSA ADP SCHEDULE CONTRACT WITH          */
//*  IBM CORP.                                                        */
//*                                                                   */
//*************************************************************@ECPYRT*/
//*********************************************************************
//* FUNCTION:  DELETE DATA SETS CREATED BY THE IMS IVP JOBS
//* NAME: DFSDIVPD.jcl
//*       Distributed File Service Delete IMS Verification Program Dataset
//*********************************************************************
//*
//********************************************************
//* PURGE DATA SETS
//********************************************************
//SCRATCH  EXEC PGM=IDCAMS,DYNAMNBR=20
//SYSPRINT DD SYSOUT=*
//SYSIN    DD *
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC101 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC102 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC103 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC101 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC102 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC103 PURGE
    DELETE ${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I PURGE
    SET MAXCC=0
/*