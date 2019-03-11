# IMS DB/TM workflows for z/OSMF

## Overview

You can rapidly provision or deprovision an IMS™ DB/TM system by using the IBM® z/OS® Management Facility (z/OSMF) with these z/OSMF workflow samples.

#### Provision workflow
The provision workflow will provision an IMS™ DB/TM subsystem with these steps:

| Step          | Description   | JCL  	  |
| :------------:|:------------- |:------- |
| 1 | Specify IMS criteria| |
| 2 | IMS installation preparation| |
| 2.1 | Allocate work data set for zCloud IMS| DFSALWRK.jcl|
| 2.2 | Allocate IMS system definitions data sets| DFSALSY2.jcl|
| 2.3 | IMS system definition preprocessor utility| DFSGNPRE.jcl|
| 2.4 | Run SYSDEF stage 1| DFS4STG1.jcl|
| 2.5 | Run SYSDEF stage 2| DFS4STG2.jcl|
| 3 | Build the zCloud IMS| |
| 3.1 | RACF security exits for IMS| DFSC105J.jcl|
| 3.2 | Authorize IMS data sets to z/OS| DFSSETPG.jcl|
| 3.3 | Allocate IMS data sets| DFSALSY1.jcl|
| 3.4 | Dynamic allocation of IMS system data sets| DFSDYNAL.jcl|
| 3.5 | Create IMS catalog database| DFSALCAT.jcl|
| 3.6 | Prepare IMS DB recovery control| DFSE314J.jcl|
| 3.7 | Ready the IMS proclib| DFSE302J.jcl|
| 3.8 | Define IMS subcomponents| DFSE303J.jcl|
| 3.9 | Define IMS subcomponent CQS| DFSE304J.jcl|
| 3.10 | Create IMS connect| DFS4ICON.jcl|
| 3.11 | IMS configuration defaults| DFSE305J.jcl|
| 3.12 | Define IMS components to z/OS| DFS4CPYP.jcl|
| 3.13 | Define IMS resources to z/OS| DFSE313J.jcl|
| 3.14 | Copy staging libraries| DFSCPYST.jcl|
| 3.15 | Prepare exits for security and connectivity| DFSE315J.jcl|
| 3.16 | Prepare ACBLIB for sample applications| |
| 3.16.1 | Database generation| DFSAPPGN.jcl|
| 3.16.2 | Program specifications generation| DFS4APPG.jcl|
| 3.16.3 | Access control definitions generation|
| 3.17 | Enable IMS local online change| DFSENOLC.jcl|
| 3.18 | Establish IMS active libraries| DFS4ACTV.jcl|
| 3.19 | Specify DB recovery control defaults| DFSDFDRC.jcl|
| 3.20 | Load IMS catalog database| DFSLDCAT.jcl|
| 4 | Start IMS concomitant address spaces| |
| 4.1 | Start SCI| |
| 4.2 | Start OM| |
| 4.3 | Start RM| |
| 5 | Start the IMS control region| |
| 5.1 | Start the IMS control region address space| |
| 6 | Perform IMS restart| |
| 6.1 | Wait for IMS to be ready for cold start| WaitJob.rexx|
| 6.2 | Cold start IMS| |
| 7 | Start IMS connect| |



#### De-provision workflow
The de-provision workflow will de-provision an IMS™ DB/TM subsystem with these steps:

| Step          | Description   | JCL  	  |
| :------------:|:------------- |:------- |
| 1 | Specify IMS criteria| |
| 2 | Perform IMS shutdown| |
| 2.1 | Stop all IMS resources| DFSSTPRS.jcl|
| 2.2 | Immediate IMS shutdown| DFSISHUT.jcl|
| 3 | Stop IMS concomitant address spaces| |
| 3.1 | Stop IMS connect| DFSSTPIC.jcl|
| 3.2 | Stop OM| DFSSTPOM.jcl|
| 3.3 | Stop RM| DFSSTPRM.jcl|
| 3.4 | Stop CSL| DFSSTPAS.jcl|
| 4 | Unmount ZFS files| DFSUNMNT.jcl|
| 5 | Delete IMS system libraries| |
| 5.1 | Delete IMS system definition data sets| DFSSYSDL.jcl|
| 6 | Destroy the zCloud IMS environment| |
| 6.1 | Delete IMS data sets| DFSDELLB.jcl|
| 6.2 | Delete IMS catalog database| DFSDCTLG.jcl|
| 7 | Delete z/OS components| |
| 7.1 | Unauthorize data sets to z/OS| DFSDLAPF.jcl|
| 7.2 | Delete IMS services from z/OS| |
| 7.3 | Delete IMS components from z/OS| DFSDLMBR.jcl|


#### Input variables
The workflow_variables.properties file contains the properties that are shown in the
following table.
The properties file contains default values for some of these variables, but you must customize
others.

