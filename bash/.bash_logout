#
# ~/.bash_logout
#
# Stop all Docker containers
docker stop $(docker ps -a -q) &&
