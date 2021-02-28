<p align="center">
    <img src=".github/rocketpay.png" width="250px" />
    <br/>
    <img src="https://img.shields.io/github/languages/count/vcwild/rocketpay-api?color=%2300DE96&style=flat-square" alt="languages" />
    <img src="https://img.shields.io/github/license/vcwild/rocketpay-api?color=%2300DE96&style=flat-square" alt="license" />
    <img src="https://img.shields.io/github/repo-size/vcwild/rocketpay-api?color=%2300DE96&style=flat-square" alt="repo size" />
</p>

# Rocketpay API

Rocketpay API is a backend banking application interface for bank account creation and management created with [Phoenix](https://hexdocs.pm/phoenix/Mix.Tasks.Phx.New.html), [Ecto](https://hexdocs.pm/ecto/), and a dockerized [Postgres](https://www.postgresql.org/) database.

## Table of Contents

- [API Methods](#API-Methods)
- [API Endpoints](#API-Endpoints)
- [Project Requirements](#Project-Requirements)
- [References](#References)

## API Methods

- [User creation](#creation)
- [Account creation](#creation)
- [Deposit](#deposit)
- [Withdraw](#deposit)
- [Transaction between user accounts](#transaction)

## API Endpoints

### Scope `/api`

#### Endpoint `/users` <a name="creation" />

- POST

```json
 {
    "name": String,
    "nickname": String,
    "email": email@email.com,
    "age": Integer,
    "password": String
}
```

### Scope `/api/accounts/:id`

Description:

`:id`: unique user UUID

#### Endpoints `/deposit` and `/withdraw` <a name="deposit" />

- POST

```json
{
    "value": String
}
```

#### Endpoint `/transaction` <a name="transaction" />

- POST

```json
{
    "from_id": String,
    "to_id": String,
    "value": String
}
```

n be configured to do so; if you're usi
## Project Requirements

- [Mix requirements](./mix.exs)
- [Docker](https://www.docker.com/)
- [Docker compose](https://docs.docker.com/compose/)
- [Postgres database](https://hub.docker.com/_/postgres)

### Create Docker-Compose Image from Docker Hub

```sh
docker-compose up -d
```

### Install Phoenix from Mix archive

```sh
mix archive.install hex phx_new 1.5.7\
```
