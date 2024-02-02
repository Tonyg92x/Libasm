#*#######################################################
##*          ERASE COMMENTS FOR BONUS PARTS            ##
#*#######################################################

## -----  NAME OF THE PROGRAMM ----- ##
NAME 			= libasm.a 

## ----- CHOOSE COMPILER AND FLAGS ----- ##
ifeq ($(shell uname -s), Linux)
    FLAGS = -felf64
else ifeq ($(shell uname -s), Darwin)
    FLAGS = -fmacho64
else
    $(error Unsupported OS: $(shell uname -s))
endif

## ----- PATH TO FOLDERS ----- ##
SRCS_DIR		= srcs

OBJ_DIR			= obj

## ----- SOURCE FILES ----- ##
SRCS_FILES		= 					\
			ft_strlen.s			

## ----- .C TO .O CONVERT ----- ##
OBJ_FILES		= $(SRCS_FILES:.s=.o)

## ----- ADDPREFIX TO FILES ----- ##
SRCS			= $(addprefix $(SRCS_DIR)/, $(SRCS_FILES))
OBJS			= $(addprefix $(OBJ_DIR)/, $(OBJ_FILES))
VPATH			= $(SRCS_DIR) 

#--------------------------------------------------------------#

## ----- TOOLS AND COLORS ----- ##
RM				= rm -Rf
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
	nasm $(FLAGS) -g -F dwarf -i /usr/include $< -o $@

#	-i  /user/include

all: $(OBJ_DIR) $(NAME)

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

$(OBJ_DIR):
	@echo "$(RED) Making TonyG ASM 64 library $(AQUA)"
	@mkdir -p $(OBJ_DIR)

## ----- CLEAN COMMANDS ----- ##
clean:
	$(RM) $(OBJS) $(B_OBJS)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
