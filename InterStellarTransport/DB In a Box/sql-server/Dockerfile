FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

ARG SA_PASSWORD
ENV SA_PASSWORD=${SA_PASSWORD}

ARG TEST_ACCOUNT_PASSWORD
ENV TEST_ACCOUNT_PASSWORD=${TEST_ACCOUNT_PASSWORD}

RUN mkdir /var/opt/mssql
RUN mkdir /var/opt/mssql/backup

WORKDIR /var/opt/mssql/backup
COPY *.bak ./

WORKDIR /var/opt/mssql
COPY *.sql ./

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P ${SA_PASSWORD} -i ./restore-backups.sql

RUN (/opt/mssql/bin/sqlservr --accept-eula & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P ${SA_PASSWORD} -i ./create-users.sql