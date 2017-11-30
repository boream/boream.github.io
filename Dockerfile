FROM jekyll/jekyll:latest
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.6/community" >> /etc/apk/repositories
RUN apk update
RUN apk add bash bash-doc bash-completion cmake 
