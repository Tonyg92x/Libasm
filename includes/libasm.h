#pragma once

#include <sys/types.h>

ssize_t	ft_read(int fd, void *buf, size_t count);
char*	ft_strcpy(char* restrict dst, const char* src);
int	ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_strdup(const char *s);
size_t	ft_strlen(const char* s);
ssize_t	ft_write(int fd, const void* ptr, size_t count);
