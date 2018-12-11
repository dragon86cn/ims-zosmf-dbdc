//PROCUPDT PROC MBR=TEMPNAME
//*
//P        EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=*
//SYSUT2   DD DISP=SHR,
//            DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB(&MBR)
//SYSIN    DD DUMMY
//        PEND
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