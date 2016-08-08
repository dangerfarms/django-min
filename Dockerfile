FROM dangerfarms/geodrf-alpine:latest
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
ADD requirements.dev.txt /app/
# Eventually we should remove the need for ./.bin/requirements and have 3rd party libs installed here.
# RUN pip install --user -r requirements.dev.txt --install-option="--install-scripts=/usr/local/bin" -U
RUN apk add --update-cache curl && \
    curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion >> ~/.bashrc && \
    rm -rf /var/cache/apk/*
ADD . /app/
