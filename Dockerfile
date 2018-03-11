FROM maven:3.5.2-jdk-8

RUN apt-get update && \
    apt-get install -y zip wget && \
    wget -P /opt https://s3-us-west-2.amazonaws.com/wso2-stratos/wso2esb-5.0.0.zip && \
    apt-get clean && \
    unzip /opt/wso2esb-5.0.0.zip -d /opt && \
    rm /opt/wso2esb-5.0.0.zip


EXPOSE 9443 8280 8243 19444
WORKDIR /opt/wso2esb-5.0.0
ENTRYPOINT ["sh", "/opt/wso2esb-5.0.0/bin/wso2server.sh", "-DosgiConsole=19444"]
