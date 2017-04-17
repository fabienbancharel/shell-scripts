# shell-scripts
Various shell scripts for Eclipse, Docker, Jenkins

### Docker
do.sh : 

To clean containers, images, volumes, from any directory : /home/vagrant/do.sh cleanall (prefer "docker system prune" since 17.03)


From a directory containing Dockerfile :

/home/vagrant/do.sh build

/home/vagrant/do.sh buildtagpush
