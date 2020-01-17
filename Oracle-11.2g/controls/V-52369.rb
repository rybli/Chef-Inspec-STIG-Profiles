# encoding: utf-8

control "V-52369" do
	title "DBMS processes or services must run under custom, dedicated OS accounts."
	desc "Separation of duties is a prevalent Information Technology control that is implemented at different layers of the information system, including the operating system and in applications. It serves to eliminate or reduce the possibility that a single user may carry out a prohibited action. Separation of duties requires that the person accountable for approving an action is not the same person who is tasked with implementing or carrying out that action.  

The DBMS must run under a custom dedicated OS account. When the DBMS is running under a shared account, users with access to that account could inadvertently or maliciously make changes to the DBMS's settings, files, or permissions.false"
	impact 0.5
	tag "check": "Check OS settings to determine whether DBMS processes are running under a dedicated OS account. If the DBMS processes are running under shared accounts, this is a finding.

This is done by the default installation.  The installation documentation recommends that a user account named ORACLE is created and is identified as the software owner.  

If you log into the system as the software owner, typically ORACLE, the $ORACLE_HOME environment variable will point to the Oracle software.  If you enter the following commands you can see if ORACLE is the software owner:

$ cd $ORACLE_HOME
$ ls -l (shows the directories - oracle is the owner and oinstall is the group)
$drwxr-xr-x.  8 oracle oinstall  4096 Aug  9 08:08 apex
drwxr-xr-x.  8 oracle oinstall  4096 Aug  9 08:05 assistants
drwxr-xr-x.  2 oracle oinstall 12288 Aug 12 09:48 bin
drwxr-xr-x.  7 oracle oinstall  4096 Aug  9 08:09 ccr
drwxr-xr-x.  3 oracle oinstall  4096 Aug  9 08:09 cdata
drwx------.  4 oracle oinstall  4096 Aug  9 08:37 cfgtoollogs
drwxr-xr-x.  4 oracle oinstall  4096 Aug  9 08:08 clone
drwxr-xr-x.  2 oracle oinstall  4096 Aug  9 08:09 config
drwxr-xr-x.  6 oracle oinstall  4096 Aug  9 08:05 crs
drwxr-xr-x.  3 oracle oinstall  4096 Aug  9 08:05 csmig
drwxr-xr-x.  6 oracle oinstall  4096 Aug  9 08:09 css
drwxr-xr-x. 10 oracle oinstall  4096 Aug  9 08:09 ctx
drwxr-xr-x.  7 oracle oinstall  4096 Aug  9 08:05 cv
drwxr-xr-x.  2 oracle oinstall  4096 Aug 17 23:33 dbs
drwxr-xr-x.  2 oracle oinstall  4096 Aug  9 08:08 dc_ocm
drwxr-xr-x.  4 oracle oinstall  4096 Aug  9 08:11 deinstall
drwxr-xr-x.  3 oracle oinstall  4096 Aug  9 08:05 demo

$ ps -ef | grep ora_ (shows all of the oracle processes owned by the oracle user)

oracle    7914     1  0 01:02 ?        00:00:13 ora_pmon_mype02
oracle    7916     1  0 01:02 ?        00:00:11 ora_psp0_mype02
oracle    7918     1  0 01:02 ?        00:00:09 ora_vktm_mype02
oracle    7922     1  0 01:02 ?        00:00:02 ora_gen0_mype02
oracle    7924     1  0 01:02 ?        00:00:02 ora_diag_mype02
oracle    7926     1  0 01:02 ?        00:00:02 ora_dbrm_mype02
oracle    7928     1  0 01:02 ?        00:00:40 ora_dia0_mype02
oracle    7930     1  0 01:02 ?        00:00:03 ora_mman_mype02
oracle    7932     1  0 01:02 ?        00:00:09 ora_dbw0_mype02
oracle    7934     1  0 01:02 ?        00:00:11 ora_lgwr_mype02
oracle    7936     1  0 01:02 ?        00:00:17 ora_ckpt_mype02
oracle    7938     1  0 01:02 ?        00:00:08 ora_smon_mype02
oracle    7940     1  0 01:02 ?        00:00:00 ora_reco_mype02
oracle    7942     1  0 01:02 ?        00:00:25 ora_mmon_mype02
oracle    7944     1  0 01:02 ?        00:00:41 ora_mmnl_mype02
oracle    7946     1  0 01:02 ?        00:00:00 ora_d000_mype02
oracle    7948     1  0 01:02 ?        00:00:00 ora_s000_mype02
oracle    7992     1  0 01:02 ?        00:00:00 ora_qmnc_mype02
oracle    8029     1  0 01:02 ?        00:00:16 ora_cjq0_mype02
oracle    8030  2611  0 09:37 pts/3    00:00:00 bash
oracle    8090     1  0 01:02 ?        00:00:00 ora_q000_mype02
oracle    8092     1  0 01:02 ?        00:00:00 ora_q001_mype02
oracle    8098     1  0 01:02 ?        00:00:02 ora_smco_mype02"
	tag "fix": "Create an OS account dedicated to Oracle DBMS processes and allow only Oracle DBMS processes to run under the account."

	# Write Check Logic Here

end