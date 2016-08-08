FROM dangerfarms/geodrf-alpine:latest
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
ADD requirements.dev.txt /app/
# Need to run this to install binaries within the image, packages are mounted in dev modes
RUN pip install --user -r requirements.dev.txt --install-option="--install-scripts=/usr/local/bin" -U
RUN apk add --update-cache curl && \
    curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion >> ~/.bashrc && \
    rm -rf /var/cache/apk/*
ADD . /app/
