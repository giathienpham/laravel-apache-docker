BUILD: 
 		docker build -t my-apache2 .
RUN:
		docker run -dit --name my-running-app -p 8080:80 my-apache2
Command Line: 
		docker exec -t -i my-running-app /bin/bash