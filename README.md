## Setup in Local


``` bash
# clone from repository
$ git clone https://github.com/elikristina-mitrais/kargo-hackathon-be.git

# go to the working directory
$ cd kargo-hackathon-be

# edit config/dev.exs file to configure database
## username: "postgres",
## password: "postgres",
## database: "kargohackathon_dev",
## hostname: "localhost",

# configure database
$ mix ecto.create

# start phonix app
$ mix phx.server
```