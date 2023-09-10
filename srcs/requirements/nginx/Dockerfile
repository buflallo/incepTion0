FROM debian:bullseye

# Install Nginx and OpenSSL
RUN apt-get clean && apt-get update && \
    apt-get install -y nginx vim curl openssl && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /etc/nginx/ssl && mkdir /etc/nginx/ssl/private && mkdir /etc/nginx/ssl/certs

RUN rm -rf /var/www/html/* 

COPY ./tools/index.html /var/www/html/

# Generate self-signed SSL certificate and key
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/private/nginx-selfsigned.key \
    -out /etc/nginx/ssl/certs/nginx-selfsigned.crt \
    -subj "/C=MA/ST=Merrakech/L=Benguerir/O=UM6P/OU=IT/CN=hlachkar.42.fr"

# Copy nginx.conf file to the container
COPY conf/nginx.conf /etc/nginx/nginx.conf



# Start Nginx
ENTRYPOINT ["nginx", "-g", "daemon off;"]
