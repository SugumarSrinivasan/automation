Pre requisites:
===============
	1. ZK User and ZK Group should be created.
	2. ZK User should have the sudo privilege to setup zookeeper.
	3. OpenJDK-1.8 should be pre-installed on ZK server/VM.
	4. ZK server should have the internet access to download the zookeeper tarball from official zookeeper repository.
	5. Copy the zookeeper_standalone_installer.sh from github to the ZK Server/VM.
	6. Grant execute privilege to zookeeper_standalone_installer.sh

Execution:
==========
	1. Execute the installer script as follows: sudo <script_path>/zookeeper_standalone_installer.sh
	2. Enter ZK User		[Example: ec2-user]
	3. Enter ZK Group		[Example: ec2-user]
	4. Enter ZK Version		[Example: 3.5.5]
	5. Enter ZK Installation Path	[Example: /opt]
	6. Enter ZK Data Directory	[Example: /opt/zookeeper/data]

The installer script will take the above input and do the following activities : i)zookeeper setup & ii) start zookeeper through systemd.

Validation:
===========
	1. Ensure 'zookeeper' directory is present under ZK Installation Path.
	2. Ensure 'data' directory is exist on ZK Data Directory.
	3. Validate 'myid' file is exists on 'data' directory and contains the ZK Server id as '1'.
	4. Verify the zookeeper status through following command: sudo systemctl status zookeeper.service

Actions:
========
	1. zookeeper-server staus 	==> sudo systemctl status zookeeper.service
	2. zookeeper-server start	==> sudo systemctl start zookeeper.service
	3. zookeeper-server stop	==> sudo systemctl stop zookeeper.service
	4. zookeeper-server restart 	==> sudo systemctl restart zookeeper.service
