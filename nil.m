#import <Foundation/foundation.h>

// main with no args works
int main () {
	NSString *string; // nil by default

	if (!string) {
		printf ("String is nil!\n");
	}

	[string stringByAppendingString:@"nothing"];
}
