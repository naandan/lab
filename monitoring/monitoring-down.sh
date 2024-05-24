#!/bin/bash

systemctl stop prometheus
systemctl stop node_exporter
systemctl stop grafana-server

systemctl disable prometheus
systemctl disable node_exporter
systemctl disable grafana-server

rm /etc/systemd/system/prometheus.service
rm /etc/systemd/system/node_exporter.service

apt remove --purge grafana -y
apt autoremove -y

deluser prometheus
delgroup prometheus

rm -rf /usr/local/bin/prometheus /usr/local/bin/promtool /usr/local/bin/node_exporter
rm -rf /etc/prometheus /var/lib/prometheus /etc/apt/sources.list.d/grafana.list /etc/apt/trusted.gpg.d/grafana.gpg /etc/apt/keyrings/grafana.gpg
rm -rf /etc/grafana
systemctl daemon-reload

echo "Instalasi Prometheus, Node Exporter, dan Grafana telah dihapus."
