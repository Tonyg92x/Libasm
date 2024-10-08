#*#######################################################
##*          ERASE COMMENTS FOR BONUS PARTS            ##
#*#######################################################

## -----  NAME OF THE PROGRAMM ----- ##
NAME 			= libasm.a 
TEST_NAME		= libasm_test.elf

## ----- CHOOSE COMPILER AND FLAGS ----- ##
ifeq ($(shell uname -s), Linux)
    FLAGS = -felf64
else ifeq ($(shell uname -s), Darwin)
    FLAGS = -fmacho64
else
    $(error Unsupported OS: $(shell uname -s))
endif

CC			= gcc
CFLAGS			= -Wall -Wextra -Werror

## ----- PATH TO FOLDERS ----- ##
SRCS_DIR		= srcs
OBJ_DIR			= obj
INCLUDE_DIR		= includes/

## ----- SOURCE FILES ----- ##
SRCS_FILES		= 					\
			ft_read.s				\
			ft_strcmp.s				\
			ft_strcpy.s				\
			ft_strdup.s				\
			ft_strlen.s				\
			ft_write.s

## ----- .C TO .O CONVERT ----- ##
OBJ_FILES		= $(SRCS_FILES:.s=.o)

## ----- ADDPREFIX TO FILES ----- ##
SRCS			= $(addprefix $(SRCS_DIR)/, $(SRCS_FILES))
OBJS			= $(addprefix $(OBJ_DIR)/, $(OBJ_FILES))
VPATH			= $(SRCS_DIR) 

#--------------------------------------------------------------#

## ----- TOOLS AND COLORS ----- ##
RM			= rm -Rf
NO_PRINT		= --no-print-directory
RED 			= \033[31m
GREEN 			= \033[32m
YELLOW 			= \033[33m
BLUE 			= \033[34m
PINK 			= \033[35m
AQUA 			= \033[36m
GREY 			= \033[37m
UNDERLINE 		= \033[4m
NORMAL 			= \033[0m


$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.s
	nasm $(FLAGS) -g -F dwarf -I $(INCLUDE_DIR) -i /usr/include $< -o $@

#	-i  /user/include

all: $(OBJ_DIR) $(NAME)

build: all
	$(CC) -g $(SRCS_DIR)/main.c -I $(INCLUDE_DIR) -L. -lasm -o $(TEST_NAME) 

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJ_DIR):
	@echo "Making TonyG ASM 64 library"
	@mkdir -p $(OBJ_DIR)

## ----- CLEAN COMMANDS ----- ##
clean:
	$(RM) $(OBJS) $(B_OBJS)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME) $(TEST_NAME)

re: fclean all build

.PHONY: all clean fclean re
