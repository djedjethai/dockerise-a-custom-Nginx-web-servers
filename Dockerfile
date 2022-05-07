FROM alpine:3.14.1

RUN apk -i update 

RUN wget http://nginx.org/download/nginx-1.21.3.tar.gz

RUN tar -zxvf nginx-1.21.3.tar.gz
RUN rm nginx-1.21.3.tar.gz

WORKDIR /nginx-1.21.3
 
# RUN apk add alpine-sdk &&\
RUN apk add g++ make &&\
    apk add pcre pcre-dev zlib zlib-dev libressl-dev &&\
     ./configure --without-http_autoindex_module\
 	--sbin-path=/usr/bin/nginx\
 	--conf-path=/etc/nginx/nginx.conf\
 	--error-log-path=/var/log/nginx/error.log\
 	--http-log-path=/var/log/nginx/access.log\
 	--with-pcre\
 	--pid-path=/var/run/nginx.pid\
 	--with-http_ssl_module\
 	--modules-path=/etc/nginx/modules\
 	--with-http_v2_module 
#	--with-http_image_filter_module=dynamic\
    
RUN make
RUN make install 

WORKDIR /

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

WORKDIR /static
COPY ./static .

WORKDIR /nginxlogs
COPY ./nginxlogs .

WORKDIR /

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

