#https://stackoverflow.com/questions/63683425/docker-swarm-network-sandbox-join-failed-subnet-sandbox-join-failed-for-10-0
ls -l /sys/class/net/ | grep vx
# delete ever y vx-xxxx
sudo ip link delete vx-000000-xxxxx

sudo umount /var/run/docker/netns/*
sudo rm /var/run/docker/netns/*