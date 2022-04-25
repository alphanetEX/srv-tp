# Inicializacion 
- Directivas para La configuracion de un servidor, un proyecto general para el 
  deployment tanto para sistemas cloud o sistemas embebidos de tipo ARM 

enviar el contenido a la Cloud Vm via Github

- Clonar el proyecto a /opt/tp/scripts/
```sh 
cd /opt
sudo mkdir -p /tp/scripts
cd tp/
sudo git clone git@github.com:alphanetEX/srv-tp.git beta/
sudo chmod 750 backup_full.sh conf_raid.sh disk_formatter.sh lamp-conf.sh packages.sh 
./start.sh
```


- Conecxion con maquinas con acceso a root AWS, EC2 via rsync
```sh 
rsync -rzt --progress --exclude={'examples/*',.git/*} -r $(pwd)/ root@ip-addr:/opt/tp/scripts
```
- Conecxion con maquinas con usuario de tipo SUDO

> :warning: **Recuerde agregar una una regla de acceso a /etc/sudoers**: dentro del servidor de la nube antes del uso de rsync: 

```sh
$ sudo echo "${USER} ALL= NOPASSWD:/usr/bin/rsync" >> /etc/sudoers 
```

```sh 
rsync -rzt --progress --exclude={.git/*} --rsync-path="sudo rsync" -r $(pwd)/ user@ip-addr:/opt/tp/scripts/
```

- nevegar a /opt y crear los folderes /tp/scripts/

> :warning: **Actualice manualmente el servidor e installe rsync si en caso no esta el paquete**: dado a que pueden aparecer pantallas de cambios de parte del coud provider,,!

## dentro de ese directorio ejecute
```sh 
$ ./start.sh
```
###### si en caso hay problemas de ejecucion ejecute permisos 750 a cada unos de los archivos del directorio


