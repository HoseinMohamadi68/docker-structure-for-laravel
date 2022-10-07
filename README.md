# docker-structure
My purpose Create This Project structure Docker File for easy using Docker for developer without remember difficult rules structure docker

## Feuture

- Install  extention php gd,curl,bcmath,pdo,pdo_mysql,pdo_sqlite,pcntl,...
- Use php 8.1.6
- Install supervisor and composer and nano,openssh,zsh,shadow,sqlite,zlib,wget,libx11,...
- Install All dependancy php 
-Install Xdebug
-Install redis
-Install php_codesniffer
- Implementations for crontab with supervisor
- Along with fully automatic root user access settings

# stracture
- [folder Mysql] : This folder locate store all data database mysql
- [folder Php] : This  Folder contain  
- [Php.ini] : all dependency you need use in Environment local
- [DockerFile] : define dependancy and plugin or setting  install in all Enviroment 
- [php.ini-development] : all dependency you need use in Environment development
- [php.ini-production] : all dependency you need use in Environment Production
- [project_test] : This Folder cantain your main project
- [supervisor] : Responsible for implementation job or worker
- [docker-compose] : This File contain define and implement container

# Settings 
if you accept default name  you can go to step next How to use

After Clone Project you first change Name folder project_test to Favorite name and Then go to docker-compose.ymal
and change some setting for example change director save project or change name container  to favorite name 
Also you can change Default port to Favorite port
well after customize you must be  this change to Apply to other files for example php and Docker file and make shall

# How To Use
This Project required install [docker](https://www.docker.com/)
 After clone project in your system open terminal and Then Enter the following command 

```sh
~$ cd docker-structure
~$ make up
```

After install all extention you can Enter following command see all container with status and Which port do they use?

```sh
~$ make status
```

now you can open broser and Enter http://localhost:11000/ and see print file in located in public folder

## containers
This project contain the following containers.

| containers | README |
| ------ | ------ |
| php | [https://hub.docker.com/_/php][PlDb] |
| nginx | [https://hub.docker.com/_/nginx][PlGh] |
| sqlite3 | [https://hub.docker.com/r/nouchka/sqlite3][PlGd] |
| mariadb:10.6 | [https://hub.docker.com/_/mariadb][PlOd] |
| phpmyadmin | [https://hub.docker.com/_/phpmyadmin][PlMe] |
| redis | [https://hub.docker.com/_/redis][PlGa] |

#### how to go shell

For go to shell and use Enviroment composer you can Enter following command:

```sh
make shell
```

## License
