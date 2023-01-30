
# colors
RED = \033[0;31m
GREEN = \033[0;32m
YELLOW = \033[0;33m
BLUE = \033[0;34m
PURPLE = \033[0;35m
CYAN = \033[0;36m
WHITE = \033[0;37m

USER = shinra



all : 
	@echo "${GREEN}creating folders...${WHITE}"

	@mkdir -p /home/${USER}/data/wp_database
	@mkdir -p /home/${USER}/data/wp_files

	@echo "${GREEN}building images...${WHITE}"
	@docker-compose -f srcs/docker-compose.yml up --build

down :
	@echo "${GREEN}removing containers...${WHITE}"
	@docker-compose -f srcs/docker-compose.yml down

ps :
	@echo "${GREEN}containers status...${WHITE}"
	@ docker-compose -f srcs/docker-compose.yml ps

fclean : down
	@echo "${RED}removing images...${WHITE}"
	@docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	docker system prune -a --force
	sudo rm -Rf /home/${USER}/data/wp_database
	sudo rm -Rf /home/${USER}/data/wp_files

re : fclean all
.PHONY : all down ps fclean re