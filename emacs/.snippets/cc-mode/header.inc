# name: top description with header included
# key: headi
# --
head$0
#include "`(file-name-nondirectory (file-name-sans-extension buffer-file-name))`.`(if (string= "c" (file-name-extension buffer-file-name)) "h" "hh")`"
