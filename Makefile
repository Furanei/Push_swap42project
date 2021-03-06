# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mbriffau <mbriffau@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/09/30 18:29:49 by mbriffau          #+#    #+#              #
#    Updated: 2017/10/02 04:09:26 by mbriffau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Compilation
CC =		clang
CFLAGS =	-Wall -Wextra -Werror
ADDFLAGS = 

# Default rule
DEFRULE =	all

NAME =		push_swap

# Directories
SRCDIR =	srcs
OBJDIR =	objs
INCDIR =	includes\

# Sources
SRC = \
		checker.c \
		check.c \
		parsing.c \
		swap.c \
		push.c \
		rotate.c \
		reverse_rotate.c \
		order.c \
		printest.c

OBJ =		$(SRC:.c=.o)

# Prefixes
LIBFT =		-Llibftprintf/ -lft

# Paths foreach
LIBP =		$(addprefix -L, $(LIBNAME)/)
OBJP =		$(addprefix $(OBJDIR)/, $(SRC:.c=.o))
INCP =		$(foreach dir, $(INCDIR), -I$(dir))

# **************************************************************************** #
# SPECIAL CHARS

LOG_CLEAR		= \033[2K
LOG_UP			= \033[A
LOG_NOCOLOR		= \033[0m
LOG_BOLD		= \033[1m
LOG_UNDERLINE	= \033[4m
LOG_BLINKING	= \033[5m
LOG_BLACK		= \033[1;30m
LOG_RED			= \033[1;31m
LOG_GREEN		= \033[1;32m
LOG_YELLOW		= \033[1;33m
LOG_BLUE		= \033[1;34m
LOG_VIOLET		= \033[1;35m
LOG_CYAN		= \033[1;36m
LOG_WHITE		= \033[1;37m

# **************************************************************************** #
# RULES

# Main rules
default:
	@echo -e "$(LOG_BOLD)Default execution: rule $(DEFRULE)$(LOG_NOCOLOR)"
	@make $(DEFRULE)
	@echo -e "$(LOG_BOLD)Execution finished     $(LOG_NOCOLOR)ヽ(ヅ)ノ"

all: $(OBJDIR) $(NAME)

re: fclean all

# Compilation rules

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@echo -e "--$(LOG_CLEAR)$(LOG_VIOLET)$(NAME)$(LOG_NOCOLOR)........................ $(LOG_YELLOW)$<$(LOG_NOCOLOR)$(LOG_UP)"
	@$(CC) $(CFLAGS) $(ADDFLAGS) -c -o $@ $^ $(INCP)

$(OBJDIR):
	@echo -e "$(LOG_CLEAR)$(LOG_BLUE)build $(NAME)$(LOG_NOCOLOR)"
	@mkdir -p $(OBJDIR)

$(NAME): $(OBJP)
	@$(CC) $(CFLAGS) $(ADDFLAGS) -o $@ $^ $(INCP) libftprintf/libftprintf.a

.PHONY: fclean clean re

clean:
	@rm -rf $(OBJDIR)

fclean:
	@rm -rf $(OBJDIR)
	@rm -f $(NAME)