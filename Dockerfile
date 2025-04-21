FROM maven:3.9.6-eclipse-temurin-17 

WORKDIR /app 

#Copying all the required files from current directory to build the war file
COPY . .

#clean any old build 
RUN mvn clean

#Now you can get the war file 
RUN mvn clean package -DskipTests 




