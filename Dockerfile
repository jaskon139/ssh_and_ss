FROM jaskon139/ccssshh


EXPOSE 9999/UDP 3824/UDP 

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir -p /root/data
COPY /other/* /root/data/
RUN chmod 777 -R /root
COPY kcptunserver /root/data/

CMD /usr/local/bin/entrypoint.sh
