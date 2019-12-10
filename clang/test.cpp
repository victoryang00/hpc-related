#include <iostream>

int main() {
    loop: std::cout << "hello" << std::endl;
    goto loop;
}