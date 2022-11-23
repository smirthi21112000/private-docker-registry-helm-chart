FROM ubuntu
COPY password.sh .
RUN chmod +x password.sh
RUN apt update
RUN apt install apache2-utils -y
CMD ["bin/sh","-c", "./password.sh"]
