FROM nginx
COPY ./build/web/ /usr/share/nginx/html
EXPOSE 9000