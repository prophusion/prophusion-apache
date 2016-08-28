# Prophusion for Apache

This docker image makes it fast and easy to switch amongst **any** PHP versions
within the Apache webserver since 5.3.9.

It is built from the [prophusion-base](https://hub.docker.com/r/prophusion/prophusion-base/) image, and the
characteristics of the php builds are very similar. 

## Basic Usage
 1. [Install docker](https://docs.docker.com/engine/installation/)
 2. In your terminal, run this command:  
    ```docker run -it -p 8080:80 -e "PHP_VERSION=7.0.10" prophusion/prophusion-apache /bin/bash```
    
    The prophusion-apache docker image will download and start. Then PHP 7.0.10 will be loaded
    into the container and configured in apache.
 3. On your docker host, visit
    `http://localhost:8080` in a web browser. You should be greeted with a default page showing the 
    [phpinfo()](https://php.net/phpinfo) for PHP 7.0.10. 
 4. You can test another PHP version, say 5.6.25, by running the following command _in the container_:  
    ```prophusion apache-version 5.6.25```  
    **Note**: Changing the PHP version used by Apache causes Apache to restart.

## Additional Usage
### Running your own app
 To have the container host your code instead of the stylish default phpinfo page, mount it in the
 container's `/var/www/html`. For example, if you have an app on your docker host at `/path/to/my-killer-app`,
 you could run  
 ```docker run -p 8080:80 -v /path/to/my-killer-app:/var/www/html -e "PHP_VERSION=7.0.0" prophusion/prophusion-apache```
### Changing the PHP version from the docker host
 When you do not tell the container to run a shell such as `/bin/bash` as part of your `docker run`, it will tail 
 apache's logs until it is stopped with `docker stop`. You will not have a shell in the container in this case, 
 but you can still change the PHP version used by running this command from the docker host:  
  ```docker exec [container-name] prophusion apache-version [new.php.version]```  
 where `container-name` is the container name or id as listed by `docker ps`, and `new.php.version` 
 is the next php version you want the container to run.

 The container prints an example of this command including the correct `container-name` when it starts up.

## Bugs, Feature Requests, & Contributing
 * If you've found a bug or want to request a feature, please
   [create an issue on github](https://github.com/prophusion/prophusion-apache/issues) to report it.
 * How you can help:
   - Pull requests to [prophusion's repositories](https://github.com/prophusion) on github are welcome!
   - Host a mirror of the PHP builds. Contact `mike@mbaynton.com` if you'd like to help in this way.
