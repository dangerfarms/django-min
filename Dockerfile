FROM dangerfarms/geodrf-alpine:0.10.0
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app/
ADD requirements.dev.txt /app/
RUN pip install --user -r requirements.dev.txt --install-option="--install-scripts=/usr/local/bin" -U
RUN curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion >> ~/.bashrc
ADD . /app/