| Property      | Remarks       |
| :-------------|:------------- |
| DFS_IMSPlex | IMS Plex name|
| DFS_IMSXCFGroup | IMS coupling facility group|
| DFS_IMS_CRC | Command recognition character|
| DFS_IMS_LINEGRP | DC terminal unit type|
| IST_VTAM_IMSAPPLID | IMS APPLID|
| DFS_AUTH_LIB_HLQ| HLQ for IMS installation libraries|
| DFS_AUTH_LIB_HLQ1| 1st High level HLQ for target for IMS instance data sets|
| DFS_AUTH_LIB_HLQ2 | 2nd level HLQ for IMS instance data sets to read or write|
| DFS_AUTH_LIB_SYSHLQ2 | 2nd level HLQ for IMS system data sets to read from|
| DFS_SMS_ENVIRONMENT | True or false value for SMS environment|
| DFS_SMS_CLASS | SMS storage class|
| DFS_SMS_MCLASS | SMS management class|
| DFS_DS_VOLUME1 | Data set volume|
| DFS_DS_VOLUME2 | Data set volume|
| DFS_IMS_UNIT | Data set device type|
| DFS_IMS_UNIT2 | Data set device type|
| zCloud_LERuntime | Language environment runtime data set|
| zCloud_MACLIB | z/OS macros library|
| zCloud_LPALIB | z/OS LPA library|
| zCloud_PROCLIB IMS | IMS PROC library|
| zCloud_MODGEN | z/OS MODGEN library|
| zCloud_CSSLIB | z/OS PROC library|
| IST_VTAM_Procedure | VTAM procedure|
| DFS_VTAM_NODE_IMSMTO | VTAM node for IMS MTO|
| DFS_VTAM_NODE_IMSND1 | VTAM node for IMS terminal 1|
| DFS_VTAM_NODE_IMSND2 | VTAM node for IMS terminal 2|
| DXR_IRLM_SSID | IRLM subsystem name|
| DXR_IRLM_Procedure | IRLM proc|
| EZB_TCPIP_LoadLib | TCP/IP load library|
| DFS_IXUSTIM1 | EXEC time parameter for SMP/E, SYSDEF STAGE1|
| DFS_IXUSTIM3 | EXEC time parameter for MPPs, IFPs, IRLM, VTAM|
| GIM_IMS_GLOBALzone_CSI | IMS SMP/E target zone ID|
| GIM_IMS_TARGETzone | IMS SMP/E g      lobal zone CSI|
| DFS_MOUNTPOINT | Mount point for unix files|
| DFS_FSTYPE | File system for unix files|
| DFS_IMS_SECURITY | True or false value to use SMS-managed DASD for IMS libraries|


## Pre-requisites
* An SMP/E installation of IMS is done and the IMS load libraries are available.
* Identify the z/OS and IMS system parameters.
* IMS SVCs are installed on the system.
* The workflow files are installed in a suitable USS directory.
* z/OSMF must be started. Both the angel and server z/OSMF address spaces must be started. 

## Security requirements 
To run the workflow, you need the following authority:
* RACF READ authority on SMP/E-installed IMS libraries.
* RACF UPDATE authority on the high-level qualifiers (HLQs) you are using for the IMS instance libraries.
* Authority to ADD or DELETE APF authorizations.

## Package structure 
The repository includes the following files:
* provision.xml
  * This workflow XML provisions an IMS Fast Path DEDB database. Do not modify this file.
* deprovision.xml   
  * This workflow XML de-provisions an IMS Fast Path DEDB database. Do not modify this file.
* IMSVariables.xml
  * This file defines the variables referenced by the steps in the workflow.
* workflow_variables.properties
  * This properties file contains values for the variables referenced in the provision.xml and deprovision.xml workflows. Edit the workflow_variables.properties file to specify your system specific information for the variables in the file.
* actions.xml
  * This file defines the actions that can be taken on the instance of the template. Actions like deprovision, start, stop. Do not modify this file.  

## Installation 
* Use FTP to transfer the provision.xml, deprovision.xml, and the workflow_variables.properties files to USS on the z/OS host in binary mode.
* Make these files visible to the z/OSMF application. Do this by changing the access permissions of the files using the chmod command.
  * Example chmod commands:
    ```Java
    chmod 755 provision.xml
    ```
  * Or if the file is in a folder with the name of workflows:
    ```Java 
    chmod -R 755 workflows
    ```

## Steps to run the workflow using the z/OSMF web interface
1. Log into the IBM z/OS Management Facility web interface.
1. Select **Workflows** from the left menu.
1. Select the **Actions** drop down menu.
1. Select **Create Workflow**.
1. In the Create Workflow dialog, specify the following information:
    *	Workflow definition file
    *	Workflow variable input file
    *	System
1. Select **Next**.
1. Select **Assign all steps to owner user ID** if you are going to run all of the workflow steps with the current user ID.
1. Select **Finish**.
1. Right-click the first action and select **Perform**.

For more information about running a workflow see [Creating a workflow](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.zosmfworkflows.help.doc/izuWFhpCreateWorkflowDialog.html) in the IBM Knowledge Center.

## Creating a Software Services Template using the software services in Cloud Provisioning in z/OSMF 
1. Select **Cloud Provisioning** from the left menu.
1. Select the **Software Services** drop down menu.
1. From **Templates** tab, Select **Add Template(Standard)**.
1. In the Add Standard Template UI, specify the following information:
    *   Template name
    *   Workflow definition file
    *   Workflow variable input file
    *   Actions file 
