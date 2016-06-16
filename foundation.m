#import <Foundation/foundation.h>

int main() {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

	// C Array to NSArray for fun!!!
	NSString* carray[3];
	carray[0] = @"This";
	carray[1] = @"That";
	carray[2] = @"Theother";

	NSArray *nsarray = [NSArray arrayWithObjects:carray count:3];

	for (NSString *string in nsarray) {
		CFShow(string);
	}

	NSArray *nsarray2 = [NSArray arrayWithObjects:
		[NSNumber numberWithInt:4],
		[NSNumber numberWithInt:4],
		[NSNumber numberWithInt:8],
		nil];
	NSDictionary *dict = [NSDictionary dictionaryWithObjects:
		nsarray2 forKeys:nsarray];

	NSString *lookup = @"Theother";
	CFShow([NSString stringWithFormat:@"%@ has %d letters",
		lookup,
		[[dict objectForKey:lookup] intValue]
		]);

	[dict writeToFile:@"./plist.txt" atomically:NO];
}


