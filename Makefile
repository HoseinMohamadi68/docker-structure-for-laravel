COMPOSE_FILES=docker-compose.yml
USER=app
GROUP=app

$(eval CURRENT_UID=$(shell id -u))
$(eval CURRENT_GID=$(shell id -g))


define modify_uid_gid
    $(eval CURRENT_UID=$(shell id -u))
    $(eval CURRENT_GID=$(shell id -g))

    @if [ "$(CURRENT_UID)" -lt "1000" ]; then\
        echo 'You must run target as user has UID >= 1000';\
        exit 1;\
    fi

    @docker-compose -f $(COMPOSE_FILES) exec php_project_test sh -c 'usermod $(USER) -u $(CURRENT_UID) && groupmod $(GROUP) -og $(CURRENT_GID)'
    @docker-compose -f $(COMPOSE_FILES) exec php_project_test sh -c 'chown $(USER):$(USER) /home/$(USER)/provision.sh'
    @docker-compose -f $(COMPOSE_FILES) exec php_project_test sh -c 'chmod -R 777 /home/$(USER)/startup.sh'
endef

define startup
	@$(call modify_uid_gid)
	docker-compose -f $(COMPOSE_FILES) exec php_project_test sh -c '/home/$(USER)/startup.sh'
endef

build:
	docker-compose -f $(COMPOSE_FILES) up -d --build
	$(startup)

up:
	docker-compose -f $(COMPOSE_FILES) up -d
	$(startup)


destroy:
	docker-compose -f $(COMPOSE_FILES) down

status:
	docker-compose -f $(COMPOSE_FILES) ps


shell:
	docker-compose -f $(COMPOSE_FILES) exec --user=$(shell echo $$(id -u)':'$$(id -g)) php_project_test zsh

shell-as-root:
	docker-compose -f $(COMPOSE_FILES) exec php_project_test sh

provision:
	@$(call modify_uid_gid)
	docker-compose -f $(COMPOSE_FILES) exec --user=$(USER) php_project_test sh -c '../provision.sh'

startup:
	$(startup)

check:
	@$(call modify_uid_gid)
	docker-compose -f $(COMPOSE_FILES) exec --user=$(USER) php_project_test sh -c '../check.sh'

update:
	docker-compose -f $(COMPOSE_FILES) exec --user=$(USER) php_project_test 'composer update'
