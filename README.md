Install hex 

```sh
mix archive.install hex phx_new 1.5.7\
```

new project 

```sh
mix phx.new [name] --no-webpack --no-html
```

Test setup

```sh
mix ecto.setup
```

### Add linting

Add credo to defp deps in mix.exs
{:credo, "~> 1.5", only: [:dev, :test], runtime: false}

Update dependencies
mix deps.get

Validate credo

```sh
mix credo gen.config
```