FROM jaskon139/ccssshh


EXPOSE 9999/UDP 3824/UDP 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data
COPY /other /root/
RUN chmod 777 -R /root

CMD /usr/local/bin/entrypoint.sh
