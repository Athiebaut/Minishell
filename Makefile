NAME = minishell
SRC_DIR = srcs
OBJ_DIR = objs
SRCS = main.c \
	   minishell.c \
	   ft_parse_str.c \
	   ft_parse_str_bis.c \
	   ft_parse_str_ter.c \
	   get_env.c \
	   get_env_utils.c \
	   get_export_env.c \
	   ft_parse_par.c \
	   ft_parse_par_utils.c \
	   ft_parse_par_storage.c \
	   ft_parse_token.c \
	   ft_parse_error_token.c \
	   ft_parse_error_token_utils.c \
	   ft_parse_utils.c \
	   ft_error_message_syntax.c \
	   ft_split_minish_utils.c \
	   ft_split_minish_utils_bis.c \
	   ft_split_minish.c \
	   ft_strlcpy_minish.c \
	   ft_strlcpy_minish_utils.c \
	   ft_split_minish_lst.c \
	   ft_split_minish_lst_bis.c \
	   ft_magic_malloc.c \
	   ft_magic_malloc_utils.c \
	   ft_magic_malloc_utils_bis.c \
	   signal.c \
	   signal_bis.c \
	   heredoc.c \
	   heredoc_utils.c \
	   heredoc_utils_bis.c \
	   exec.c \
	   exec_error.c \
	   exec_exit.c \
	   exec_utils.c \
	   exec_utils_bis.c \
	   exec_utils_ter.c \
	   exec_utils_four.c \
	   exec_par.c \
	   exec_par_utils.c \
	   exec_make_cmd.c \
	   exec_make_cmd_utils.c \
	   exec_std_utils.c \
	   exec_stdin.c \
	   exec_stdin_utils.c \
	   exec_stdout.c \
	   exec_stdout_utils.c \
	   exec_cmd.c \
	   pipex.c \
	   pipex_handle_pipe.c \
	   lpid_utils.c \
	   ft_expand.c \
	   ft_expand_utils.c \
	   ft_expand_utils_bis.c \
	   ft_expand_wildcard.c \
	   wildcards.c \
	   wildcards_utils.c \
	   ft_split_magic_malloc.c \
	   ft_split_magic_isspace.c \
	   ft_strtrim_msh.c \
	   builtin.c \
	   builtin_echo.c \
	   builtin_pwd.c \
	   builtin_export.c \
	   builtin_export_utils.c \
	   builtin_export_utils_bis.c \
	   builtin_export_utils_ter.c \
	   builtin_unset.c \
	   builtin_env.c \
	   builtin_cd.c \
	   builtin_cd_utils.c \
	   builtin_exit.c \
	   builtin_exit_utils.c
SRCS := $(SRCS:%=$(SRC_DIR)/%)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)
DEPS := $(OBJS:.o=.d)
CC = cc
C_FLAGS = -Wall -Wextra -Werror -g3 -MMD
LIB_FLAG = -lreadline
INC_LIBFT = ./libft/libft.a
DIR_DUP     = mkdir -p $(@D)

all : $(NAME)

$(OBJ_DIR)/%.o:$(SRC_DIR)/%.c
	$(DIR_DUP)
	$(CC) $(C_FLAGS) -c $< -o $@

$(NAME) : $(OBJS)
	make -j -C ./libft
	$(CC) $(C_FLAGS) $(OBJS) $(INC_LIBFT) $(LIB_FLAG) -o $@

bonus : $(NAME)

-include $(DEPS)

clean :
	make -j clean -C ./libft
	rm -f $(OBJS)
	rm -rf objs
	rm -f $(DEPS)

fclean : clean
	make -j fclean -C ./libft
	rm -f minishell

re : fclean
	make all

.PHONY : all bonus clean fclean re
