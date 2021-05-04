# README

## Requirements

* [Docker Desktop](https://www.docker.com/products/docker-desktop)

## Installation

From the project folder, run bundle:
```
$ docker-compose run web bundle install
```

Build the app:
```
$ docker-compose build
```

Start the containers:
```
$ docker-compose up
```

Create and migrate the database:

```
$ docker-compose run web bundle exec rails db:create db:migrate
```

## RSpec

There are [model specs](https://github.com/albertobajo/hivency-backend-test/tree/master/spec/models) and [request specs](https://github.com/albertobajo/hivency-backend-test/tree/master/spec/requests/api/v1).

```
$ docker-compose run web bundle exec rspec
```

## Guard
```
$ docker-compose run web bundle exec guard --clear
```

## Requird Endpoints

### 1. Game play

#### URL

```
curl --location --request POST 'localhost:3000/api/v1/games.json' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "Lucía",
    "move": "paper"
}'
```

#### Sample Payload

```
{
    "name": "Lucía",
    "move": "paper"
}
```

#### Sample Response

```
{
    "moves": [
        {
            "name": "Lucía",
            "move": "paper"
        },
        {
            "name": "Bot",
            "move": "rock"
        }
    ],
    "result": "Lucía wins",
    "created_at": "2021-05-03 15:24:06 UTC"
}
```

### 2. History

#### cURL

`curl --location --request GET 'localhost:3000/api/v1/games.json'`

#### Sample Response

```
{
    "data": [
        {
            "moves": [
                {
                    "name": "Lucía",
                    "move": "paper"
                },
                {
                    "name": "Bot",
                    "move": "rock"
                }
            ],
            "result": "Luci wins",
            "created_at": "2021-05-01 17:40:52 UTC"
        },
        {
            "moves": [
                {
                    "name": "John",
                    "move": "paper"
                },
                {
                    "name": "Bot",
                    "move": "rock"
                }
            ],
            "result": "John wins",
            "created_at": "2021-05-02 18:18:25 UTC"
        },
        {
            "moves": [
                {
                    "name": "John",
                    "move": "scissors"
                },
                {
                    "name": "Bot",
                    "move": "rock"
                }
            ],
            "result": "Bot wins",
            "created_at": "2021-05-02 18:18:31 UTC"
        },

        [...]
        
        {
            "moves": [
                {
                    "name": "Megan",
                    "move": "paper"
                },
                {
                    "name": "Bot",
                    "move": "scissors"
                }
            ],
            "result": "Bot wins",
            "created_at": "2021-05-02 18:26:40 UTC"
        }
    ],
    "meta": {
        "total_games": 62
    },
    "links": {
        "first_url": "http://localhost:3000/api/v1/games.json?page=1",
        "prev_url": "http://localhost:3000/api/v1/games.json?page=",
        "page_url": "http://localhost:3000/api/v1/games.json?page=1",
        "next_url": "http://localhost:3000/api/v1/games.json?page=2",
        "last_url": "http://localhost:3000/api/v1/games.json?page=4"
    }
}
```