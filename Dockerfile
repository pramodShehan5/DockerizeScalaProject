FROM ubuntu

MAINTAINER Pramod Shehan(pramodshehan@gmail.com)

RUN apt-get update -y
RUN apt-get upgrade -y 
RUN apt-get install -y  software-properties-common 
RUN add-apt-repository ppa:webupd8team/java -y 
RUN apt-get update -y

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install -y oracle-java8-installer 
RUN apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

ADD /target/scala-2.12/DockerTest-assembly-0.1.jar .

CMD ["java","-jar", "DockerTest-assembly-0.1.jar"]
