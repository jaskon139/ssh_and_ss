FROM jaskon139/ccssshh


EXPOSE 7890/UDP

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN mkdir /root/data

CMD /usr/local/bin/entrypoint.sh
