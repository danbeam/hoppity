#include <stdio.h>
#include <libgen.h>

//#define DEBUG

int main (int argc, char *argv[]) {

    if (argc <= 1) {
        fprintf(stderr, "You need to specify a filename!\n");
        fprintf(stderr, "Usage: %s <filename>\n", basename(argv[0]));
        return 1;
    }

#ifdef DEBUG
    printf("Trying to open %s ...\n", argv[1]);
#endif

    FILE *in_file = fopen(argv[1], "r");

    if (NULL == in_file) {
        fprintf(stderr, "That file doesn't exist or it's not readable!\n");
        return 1;
    }

    // remember, the number could be 0 or we could've got an error
    // atoi() doesn't distinguish or return NULL
    int to_count = -1;
    char buffer[100];

    do {
        fgets(buffer, 100, in_file);
        to_count = atoi(buffer);
    }
    while (!feof(in_file) && to_count <= 0);
    
    fclose(in_file);
   
#ifdef DEBUG
    printf("Got value of %d from file.\n", to_count);
#endif

    int i;

    for (i = 1; i <= to_count; ++i) {
        if (0 == i % 15) {
            printf("Hop\n");
        }
        else if (0 == i % 3) {
            printf("Hoppity\n");
        }
        else if (0 == i % 5) {
            printf("Hophop\n");
        }
    }

    return 0;

}
