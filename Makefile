NAME = inception

all : $(NAME)

$(NAME) :
	mkdir -p "/home/hlachkar/data/wordpress"
	mkdir -p "/home/hlachkar/data/mariadb"
	docker compose -f ./srcs/docker-compose.yml up --build -d

down :
	docker compose -f ./srcs/docker-compose.yml down
	
restart :
	docker compose -f ./srcs/docker-compose.yml restart


prune :
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes

re : fclean all
	

clean : down prune


fclean : clean
	sudo rm -rf /home/hlachkar/data/wordpress
	sudo rm -rf /home/hlachkar/data/mariadb
