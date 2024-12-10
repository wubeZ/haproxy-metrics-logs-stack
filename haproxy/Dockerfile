FROM haproxy:3.1
COPY test.cfg /usr/local/etc/haproxy/haproxy.cfg
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
EXPOSE 80 8404 8405