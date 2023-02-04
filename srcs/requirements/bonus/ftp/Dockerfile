FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd vim 

COPY /tools/configure.sh .
RUN chmod +x configure.sh

EXPOSE 20 21 30000-30009

RUN ./configure.sh

CMD ["vsftpd"]