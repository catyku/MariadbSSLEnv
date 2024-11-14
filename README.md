# MariadbSSLEnv

## setup

1. modify ca.conf server.conf client.conf 

2. generator key 

```
./generator.sh
```
3. change directory owner

```
chown -R systemd-coredump:systemd-coredump ssl/
## if mariadb/log not exist ,mkdir it
chown -R systemd-coredump:systemd-coredump mariadb/log
```

4. start mariadb docker

```
docker compose up -d 
```

## other (not test) 


# create user for ssl

```
mariadb --host=127.0.0.1 -u root -pPassw@rd

grant all on *.* to 'cross'@'192.168.0.17' identified by '123456'  require ssl;
```

# check ssl user

```
mariadb --host=127.0.0.1 -u cross -p123456 --ssl-ca=/etc/mysql/conf.d/ssl/ca-cert.pem --ssl-cert=/etc/mysql/conf.d/ssl/client-cert.pem --ssl-key=/etc/mysql/conf.d/ssl/client-key.pem -e 'status'
```


# refer to
https://github.com/chio-nzgft/docker-MariaDB-with-SSL

https://dmachard.github.io/posts/0056-mariadb-enable-tls/

https://dmachard.github.io/posts/0057-create-self-certificate/

https://hackmd.io/@ChaosFractal/r1hoCnaR_


