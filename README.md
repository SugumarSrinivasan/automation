#=============================================================================================================================#
#					*****Apache Zookeeper setup in Stand-Alone Mode*****				      #
#=============================================================================================================================#

Pre-requisites:
==============
	1. ZK USER and ZK GROUP should be exists on the Server/VM.
	2. ZK USER should have the sudo privilege to execute the shell script.
	3. Internet access is required on ZK Server for downloading the zookeeper tar file from official zookeeper repository.
	4. Java 1.6 or later version should be pre-installed on the Server/VM.
	5. Copy zookeeper_installer.sh to the target server.
	6. Grant execute permission to zookeeper_installer.sh .

Execution:
==========
	1. Execute the shell script as follows sudo sh <script_path>/zookeeper_installer.sh
	2. Enter ZK User		[Example: root]
	3. Enter ZK Group		[Example: root]
	4. Enter ZK Version		[Example: 3.5.5]
	5. Enter ZK Installation Path	[Example: /opt]	
	6. Enter ZK data directory	[Example: /opt/zookeeper/data]

The shell script will take the above input from terminal and perform the following activities : i)zookeeper-setup, ii)zookeeper-start through systemd.

Validation:
==========
	1. Ensure 'zookeeper' directory is present in Installation Path.
	2. Ensure 'data' directory is present in data directory Path.
	3. Ensure 'myid' file is created under 'data' directory and should have ZK Server id as '1'.
	4. Finally, execute the following command to check the zookeeper service status.

		command: sudo systemctl status zookeeper.service
