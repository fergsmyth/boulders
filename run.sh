#!/bin/sh
./gradlew flywayMigrate
cd resources/dataloader
psql -h localhost -p 5432 -d postgres -U postgres -c "copy grade from '$(pwd)/grade.csv' with (format csv)"
psql -h localhost -p 5432 -d postgres -U postgres -c "copy crag from '$(pwd)/crag.csv' with (format csv)"
psql -h localhost -p 5432 -d postgres -U postgres -c "copy boulder from '$(pwd)/boulder.csv' with (format csv)"
psql -h localhost -p 5432 -d postgres -U postgres -c "copy problem from '$(pwd)/problem.csv' with (format csv)"