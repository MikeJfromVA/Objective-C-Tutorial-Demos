#include <Foundation/Foundation.h>

void logblock (int ( ^ theBlock) (void) ) {
    NSLog(@"%i", theBlock());
}

int main() {
    int x;

    x = 42;

    int (^ myBlock) (void);

    myBlock = ^(void) {
        return x;
    };
    // 42! Lexical context for primitives

    x = 43;

    logblock(myBlock);

    __block int y;
    y = 62;

    myBlock = ^(void) {
        y++;
        return y;
    };

    logblock(myBlock);
    NSLog(@"%i",y);
}

