#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Printing.h"
#import "SkyWriting.h"

@interface Prints:NSObject <Printing> {
}
@end

@implementation Prints

/*
 * Firstly, the compiler DOES give a warning if the protocol is not fully 
 * implemented.
 */

- (void) print
{
	NSLog(@"This is Prints printing");
}

@end

@interface Prints (Funky)
// No {} here becuase no FIELDS in category!
@end

@implementation Prints (Funky) 
- (void) funkyPrint
{
	NSLog(@"Funky printing from Prints");
}
@end

/*
 * Hmm, categories CAN implement protocols.
 */
@interface Prints (SW) <Skywriting>
@end

@implementation Prints (SW)
- (void) skyWrite
{
	NSLog(@"Write in the sky! (from Prints)");
}
@end

int main() {
	id<Printing> p = [[Prints alloc] init];
	[p print];
	[p funkyPrint];
	// Casting!
	id<Skywriting> s = (id<Skywriting>)p;
	[s skyWrite];

	id<Printing,Skywriting> ps = [[Prints alloc] init];
	[ps print];
	[ps funkyPrint];
	[ps skyWrite];

	Prints *prints = [[Prints alloc] init];
	[prints print];
	[prints funkyPrint];
	[prints skyWrite];
}

