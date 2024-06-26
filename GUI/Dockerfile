# Stage 1
FROM debian:latest AS build-env

RUN apt-get update 
RUN apt-get install -y curl git wget unzip libgconf-2-4 gdb libstdc++6 libglu1-mesa fonts-droid-fallback lib32stdc++6 python3
RUN apt-get clean

RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter

ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor -v

RUN flutter channel master
RUN flutter upgrade
RUN flutter config --enable-web

RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Indiquer le port sur lequel l'application écoute (par exemple si vous utilisez un serveur Dart dans votre application Flutter)
EXPOSE 1200

# Commande pour démarrer l'application (à adapter selon votre cas)
CMD ["flutter", "run", "--release"]


# sudo docker build -t gui . && sudo docker run -p 1200:1200 gui
