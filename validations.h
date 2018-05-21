#include <regex.h>
#include <sys/types.h>
#include <dirent.h>

void validate_dir(char* dir) {
    DIR* directory = opendir(dir);

}