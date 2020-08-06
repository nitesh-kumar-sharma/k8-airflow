FROM nikush001/python:3
LABEL MAINTAINER="Nitesh K. Sharma <sharma.nitesh590@gmail.com>"

RUN apk add cyrus-sasl-dev

ENV	AIRFLOW_HOME=${AIRFLOW_HOME:-/usr/local/airflow} \
	NODE=${NODE}

ENV PATH=$PATH:/opt/init/airflow/
	
RUN /usr/bin/python3 -m pip install --upgrade pip \
	&& pip install apache-airflow[postgres,kubernetes,crypto]
	  
ADD ./scripts/* /opt/init/airflow/
RUN chmod -R +x /opt/init/airflow/
ENTRYPOINT ["/bin/bash", "-C", "airflow-entrypoint.sh","-d"]