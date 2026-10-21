# Dockerized Diagnostic CLI

## Description

The Dockerized Diagnostic CLI is a Bash-based command-line application designed to perform basic system diagnostics inside a Docker container.

The application provides information about the operating system, disk usage, and network connectivity.

It is containerized using Docker and can be executed using either Docker CLI or Docker Compose.

## Features

The application supports the following commands:

- **system:** Displays system information, including hostname, current user, operating system, kernel version, uptime, and memory usage.
- **disk:** Displays disk usage and available storage space.
- **network:** Tests network connectivity to a specified hostname using ping.
- **help:** Displays instructions for using the application.

The application also includes:

- A health-check script that verifies the diagnostic script exists and is executable.
- Automated testing using Bash.
- Docker Compose support.
- Exit codes for successful operations, operational failures, and invalid input.

## Requirements

The following software is required:

- Docker Engine or Docker Desktop
- Docker Compose
- Git (for cloning and version control)

## Installation

Clone the project repository:

```bash
git clone https://github.com/dreyyxl/assignment-2.git
```

Navigate into the project directory:

```bash
cd assignment-2
```

Build the Docker image:

```bash
docker build -t diagnostic-tool .
```

## Usage

### Using Docker

Display system information:

```bash
docker run --rm diagnostic-tool system
```

Check disk usage:

```bash
docker run --rm diagnostic-tool disk
```

Test network connectivity:

```bash
docker run --rm diagnostic-tool network google.com
```

Display help:

```bash
docker run --rm diagnostic-tool help
```

### Using Docker Compose

Run the system diagnostic:

```bash
docker compose run --rm diagnostic system
```

Check disk usage:

```bash
docker compose run --rm diagnostic disk
```

Display help:

```bash
docker compose run --rm diagnostic help
```

Test network connectivity:

```bash
docker compose run --rm diagnostic network google.com
```

## Automated Testing

The project includes a Bash testing script named `test.sh`.

The script verifies that the diagnostic application returns the expected exit codes for valid and invalid commands.

Execute the tests:

```bash
./test.sh
```

The automated tests cover:

- Help command
- System information
- Disk usage
- Invalid commands
- Network command without a hostname

A successful test run produces:

```text
Tests passed: 5
Tests failed: 0
All tests passed!
```

## Exit Codes

| Exit Code | Description |
|---|---|
| 0 | Successful execution |
| 1 | Operational failure |
| 2 | Invalid command or missing required argument |

## Project Structure

```text
assignment-2/
├── app/
│   ├── diagnostic.sh
│   └── health-check.sh
├── Dockerfile
├── compose.yaml
├── .dockerignore
├── test.sh
├── grade.sh
└── README.md
```

### File Descriptions

- **app/diagnostic.sh:** Main Bash script containing the diagnostic commands.
- **app/health-check.sh:** Checks whether the diagnostic script exists and has executable permissions.
- **Dockerfile:** Defines the environment and instructions for building the Docker image.
- **compose.yaml:** Defines the diagnostic service for Docker Compose.
- **.dockerignore:** Excludes unnecessary files from the Docker build context.
- **test.sh:** Runs automated tests against the diagnostic application.
- **grade.sh:** Assignment grading script.
- **README.md:** Provides project documentation.

## Technologies Used

- Bash
- Linux (Ubuntu 24.04)
- Docker
- Docker Compose
- Git and GitHub

## Conclusion

This project demonstrates practical DevOps concepts, including Bash scripting, containerization, automated testing, Docker Compose configuration, and project documentation.

It provides a foundation for building and managing containerized command-line applications.