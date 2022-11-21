#!/bin/bash

#==================================================================================================#
#                                                                                                  #
#       Author: Sugumar Srinivasan                                                                 #
#       Description: This is an installer script for Apache Zookeeper                              #
#       Date: 21/11/2022                                                                           #
#       Modified Date: 21/11/2022                                                                  #
#                                                                                                  #
#==================================================================================================#

echo
echo "*****Apache Zookeeper Stand-Alone Setup*****"
echo
read -p "ZK User: " USER
echo
read -p "ZK Group: " GROUP
echo
read -p "ZK version: " VERSION
echo
read -p "ZK Installation Path:" INSTALLATION_PATH
echo
read -p "ZK Data Directory:" DATA_DIR
echo
echo -e "Downloading the zookeeper-$VERSION tar ball from official zookeeper repository."
echo
sudo wget -P $INSTALLATION_PATH https://archive.apache.org/dist/zookeeper/zookeeper-$VERSION/apache-zookeeper-$VERSION-bin.tar.gz
sleep 0.5
echo
echo -e "Extracting the zookeeper-$VERSION tar ball in $INSTALLATION_PATH path."
echo
sudo tar -xzf $INSTALLATION_PATH/apache-zookeeper-$VERSION-bin.tar.gz --directory $INSTALLATION_PATH --checkpoint=.100
sleep 0.5
echo
echo "Renaming the zookeeper base directory."
echo
sudo mv $INSTALLATION_PATH/apache-zookeeper-$VERSION-bin $INSTALLATION_PATH/zookeeper
sleep 0.5
echo
echo "Creating the data directory for zookeeper."
echo
sudo mkdir $DATA_DIR
sleep 0.5
echo
echo "Updating the Zookeeper server id."
echo
sudo echo "1" > $DATA_DIR/myid
sleep 0.5
echo
echo "Creating the zoo.cfg file and adding the default configurations."
echo
sudo echo -e "tickTime=2000\ninitLimit=10\nsyncLimit=5\ndataDir=$DATA_DIR\nclientPort=2181" > $INSTALLATION_PATH/zookeeper/conf/zoo.cfg
sleep 0.5
echo
echo "Changing the ownership of zookeeper base directory."
echo
sudo chown -R $USER:$GROUP $INSTALLATION_PATH/zookeeper
sleep 0.5
echo
echo "Creating systemd service for zookeeper."
echo
sudo echo -e "[Unit]
Description=Zookeeper Daemon
Documentation=http://zookeeper.apache.org
Requires=network.target
After=network.target

[Service]    
Type=forking
WorkingDirectory=$INSTALLATION_PATH/zookeeper
User=$USER
Group=$GROUP
ExecStart=$INSTALLATION_PATH/zookeeper/bin/zkServer.sh start $INSTALLATION_PATH/zookeeper/conf/zoo.cfg
ExecStop=$INSTALLATION_PATH/zookeeper/bin/zkServer.sh stop $INSTALLATION_PATH/zookeeper/conf/zoo.cfg
ExecReload=$INSTALLATION_PATH/zookeeper/bin/zkServer.sh restart $INSTALLATION_PATH/zookeeper/conf/zoo.cfg
TimeoutSec=30
Restart=on-failure

[Install]
WantedBy=default.target" >  /etc/systemd/system/zookeeper.service
sudo systemctl enable zookeeper.service
sleep 0.5
echo
echo "Starting the zookeeper server."
echo
sudo systemctl start zookeeper.service
echo
