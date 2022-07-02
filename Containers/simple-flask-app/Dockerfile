# Use the standard Nginx image from Docker Hub
FROM nginx:1.20

ENV HOME=/opt/repo

COPY requirements.txt ${HOME}/src/requirements.txt

USER root

RUN sed -i 's/stable\/updates/stable-security\/updates/' /etc/apt/sources.list

# install python, uwsgi, and supervisord
RUN apt-get update &&  apt-get install -y supervisor uwsgi python3 python3-pip uwsgi-plugin-python3 vim

#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN /usr/bin/pip3 install -r ${HOME}/src/requirements.txt


# Source code file
COPY app/ ${HOME}/src
# Copy the configuration file from the current directory and paste 
# it inside the container to use it as Nginx's default config.
COPY ./nginx.conf /etc/nginx/nginx.conf

# setup NGINX config
RUN mkdir -p /spool/nginx /run/pid /var/log/nginx /var/cache/nginx && \
    chmod -R 777 /var/log/nginx /var/cache/nginx /etc/nginx /var/run /run /run/pid /spool/nginx && \
    chgrp -R 0 /var/log/nginx /var/cache/nginx /etc/nginx /var/run /run /run/pid /spool/nginx && \
    chmod -R g+rwX /var/log/nginx /var/cache/nginx /etc/nginx /var/run /run /run/pid /spool/nginx

# Copy the base uWSGI ini file to enable default dynamic uwsgi process number
COPY ./uwsgi.ini /etc/uwsgi/apps-available/uwsgi.ini
RUN ln -s /etc/uwsgi/apps-available/uwsgi.ini /etc/uwsgi/apps-enabled/uwsgi.ini

COPY ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN touch /var/log/supervisor/supervisord.log 

EXPOSE 8080:8080

# setup entrypoint
COPY ./docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# https://github.com/moby/moby/issues/31243#issuecomment-406879017
RUN chmod 777 /usr/local/bin/docker-entrypoint.sh && \
    chgrp -R 0 /usr/local/bin/docker-entrypoint.sh && \
    chown -R nginx:root /usr/local/bin/docker-entrypoint.sh

# https://docs.openshift.com/container-platform/3.3/creating_images/guidelines.html
RUN chgrp -R 0 /var/log /var/cache /run/pid /spool/nginx /var/run /run /tmp /etc/uwsgi /etc/nginx && \
    chmod -R g+rwX /var/log /var/cache /run/pid /spool/nginx /var/run /run /tmp /etc/uwsgi /etc/nginx && \
    chown -R nginx:root ${HOME} && \
    chmod -R 777 ${HOME} /etc/passwd /var/log/supervisor/

# enter
WORKDIR ${HOME}
USER nginx
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["supervisord"]