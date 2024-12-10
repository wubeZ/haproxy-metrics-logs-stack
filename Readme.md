# HAProxy-Metrics-and-Logs-Stack (HMLS)

Easily route and visualize your HAProxy logs and monitoring with **HAProxy-Metrics-and-Logs-Stack (HMLS)**, a powerful stack that integrates HAProxy, Promtail, Loki, Prometheus, and Grafana for seamless logging, monitoring, and visualization. This project is designed to help you set up a robust, containerized logging pipeline quickly and efficiently.

---

## Features
- **High-Performance Load Balancing** with HAProxy.
- **Centralized Logging** using Promtail and Loki.
- **Metrics Collection** with Prometheus.
- **Beautiful Visualizations** with Grafana dashboards.
- **Plug-and-Play**: Dockerized setup for fast deployment.
- Customizable logging, routing and monitoring rules.

---

## Prerequisites
Ensure the following are installed on your machine:
- Docker
- Docker Compose
- curl (for testing traffic)

---

## Setup Guide

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/haproxy-logs-to-loki.git
cd haproxy-logs-to-loki
```

### 2. Configure Your Environment
Review and customize the provided configuration files:
- **HAProxy**: `haproxy/test.cfg`
- **Promtail**: `promtail/promtail-config.yml`
- **Loki**: `loki/loki-config.yml`
- **Prometheus**: `prometheus/prometheus.yml`
- **Docker Compose**: `docker-compose.yml`

### 3. Start the Stack
Run the following command to:
- Start all services in detached mode.
    ```bash
    make run
    ```
- Stop all running services.
    ```bash
    make stop
    ```
- Build or rebuild all services.
    ```bash
    make build
    ```

This will launch the following containers:
- `haproxy`: Load balancer
- `promtail`: Log collector
- `loki`: Log aggregator
- `prometheus`: Metrics collector
- `grafana`: Visualization platform

### 4. Access the Services
- **Grafana**: [http://localhost:3000](http://localhost:3000)  
  Default credentials:
  - Username: `admin`
  - Password: `admin`

- **HAProxy**: [http://localhost:80](http://localhost:80)
- **Prometheus**: [http://localhost:9090](http://localhost:9090)
- **Loki**: Accessible internally for Promtail at `http://loki:3100`.

### 5. Generate Traffic
Send test traffic to HAProxy to generate logs:
```bash
curl http://localhost:80/app1
curl http://localhost:80/app2
```

### 6. Query Logs in Grafana
1. Log in to Grafana.
2. Add Loki and Prometheus as a data source:
   - Loki URL: `http://loki:3100`
   - Prometheus URL: `http://prometheus:9090`
3. Go to **Explore** and run queries to view logs and metrics:
   - Logs:
        ```
        {job="haproxy_logs"}
        ```
   - Metrics (example HAProxy metrics):
        ```
        haproxy_http_requests_total
        ```

---

## File Structure
```
.
├── haproxy
│   └── test.cfg       # HAProxy configuration
├── promtail
│   └── promtail-config.yml  # Promtail configuration
├── prometheus
│   └── prometheus.yml       # Prometheus configuration
├── loki
│   └── loki-config.yml      # Loki configuration
├── test-app
│   └── index.js           # Test application
├── docker-compose.yml       # Docker Compose file
└── README.md                # Project documentation
```

---

## Troubleshooting

### Common Issues
1. **Logs Not Showing in Grafana**:
   - Ensure Promtail is running and properly configured.
   - Check the `targets` endpoint of Promtail:
     ```bash
     curl http://localhost:9080/targets
     ```
   - Verify Loki is receiving logs by checking its logs:
     ```bash
     docker logs loki
     ```

2. **Connection Refused Errors**:
   - Ensure all services are up and running.
   - Check the Docker network using:
     ```bash
     docker network inspect my-network
     ```

---

## Contributions
Pull requests are welcome! For major changes, please open an issue first to discuss your ideas.

---

## License
[MIT](LICENSE)

---

## Acknowledgments
Thanks to the HAProxy, Loki, Promtail, and Grafana communities for their excellent tools!

