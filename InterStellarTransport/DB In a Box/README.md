# README

The objective of this repository is to create a simple to use

## Prerequisites & Setup

### Docker

[Install Docker](https://docs.docker.com/docker-for-windows/install/) (Community edition is fine), and [docker-compose](https://docs.docker.com/compose/install/).

Note that on Windows you want to set it to run with Linux containers, and assign at least 4GB of memory to the VM.

## Usage

```bash
docker run -p 1433:1433 local-registry:5000/interstellar-transport/sql-server
```

## Development & Tinkering

Clone this repo and ensure that you have docker-compose installed.
Create a ```.env``` file in the root directory and set the following environment variables for working locally:

```env
SA_PASSWORD=...
TEST_ACCOUNT_PASSWORD=...
```

Don't forget that the passwords need to meet SQL Server's length and complexity requirements.

Then run:

```bash
docker-compose build
```

```bash
docker-compose up
```
