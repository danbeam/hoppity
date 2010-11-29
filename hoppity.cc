#include <iostream>
#include <sstream>
#include <fstream>

//#define DEBUG

int main (int argc, char *argv[]) {

    if (argc <= 1) {
        std::cerr << "You need to specify a filename!" << std::endl
                  << "Usage: " << argv[0] << " <filename>" << std::endl;
        return 1;
    }

#ifdef DEBUG
    std::cout << "Trying to open " << argv[1] << std::endl;
#endif

    std::ifstream in_file;
    in_file.open(argv[1], std::fstream::in);

    if (!in_file.is_open()) {
        std::cerr << "That file doesn't exist or it's not readable!" << std::endl;
        return 1;
    }

    int to_count = -1;
    char buffer[100];

    do {
        in_file.getline(buffer, 100);
        sscanf(buffer, "%d", &to_count);
    }
    while (!in_file.eof() && to_count < 0);

    in_file.close();

#ifdef DEBUG
    std::cout << "Got value of " << to_count << " from file." << std::endl;
#endif

    for (int i = 1; i <= to_count; ++i) {
        if (0 == i % 15) {
            std::cout << "Hop" << std::endl;
        }
        else if (0 == i % 3) {
            std::cout << "Hoppity" << std::endl;
        }
        else if (0 == i % 5) {
            std::cout << "Hophop" << std::endl;
        }
    }

    return 0;

}
