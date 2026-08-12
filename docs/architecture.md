# System Architecture

## Overview

The Linux System Monitoring Dashboard follows a modular Bash architecture.

The main dashboard acts as the controller and executes individual
monitoring modules.

## Data Flow

User
 |
 v
dashboard.sh
 |
 +-- cpu.sh
 +-- memory.sh
 +-- disk.sh
 +-- process.sh
 +-- network.sh
 +-- system.sh
 +-- health.sh
 |
 +-- logger.sh
 |
 v
system-monitor.log

## Modules

### cpu.sh

Collects CPU model, core count and CPU usage.

### memory.sh

Collects total, used, free and available memory.

### disk.sh

Collects filesystem capacity and disk usage.

### process.sh

Collects process statistics and identifies top CPU/memory processes.

### network.sh

Collects network interfaces, IP address, network statistics and connections.

### system.sh

Collects operating system, kernel, architecture, uptime and load information.

### health.sh

Evaluates system resources and generates health statuses.

### logger.sh

Stores monitoring information with timestamps.

## Refresh Mechanism

The dashboard runs continuously and refreshes every five seconds.

A SIGINT/SIGTERM handler provides graceful shutdown.

## Technologies

Bash
Linux
AWK
/proc filesystem
Git
GitHub
