NAME = so_long
CC = cc
CFLAGS = -Wextra -Wall -Werror
LIBPATH = ./minilibx-linux
LDFLAGS = -Lminilibx-linux -lmlx_Linux -lXext -lX11 
SRCS = ./mandatory/get_next_line.c ./mandatory/graphics.c \
	./mandatory/so_long.c ./mandatory/map_check1.c \
	./mandatory/map_check2.c ./mandatory/moves.c \
	./mandatory/utils.c ./mandatory/utils2.c
SRCS_B = ./bonus/graphics2_bonus.c ./bonus/get_next_line_bonus.c \
	./bonus/graphics_bonus.c ./bonus/map_check1_bonus.c \
	./bonus/map_check2_bonus.c ./bonus/moves_bonus.c \
	./bonus/so_long_bonus.c ./bonus/utils_bonus.c \
	./bonus/utils2_bonus.c 
OBJS_B = $(SRCS_B:.c=.o)
OBJS = $(SRCS:.c=.o)

$(NAME): $(OBJS)
	@make -C $(LIBPATH)
	@$(CC) $(CFLAGS) $(OBJS) $(LDFLAGS) -o $(NAME)
	@clear
	@echo "\033[32m🎉 Compilation Successful!\033[0m"
	@norminette $(SRCS)
	
all: $(NAME)

bonus: $(OBJS_B)
	@make -C $(LIBPATH)
	@$(CC) $(CFLAGS) $(OBJS_B) $(LDFLAGS) -o $(NAME)
	@clear
	@echo "\033[32m🎉 Compilation Successful!\033[0m"
	@norminette $(SRCS_B)

%.o: %.c
	$(CC) $(CFLAGS)  -c $< -o $@

re: fclean all

clean :
	rm -rf ./mandatory/*.o
	rm -rf ./bonus/*.o

fclean : clean
	rm -rf $(NAME)
