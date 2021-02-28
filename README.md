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
- [License](#License)

## API Methods

- [User creation](#creation)
- [Account creation](#creation)
- [Deposit](#deposit)
- [Withdraw](#deposit)
- [Transaction between user accounts](#transaction)

## API Endpoints

### Scope `/api`

#### Endpoint `/users` <a name="creation" />

Description: create an user with an unique UUID.

Params:

`name`: a string with the user name

`nickname`: a string with a nickname

`email`: a valid e-mail account

`age`: an integer number as a string

`password`: a string with at least 6 digits

Methods: 

- POST

Body: 

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

Headers:

`:id`: unique user UUID

#### Endpoints `/deposit` and `/withdraw` <a name="deposit" />

Description: deposit and withdraw methods for accounts stored in the database.

Params:

`value`: a decimal number as a string

Methods: 

- POST

Body: 

```json
{
    "value": String
}
```

#### Endpoint `/transaction` <a name="transaction" />

Description: perform a transaction between 2 user accounts.

Params:

`from_id`: origin account UUID

`to_id`: destination account UUID

`value`: a decimal number as a string

Methods: 

- POST

Body:

```json
{
    "from_id": String,
    "to_id": String,
    "value": String
}
```

## Project Requirements

- [Mix requirements](./mix.exs)
- [Docker](https://www.docker.com/)
- [Docker compose](https://docs.docker.com/compose/)
- [Postgres database](https://hub.docker.com/_/postgres)

### Create Docker-Compose image from Docker Hub

```sh
docker-compose up -d
```

### Install Phoenix from Mix archive

```sh
mix archive.install hex phx_new 1.5.7\
```

## License
Distributed under the Apache 2.0 License. See [LICENSE](/LICENSE) for more information.
