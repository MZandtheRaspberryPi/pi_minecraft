# pi_minecraft
A repo with links to guides to setup your own minecraft server on your pi

The main guide I followed is linked (here)[https://jamesachambers.com/raspberry-pi-minecraft-server-script-with-startup-service/]. This fellow did a lot of work to figure out parameters for the minecraft server as well as various minecraft server versions to use to optimize minecraft. This will work best with a Pi 3b+ or higher.

Note the startup script, start.sh, will check and try to download the specified version each time it is launched. This can take a fair amount of time, so you can comment out this and only uncomment it when you change the version and want to upgrade.

This would involve commenting out the wget lines in https://github.com/TheRemote/RaspberryPiMinecraft/blob/master/start.sh, the script provided to start up the server.
```
# Update paperclip.jar
# echo "Updating to most recent paperclip version ..."

# Test internet connectivity first
# wget --spider --quiet https://papermc.io/api/v1/paper/1.16.5/latest/download
# if [ "$?" != 0 ]; then
#    echo "Unable to connect to update website (internet connection may be down).  Skipping update ..."
# else
#    wget -O paperclip.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
# fi
```

To restart your world, you can delete the worlds folder. Make sure you backup the folder prior to that. The start.sh script that james chambers provides will do that automatically for you, so you could stop the server, start it, stop it, then delete the worlds folders. Look in your minecraft folder for folders like world, world_nether, world_the_end and delete these.
```
sudo ./stop.sh
sudo ./start.sh
sudo ./stop.sh
sudo rm -rf world
```
You may then want to look in the backups folder for the latest file, and rename it something descriptive of the world you deleted
```
ls backups/
cp 2021.02.19.03.01.44.tar.gz last_old_world_before_del_2021.02.19.03.01.44.tar.gz
```
To update, simply stop the server, change the version in the https://github.com/TheRemote/RaspberryPiMinecraft/blob/master/start.sh and start the server. Here's the lines that you may want to change, look at the url and change the version in 1.16.5 to whatever version you want:    
```
wget --spider --quiet https://papermc.io/api/v1/paper/1.16.5/latest/download
wget -O paperclip.jar https://papermc.io/api/v1/paper/1.16.5/latest/download
```
