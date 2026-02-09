#!/bin/bash

INTERFAZ="wlp0s20f3"
DUMP="cap.pcap"
PUERTO_HTTP="80"

tcpdump -i "$INTERFAZ" -w "$DUMP" &

sleep 5
python3 -m http.server "$PUERTO_HTTP" &

sleep 30

servicio_tcpdump =$(pgrep tcpdump)
servicio_python3 =$(pgrep python3)

kill "$servicio_tcpdump"
kill "$servicio_python3"
