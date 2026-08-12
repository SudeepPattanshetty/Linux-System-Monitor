Linux System Monitoring Dashboard
=================================

A Bash-based Linux system monitoring dashboard that collects
and displays real-time system information, resource usage,
process statistics, network information, system health and logs.

Features
--------

- CPU monitoring
- Memory monitoring
- Disk monitoring
- Process monitoring
- Network monitoring
- System information
- Health status
- Color-coded alerts
- Real-time dashboard refresh
- Monitoring logs
- Log viewer
- Graceful Ctrl+C shutdown

Architecture
------------

                    dashboard.sh
                         |
       +-----------------+------------------+
       |        |        |        |         |
      CPU     Memory    Disk   Process   Network
       |        |        |        |         |
       +--------+--------+--------+---------+
                         |
                  System Information
                         |
                    Health Check
                         |
                       Logger
                         |
                  system-monitor.log

Project Structure
-----------------

linux-system-monitor/
|
+-- dashboard.sh
|
+-- modules/
|   +-- cpu.sh
|   +-- memory.sh
|   +-- disk.sh
|   +-- process.sh
|   +-- network.sh
|   +-- system.sh
|   +-- health.sh
|   +-- logger.sh
|   +-- log-viewer.sh
|   +-- colors.sh
|   +-- status.sh
|
+-- docs/
+-- logs/
+-- screenshots/
+-- README.md
+-- LICENSE
+-- .gitignore

Technologies
------------

- Linux
- Bash
- AWK
- GNU Coreutils
- proc filesystem
- ps
- top
- df
- free
- ip
- ss
- Git
- GitHub

Linux Concepts Used
-------------------

- CPU management
- Process management
- Memory management
- Disk management
- Network monitoring
- /proc filesystem
- Shell scripting
- Bash functions
- Conditional statements
- Loops
- Signal handling
- Logging
- File permissions

Requirements
------------

- Linux / Ubuntu
- Bash 5+
- Git
- Standard Linux utilities

Installation
------------

Clone the repository:

git clone git@github.com:SudeepPattanshetty/Linux-System-Monitor.git

Enter the project:

cd Linux-System-Monitor

Make scripts executable:

chmod +x dashboard.sh
chmod +x modules/*.sh

Run the dashboard:

./dashboard.sh

Dashboard
---------

The dashboard refreshes automatically every 5 seconds.

Press Ctrl+C to exit.

Monitoring
----------

The dashboard monitors:

CPU
----
CPU model, CPU cores and CPU usage.

Memory
------
Total, used, free and available memory.

Disk
----
Filesystem capacity, used space, available space and usage status.

Processes
---------
Total, running, sleeping, stopped and zombie processes.
Top CPU and memory consuming processes.

Network
-------
Network interfaces, IP address, RX/TX statistics and active connections.

System
------
Hostname, operating system, kernel, architecture, CPU information,
uptime and load average.

Health
------
The system health module classifies resource usage as:

NORMAL
WARNING
CRITICAL

Logging
-------

Monitoring data is stored locally in:

logs/system-monitor.log

Generated logs are excluded from Git using .gitignore.

Future Improvements
-------------------

- Interactive terminal menu
- Historical metrics
- CPU/memory graphs
- Email notifications
- Configuration file
- Docker support
- Prometheus integration
- Grafana dashboard
- AWS CloudWatch integration
- Systemd service
- Remote server monitoring