1. Select **Ok**.
1. Template is created and can be seen in template table.
1. Associate Tenant 
    *   Select the above template created and go to Actions -> Associate Tenant. 
    *   A dialog with pop-up window will display for Associate Tenant. 
    *   To start with Domain is default and Tenant also default.   
    *   Resource pool selection: Select **Create a dedicated resource pool** and Select **Ok**.  
    *   A new UI - **Add Template and Resource Pool for Tenant: default** will open up with Instance Details tab.  
    *   Specify general name prefix:
        *   2 letter prefix eg. IM  
        This is the prefix for the template instance where every new instance you run, it will dynamically name itself like IM00, IM01 depending on the number of software service instances the user defines for that template.
    *   Maximum number of software services instances (1-1296): 
        *   User defined number that limits the no. of instances
    *   Next, go to Resource Management tab form the left   
    *   In Resources for template: Select **Create network resource pool**
    *   Select **Ok**.
    *   Following message will be seen in the pop-up window : 
        ```
        A resource pool for the template will be created with no workload management resources. 
        It will be created with network resources only. The network administrator must complete 
        the network resource pool definition in the Configuration Assistant task.
        ``` 
    *   Select **Ok**. 

For more information about running a workflow as a Software Services template see [Preparing to use Cloud Provisioning](https://www.ibm.com/support/knowledgecenter/SSLTBW_2.1.0/com.ibm.zos.v2r1.izua300/izuconfig_CloudProvSecuritySetup.htm) in the IBM Knowledge Center.

## Dynamic Port Allocation 
**Before completing this task, see [Configuring Cloud Policy](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.tcp.ipsec.ipsec.help.doc/com/ibm/tcp/ipsec/cloud/CloudPolicyCfgOverview.html) to setup Configuration Assistant and [Using the Systems Tab](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.3.0/com.ibm.tcp.ipsec.ipsec.help.doc/com/ibm/tcp/ipsec/cloud/SystemsMainTabUsing.html) to create a new TCP/IP stack.**
1. Configuration -> Configuration Assistant on the left panel of the z/OSMF UI. 
1. Select option: **Manage z/OS Cloud configuration** and Select **Proceed**.
1. Select the Cloud Domain: **default** and Select **Proceed**.
1. A table is displayed in Network Resource Pools tab with different fields like template name, has provisioned resources, completion status, etc. To provision or run the template instance, completion status for the template has to be complete.
     * Select the template - Go to Actions -> Modify, in Attributes tab - Select **Is Complete** status.
1. In Port Allocation tab, if there is no previously defined Port Ranges name in the table then create one or just select one from the table.
1. To Create Port ranges, select Actions -> New 
    *   Specify the name, uncheck the **Is Quiesced** status
    *   Select the row and Specify the port range(eg. 10000 - 10100) and uncheck the **Is Quiesced**.  
    *   Select **Save** and Continue.

## Run the software service template 
1. Cloud Provisioning -> Software Services: from the Templates tab, select the check box for the template you created and select Actions -> Test run.
1. The following message will be displayed - 
    ```
    The software services instance (name of the instance dynamically created) has been started.
    ```
1. Go to the instances tab to see the status of the new service instance. 
1. If the provisioning of the software service instance is 100% successful, the state will show **Provisioned** in green. 
1. Using the same software services template, a user can provision multiple software service instances.


## Actions on the software service instance 
1. To perform actions against the software instance, select the instance that was provisioned and click on the desired Action -> Perform -> deprovision or stop or start.
1. Deprovision will stop all IMS resources, the IMS control region, IMS Connect, delete all of the allocated datasets, clean up the environment that was provisioned, and release the allocated ports to make them available for reuse.
1. Stop will stop all IMS resources, the IMS Control region, and IMS Connect.
1. Start will start all IMS resources, the IMS Control region, and IMS Connect.


## Troubleshooting
* IZUWF0105E   Workflow property file file-name is either not found or cannot be accessed
  * Typically, this error occurs when the file does not exist at the given path. If the file does exist, access permission to the file must be set by using the chmod command.
* If there is no **Workflows** menu option in the z/OSMF web interface configure the IZUPRMxx member in SYS.PARMLIB to specify the WORKLOAD_MGMT in the PLUGINS statement. For more information see [creating a IZUPRMxx](https://www.ibm.com/support/knowledgecenter/en/SSLTBW_2.2.0/com.ibm.zos.v2r2.izua300/izuconfig_IZUPRMxx.htm) in the IBM Knowledge Center.
  * Example: 
  
        PLUGINS(INCIDENT_LOG  
        COMMSERVER_CFG
        CAPACITY_PROV 
        SOFTWARE_MGMT 
        ISPF          
        RESOURCE_MON  
        WORKLOAD_MGMT)

## z/OSMF documentation

Visit the IBM Knowledge Center for more information on [IBM z/OS Management Facility](https://www.ibm.com/support/knowledgecenter/search/IBM%20z%2FOS%20Management%20Facility?scope=SSLTBW_2.2.0).
