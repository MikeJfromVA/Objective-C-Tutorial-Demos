#import <Foundation/Foundation.h>

@interface Foo:NSObject {
}
- (void) doIt;
@end

@implementation Foo

- (void) doIt {
	NSMutableArray *ma1 = [[NSMutableArray alloc] init];
	[ma1 addObject: @"Yes, I'm adding a string"];
	[ma1 addObject: @"Oh String, Oh String"];

	// This creates a leak! Runtime complains about no pool in place
	// so it must try to release at the end of the block?
	// So we use a pool. Old way:
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	NSMutableArray *ma2 = [[NSMutableArray alloc] init];
	for (id a in ma1) {
		[ma2 addObject:[NSString stringWithFormat:@"%@", a, nil]];
	}
	for (id a in ma2) {
		NSLog(@"%@",a);
	}
	[pool drain];
	// New way:
	@autoreleasepool {
		ma2 = [[NSMutableArray alloc] init];
		for (id a in ma1) {
		  [ma2 addObject:[NSString stringWithFormat:@"%@", a, nil]];
		}
		for (id a in ma2) {
			NSLog(@"%@",a);
		}
	}
}

@end

int main (int argc, char**argv) {
}

