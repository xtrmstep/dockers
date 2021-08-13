FROM apache/airflow:2.1.0-python3.8 as base
LABEL maintainer="maintainer@email.com"

USER root
RUN sudo apt-get -y update && sudo apt-get -y upgrade
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY requirements.txt /requirements.txt

# =================================

FROM base as sandbox

RUN $(command -v pip) install --user -r /requirements.txt

# =================================

FROM sandbox as runtime

# Secret key to save variables and connection passwords in the db
ENV AIRFLOW__CORE__FERNET_KEY='VyZo_mm3Ju2K8_VLDe5_9m_KzKnTSeHY_EMQkYSq54M='
# Secret key used to run your flask app. It should be as random as possible
ENV AIRFLOW__WEBSERVER__SECRET_KEY='f99d47d1500c3b78cfc3d77eaa3b7d5d'
ENV AIRFLOW__WEBSERVER__AUTHENTICATE=True
ENV AIRFLOW__WEBSERVER__AUTH_BACKEND='airflow.contrib.auth.backends.password_auth'

# Database
# ENV POSTGRES_USER=
# ENV POSTGRES_PASSWORD=
# ENV POSTGRES_HOST=
# ENV POSTGRES_PORT=
# ENV POSTGRES_DB=
# it is set in docker-compose
#ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://${POSTGRES_USER}:${POSTGRES_PASSWORD}@${POSTGRES_HOST}:${POSTGRES_PORT}/${POSTGRES_DB}"

ENV AIRFLOW_HOME=/opt/airflow
ENV AIRFLOW__CORE__EXECUTOR=LocalExecutor
ENV AIRFLOW__CORE__PARALLELISM=8
ENV AIRFLOW__CORE__DAG_CONCURRENCY=16
ENV AIRFLOW__WEBSERVER__BASE_URL="http://localhost:8080"

# Email related
ENV AIRFLOW__EMAIL__EMAIL_BACKEND=airflow.utils.email.send_email_smtp
# ENV AIRFLOW__SMTP__SMTP_HOST=
ENV AIRFLOW__SMTP__SMTP_STARTTLS=True
ENV AIRFLOW__SMTP__SMTP_SSL=False
# ENV AIRFLOW__SMTP__SMTP_USER=
# ENV AIRFLOW__SMTP__SMTP_PASSWORD=
# ENV AIRFLOW__SMTP__SMTP_PORT=
# ENV AIRFLOW__SMTP__SMTP_MAILFROM=

# Logging
ENV AIRFLOW__LOGGING__REMOTE_LOGGING=False

# Other useful configurations
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False
ENV AIRFLOW__CORE__LOAD_DEFAULT_CONNECTIONS=False
ENV AIRFLOW__API__AUTH_BACKEND=airflow.api.auth.backend.basic_auth
ENV AIRFLOW__WEBSERVER__EXPOSE_CONFIG=True
ENV AIRFLOW__CORE__SECURE_MODE=True
ENV AIRFLOW__CORE__DAGBAG_IMPORT_TIMEOUT=120

# Related to $AIRFLOW_HOME
ENV AIRFLOW__CORE__DAGS_FOLDER=/opt/airflow/dags
ENV AIRFLOW__LOGGING__BASE_LOG_FOLDER=/opt/airflow/logs
ENV AIRFLOW__CORE__PLUGINS_FOLDER=/opt/airflow/plugins
ENV AIRFLOW__LOGGING__DAG_PROCESSOR_MANAGER_LOG_LOCATION=/opt/airflow/logs/dag_processor_manager/dag_processor_manager.log
ENV AIRFLOW__SCHEDULER__CHILD_PROCESS_LOG_DIRECTORY=/opt/airflow/logs/scheduler

ENTRYPOINT [ "/entrypoint.sh" ]
