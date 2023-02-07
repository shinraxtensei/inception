FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd vim 

COPY /tools/configure.sh .
RUN chmod +x configure.sh

RUN ./configure.sh

CMD ["vsftpd"]