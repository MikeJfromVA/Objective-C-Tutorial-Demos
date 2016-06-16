#import <Foundation/foundation.h>

@interface Ship : NSObject
- (void) firePhotonTorpedos;
- (void) noBelayThatPhotonTorpedoOrderWithName: (NSString *)name;
@end

@implementation Ship
- (void) firePhotonTorpedos {
	printf("BOOM!\n");
}

- (void) noBelayThatPhotonTorpedoOrderWithName: (NSString *)name {
	printf("Explain yourself, Captain %s!!!\n",[[name description] UTF8String]);
}

@end

int main() {
	// Get an autorelease error without this!!!
	// It happens between the two performSelectors below
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	SEL makeItSo = @selector(firePhotonTorpedos);
	SEL warpSpeed = @selector(noBelayThatPhotonTorpedoOrderWithName:);

	Ship *s = [[Ship alloc] init];
	[s performSelector:makeItSo];
	[s performSelector:warpSpeed withObject:@"Sulu"];

	CFShow(@"This is an Objective-C NSString");
	CFShow([NSString stringWithFormat:@"Formatting: %d\n",7]);
}

