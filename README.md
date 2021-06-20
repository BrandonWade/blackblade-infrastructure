# [blackblade-infrastructure](https://blackblade.ca)

The infrastructure components for [blackblade](https://github.com/BrandonWade/blackblade).

## Getting Started

### Core Infrastructure

1. Run `docker-compose up --build -d` to start the db container
2. [Optional] Clone the [blackblade-batch](https://github.com/BrandonWade/blackblade-batch) repo
3. [Optional] When the container finishes starting, `cd` into `blackblade-batch`
4. [Optional] Run `docker-compose up --build` to start the batch container

### Database Backups

1. Ensure the db container is running
2. Run `docker-compose -f docker-compose.backup.yml up --build -d` to start the db backup container
3. [Optional] Confirm the file is visible in the Docker Control Spaces control panel

## Restoring From a Backup

1. Download the compressed backup from the Digital Ocean Spaces control panel
2. Decompress the file using `gzip -dk [file name]`
3. Run `kubectl get pods` to find the name of the db pod
4. Run `kubectl port-forward [db pod name] 3306:3306` to connect to the production db pod
5. Import the backup file into the production db pod
6. Use `ctrl+c` to kill the `kubectl port-forward`command
