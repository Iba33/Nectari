FROM mcr.microsoft.com/mssql/server:2019-latest

ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=MyStrong#@Pwd

EXPOSE 1433

COPY entrypoint.sh /usr/src/app/entrypoint.sh

HEALTHCHECK --interval=30s --timeout=10s --retries=5 \
  CMD /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -Q "SELECT 1" || exit 1



ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

CMD /opt/mssql/bin/sqlservr
