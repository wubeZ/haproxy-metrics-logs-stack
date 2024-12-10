FROM grafana/promtail:latest
COPY promtail-config.yml /etc/promtail/promtail-config.yml
CMD ["-config.file=/etc/promtail/promtail-config.yml"]
EXPOSE 9080