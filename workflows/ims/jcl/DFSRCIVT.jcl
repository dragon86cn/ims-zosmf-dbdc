//DBRC     PROC
//*
//D        EXEC PGM=DSPURX00                                            
//STEPLIB  DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.SDFSRESL                 
//SYSPRINT DD SYSOUT=*                                                  
//SYSUDUMP DD SYSOUT=*                                                  
//IMS      DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DBDLIB                   
//JCLPDS   DD DISP=SHR,DSN=${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.PROCLIB                  
//JCLOUT   DD SYSOUT=(A,INTRDR)                                         
//        PEND                                                          
//********************************************************************* 
//*                                                                     
//INITRCON EXEC PROC=DBRC                                               
//D.SYSIN  DD *                                                         
  INIT.DB    DBD(IVPDB1) SHARELVL(3) TYPEIMS                            
  INIT.DBDS  DBD(IVPDB1) DDN(DFSIVD1) -                                 
             DSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1) -                   
             ICJCL(ICJCL) OICJCL(OICJCL) RECOVJCL(RECOVJCL) -           
             REUSE RECOVPD(0) GENMAX(3)                                 
  INIT.DB    DBD(IVPDB1I) SHARELVL(3) TYPEIMS                           
 INIT.DBDS  DBD(IVPDB1I) DDN(DFSIVD1I) -                    
            DSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.DFSIVD1I) -             
            ICJCL(ICJCL) OICJCL(OICJCL) RECOVJCL(RECOVJCL) -
            REUSE RECOVPD(0) GENMAX(3)                      
 INIT.IC    DBD(IVPDB1) DDN(DFSIVD1)   -                    
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC101)             
 INIT.IC    DBD(IVPDB1) DDN(DFSIVD1)   -                    
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC102)             
 INIT.IC    DBD(IVPDB1) DDN(DFSIVD1)   -                    
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1.IC103)             
 INIT.IC    DBD(IVPDB1I) DDN(DFSIVD1I)   -                  
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC101)           
 INIT.IC    DBD(IVPDB1I) DDN(DFSIVD1I)   -                  
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC102)           
 INIT.IC    DBD(IVPDB1I) DDN(DFSIVD1I)   -                  
            ICDSN(${instance-DFS_AUTH_LIB_HLQ1}.${instance-DFS_AUTH_LIB_HLQ2}.IVPDB1I.IC103)           