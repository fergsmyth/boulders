### Postgres
docker run --rm   --name pg-docker -e POSTGRES_PASSWORD=docker -d -p 5432:5432 -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data  postgres
psql -h localhost -U postgres -d postgres

### Python environment
Create virtual environment .venv
python3 -m venv .venv

Launch environment
(cygwin) source .venv\Scripts\activate
(windows) .venv\Scripts\activate.bat
(unix) source .venv/bin/activate

