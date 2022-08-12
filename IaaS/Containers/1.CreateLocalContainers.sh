#simplewebapp adlı c# projesinin içerisinde bulunan DockerFile dosyası vasıtasıyla build edip, imajı webappimage olarak belirtiyoruz.
docker build -f .\simplewebapp\DockerFile -t webappimage:v1 .


#Parametrelerr container ismi, localhost port: docker port, hangi image'ın kullanılacağını belirtmek
docker run --name webapp --publish 8080:80 --detach webappimage:v1

#Calışmakta olan webapp adlı containerı durdurup, kaldırmak
docker stop webapp
docker rm webapp


#Image'ın hala olduğunu belirtmek
docker image ls webappimage:v1