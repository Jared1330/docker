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
    
    
    
    
    
FROM — задаёт базовый (родительский) образ.
LABEL — описывает метаданные. Например — сведения о том, кто создал и поддерживает образ.
ENV — устанавливает постоянные переменные среды.
RUN — выполняет команду и создаёт слой образа. Используется для установки в контейнер пакетов.
COPY — копирует в контейнер файлы и папки.
ADD — копирует файлы и папки в контейнер, может распаковывать локальные .tar-файлы.
CMD — описывает команду с аргументами, которую нужно выполнить когда контейнер будет запущен. Аргументы могут быть переопределены при запуске контейнера. В файле может присутствовать лишь одна инструкция CMD.
WORKDIR — задаёт рабочую директорию для следующей инструкции.
ARG — задаёт переменные для передачи Docker во время сборки образа.
ENTRYPOINT — предоставляет команду с аргументами для вызова во время выполнения контейнера. Аргументы не переопределяются.
EXPOSE — указывает на необходимость открыть порт.
VOLUME — создаёт точку монтирования для работы с постоянным хранилищем.
