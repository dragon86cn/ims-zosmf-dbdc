## Set msg to DFS810A to indicate IMS is ready for a Cold Start
#set ($msg = "DFS810A")
#set ($imsid = ${instance-DFS_IMS_SSID})
/* REXX */
/************************************************************************
 * Title: WaitJob.rexx                                                  *
 *                                                                      *
 * Looks at the IMS Control Region job log for the DFS810A message      *
 * to indicate that it is ready for a Cold Start                        *
 *                                                                      *
 * See also:                                                            *
 *   n/a                                                                *
 *                                                                      *
 * Input:                                                               *
 *   n/a                                                                *
 *                                                                      *
 * Output:                                                              *
 *   Output to screen (using say)                                       *
 *                                                                      *
 * Notes:                                                               *
 *                                                                      *
 *                                                                      *
 * Security classification:                                             *
 *                         *IBM Confidential*                           *
 *                                                                      *
 * Change History:                                                      *
 *                                                                      *
 ************************************************************************/
/* REXX */
rc=isfcalls('ON')
isffind = '${msg}'
isffindlim = 9999999
isfscrolltype = 'FINDNEXT'
isflinelim = 1
ISFCOLS = 'JNAME'
isfprefix="${imsid}*"
imsname='${imsid}CTL'


do mainloop = 1 to 30
    Say "Looking for job"
    Address SDSF "ISFEXEC DA"                      
    if rc<>0 then                                  
      Exit rc                                      

    /* Get fixed field name from first word */
    /* of isfcols special variable          */
    fixedField = word(isfcols,1)                      

    do ix=1 to isfrows                                
        if pos(imsname,JNAME.ix) = 1 then   /*found the right job*/
          do
            Say "found job " JNAME.ix
    
            do until isfnextlinetoken=''              
              Address SDSF "ISFBROWSE DA TOKEN('"TOKEN.ix"')"              
    
              lrc=rc                                 
              if lrc>4 then                          
                do                                   
                  Say "Error reading joblog"
                  exit 20                            
              end 
    
              do kx=1 to isfline.0                                             
                Say "Line is:" isfline.kx                    
                exit 0
              end                               

              /*********************************************/                 
              /* Continue reading where we left off        */                 
              /*********************************************/                 
              isfstartlinetoken = isfnextlinetoken
            end                                   

        end
    end
    address SYSCALL "SLEEP" 1                /* Sleep for 1 second  */
end

rc=isfcalls('OFF')  
exit 20
