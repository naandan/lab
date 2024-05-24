PROMETHEUS_VERSION=2.52.0
NODE_EXPORTER_VERSION=1.8.1

#wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
#wget https://github.com/prometheus/node_exporter/releases/download/v${NODE_EXPORTER_VERSION}/node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz

tar xvf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz
tar xvf node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64.tar.gz

mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/prometheus prometheus-${PROMETHEUS_VERSION}.linux-amd64/promtool /usr/local/bin/
mv node_exporter-${NODE_EXPORTER_VERSION}.linux-amd64/node_exporter /usr/local/bin/

groupadd --system prometheus
useradd --system -s /sbin/nologin -g prometheus prometheus

mkdir /etc/prometheus /var/lib/prometheus
mv prometheus-${PROMETHEUS_VERSION}.linux-amd64/consoles/ prometheus-${PROMETHEUS_VERSION}.linux-amd64/console_libraries/ /etc/prometheus/

cat <<EOF > /etc/prometheus/prometheus.yml
global:
  scrape_interval: 15s
  evaluation_interval: 15s

scrape_configs:
  - job_name: "prometheus"
    static_configs:
      - targets: ["localhost:9090"]
  - job_name: "node-exporter"
    static_configs:
      - targets: ["localhost:9100"]
EOF

chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus

cat <<EOF > /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
Documentation=https://prometheus.io/docs/introduction/overview/
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \\
  --config.file /etc/prometheus/prometheus.yml \\
  --storage.tsdb.path /var/lib/prometheus/ \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter

[Service]
Restart=always
User=prometheus
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF

sudo apt-get install -y apt-transport-https software-properties-common wget
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
apt-get update -y
apt-get install grafana -y

systemctl daemon-reload
systemctl enable prometheus
systemctl enable node_exporter
systemctl enable grafana-server

systemctl start prometheus
systemctl start node_exporter
systemctl start grafana-server
