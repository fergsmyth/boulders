docker run -d -p 5432:5432 \
  --name boulders \
  -e "POSTGRES_PASSWORD=crankit" \
  -e "PGDATA=/var/lib/postgresql/data/pgdata" \
  -v "${PWD}/data:/var/lib/postgresql/data" \
  postgres
