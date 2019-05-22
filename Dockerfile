FROM alpine
# set some metadata
LABEL summary="PrintEnv" \
      maintainer="Peter Pflaeging <peter@pflaeging.net>"
# Install base package
RUN apk add --no-cache python py-pip
# make /etc/passwd for group 0 writable
RUN chmod g=u /etc/passwd
# install flask framework
RUN pip install flask
# setup APP dir
RUN mkdir -p /opt/app/export && chmod -R g=u /opt/app
WORKDIR /opt/app
# copy entrypoint
ADD docker-entrypoint.sh /opt/app
RUN chmod 755 /opt/app/docker-entrypoint.sh

# copy "APP" and set environment
ADD envprinter.py /opt/app
ENV FLASK_APP=envprinter.py
ENV FLASK_ENV=development

# setups
VOLUME /opt/app/export
EXPOSE 5000

USER 11177:0
# entrypoint makes setups
ENTRYPOINT ["/opt/app/docker-entrypoint.sh"]
# cmd sets default command
CMD ["/usr/bin/flask", "run", "--host=0.0.0.0"]