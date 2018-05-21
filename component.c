#include <studio.h>
#include "validations.h"
#include "component.h"

void create_component() {
        char* name, component_dir, style_option, option_class, option_store;
        int style = 0;

        printf("component name: ");
        scanf("%s", name);

        printf("enter directory path where component should be created: ");
        scanf("%s", component_dir);

        validate_dir(&component_dir);

        printf("create style file? (y/n): ");
        scanf("%s", style_option);

        validate_option(&style_option, "(y|Y)|(n|N)");

        if (match_option(option, "y|Y")) {
                stlye = 1;
        }

        printf("create component %s as a class? (y/n): ");
        scanf("%s", option_class);

        validate_option(&option_class, "(y|Y)|(n|N)");

        if (match_option(option, "y|Y")) {
                printf("connect to store? (y/n): ");
                scanf("%s", option_store);

                validate_option(&option_store, "(y|Y)|(n|N)");

                if (match_option(option_store, "y|Y")) {
                        write_component("store_connect", component_dir, stlye);
                } else {
                        wite_component("class_component", component_dir, stlye);
                }
        } else {
                write_component("function_component", component_dir, style);
        }
}