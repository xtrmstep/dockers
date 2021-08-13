FROM postgres:12.5
LABEL maintainer="maintainer@email.com"
USER root

# set default password for postgres user
ENV POSTGRES_PASSWORD=12345

# copy file to use them during launchin a container
COPY pg_hba.conf /etc/postgresql/pg_hba.conf
COPY postgresql.conf /etc/postgresql/postgresql.conf

# container startup script 
COPY setup_postgre.sh /docker-entrypoint-initdb.d/setup_postgre.sh
RUN chmod 0666 /docker-entrypoint-initdb.d/setup_postgre.sh
