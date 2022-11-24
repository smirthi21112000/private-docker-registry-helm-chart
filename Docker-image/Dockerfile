FROM ubuntu
RUN apt update
RUN apt install apache2-utils -y
COPY password.sh .
RUN chmod +x password.sh
CMD ["bin/sh","-c", "./password.sh"]

