include .env
export

.PHONY: help up down down-force migrate-up migrate-down migrate-version

help:
	@echo "make up              - start and build app + postgres + redis"
	@echo "make down            - stop all containers"
	@echo "make down-force      - stop all containers and remove data"
	@echo "make migrate-up      - run pending migrations"
	@echo "make migrate-down    - revert last migration"
	@echo "make migrate-version - show current migration version"

up:
	docker compose up --build -d

down:
	docker compose down

down-force:
	docker compose down -v

MIGRATE_DSN = postgres://$(DB_USER):$(DB_PASSWORD)@$(DB_HOST):$(DB_PORT)/$(DB_NAME)?sslmode=disable

migrate-up:
	docker compose run --rm migrate \
  	-path=/migrations \
		-database="$(MIGRATE_DSN)" \
		up

migrate-down:
	docker compose run --rm migrate \
	  -path=/migrations \
		-database="$(MIGRATE_DSN)" \
		down 1

migrate-version:
	docker compose run --rm migrate \
    -path=/migrations \
		-database="$(MIGRATE_DSN)" \
		version

logs:
	docker compose logs -f app
