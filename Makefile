DC=docker-compose

build: ## Build
	@$(DC) build
up: ## Docker UP
	@$(DC) up -d
down: ## Docker Down
	@$(DC) down
restart: ## Docker Restart
	@$(DC) restart
reload: ## Docker Reload
	@$(DC) down
	@$(DC) up -d
ps: ## Docker ps
	@$(DC) ps
logs: ## Docker logs
	@$(DC) logs
exec: ## Docker Exec | args NAME
	@$(DC) exec $(NAME) bash
clean: ## Docker Clean !!手持ちのイメージ、ボリュームがすべて消えます。!!
	@docker image prune
	@docker volume prune
new:
	# @$(DC) run web rails new . --force --no-deps --skip-bundle // スキップいらない？
	@make build
	@$(DC) run web rails new . --force --no-deps
	@$(DC) run web bundle install
	@$(DC) run web bundle exec rails webpacker:install
	@make up