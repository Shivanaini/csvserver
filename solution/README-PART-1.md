used this command to run the image 
docker run -d \
    --name csvserver \
    -p 9393:9393 \
    -e CSVSERVER_BORDER=Orange \
    -v /home/ubuntu/getting-started-app/inputFile:/csvserver/inputdata \
    infracloudio/csvserver:latest

after i create small gencsv.sh file whihc i attached here and i ran the file it will generated the out put accorging to that

after i removed the container and re created it with port 9393 and i enable the port in my ec2 security group
after application is not openning so the i ran below commands
   netstat -tuln
    sudo netstat -tuln | grep 9393
   sudo ufw allow 9393/tcp

after i added environment variable
   docker exec -it csvserver /bin/sh
   printenv CSVSERVER_BORDER
