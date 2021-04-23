sudo docker build --build-arg JENKINS_AWS_ACCESS_KEY_ID=$JENKINS_AWS_ACCESS_KEY_ID --build-arg JENKINS_AWS_SECRET_ACCESS_KEY=$JENKINS_AWS_SECRET_ACCESS_KEY -t test . --no-cache

sudo docker run --rm -d -p 8081:8080 test:latest

ARG JENKINS_AWS_ACCESS_KEY_ID
ARG JENKINS_AWS_SECRET_ACCESS_KEY
RUN mkdir ~/.aws && \
    chmod 600 ~/.aws && \
    touch ~/.aws/config && \
    touch ~/.aws/credentials && \
    echo [default] $'\n' region = us-east-1 > ~/.aws/config &&\
    echo [default] $'\n' aws_access_key_id = $JENKINS_AWS_ACCESS_KEY_ID $'\n' aws_secret_access_key = $JENKINS_AWS_SECRET_ACCESS_KEY > ~/.aws/credentials
