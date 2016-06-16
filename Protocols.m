#import <Foundation/Foundation.h>
#import "Protocols.h"

@interface Conformer : NSObject <Protocols>
{
}

- (void) thisIsRequired;
- (void) thisIsAlsoRequired;

@end

@implementation Conformer

- (void) thisIsRequired {
	printf ("Required!\n");
}

- (void) thisIsAlsoRequired {
	printf ("Also required!\n");
}

@end

int main() {
	id first = [[Conformer alloc] init];
	id <Protocols> second = [[Conformer alloc] init];
}
