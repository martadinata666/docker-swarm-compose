FROM 192.168.0.2:5050/dedyms/debian:latest
RUN apt update && apt install -y coturn && apt clean && rm -rf /var/lib/apt/lists/* && mkdir $HOME/turn && chown $CONTAINERUSER:$CONTAINERUSER $HOME/turn
COPY turn.cnf $HOME/turn/turn.cnf
USER $CONTAINERUSER
CMD ["bash","-c","/usr/bin/turnserver -c $HOME/turn/turn.cnf"]
