# Rocketpay API

## Project Requirements

- [Requirements file](./mix.exs)

## Add linting

Add credo to defp deps in mix.exs
{:credo, "~> 1.5", only: [:dev, :test], runtime: false}

## Install Phoenix

```sh
mix archive.install hex phx_new 1.5.7\
```

## Commands

### New Project

```sh
mix phx.new [name] --no-webpack --no-html
```

### Test setup

```sh
mix ecto.setup
```

### Update dependencies

```sh
mix deps.get
```

### Validate credo

```sh
mix credo gen.config
```

### Migrations

#### Create database

```sh
mix ecto.create
```

#### Create table migration file

```sh
mix ecto.gen.migration [table_name]
```

#### Create migration

```sh
mix ecto.migrate
```

#### Drop tables

```sh
mix ecto.drop
```
