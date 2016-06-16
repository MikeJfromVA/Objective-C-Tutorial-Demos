#import "Laugh.h"

/*
 * This demo shows a class cluster (an abstract factory in Obj C)
 */
/*
 * Interesting note: With no autorelease pool in place, autorelease generates
 * run-time errors.
 */
@interface Giggle : Laugh {
}
/*
 * Do I need to redeclare -(void)laugh in the interface here? It is inherited
 * from the parent. So can I override it without redeclaring? Answer: It turns
 * out that you can override it without redeclaring it (makes sense). Also,
 * ObjC methods seem to be virtual [(Laugh *)giggle laugh] giggles.
 */
@end

@interface Guffaw : Laugh {
}

@end

@implementation Laugh

- (void) laugh
{
	NSLog(@"Humbug. They made me implement this!");
}

- (Laugh *) initWithLaugh: (int) type {
	switch (type) {
	case kLaughTypeGiggle:
		return [[Giggle alloc] init];
	case kLaughTypeGuffaw:
		return [[Guffaw alloc] init];
	case youCanSetTheValue:
		NSLog(@"What? How?");
		return nil;
	case whatTheFrogIsThis:
		NSLog(@"Don't do that");
		return nil;
	default:
		return nil;
	}
}

@end

@implementation Giggle
- (void) laugh
{
	NSLog(@"Tee hee hee!");
}
@end

@implementation Guffaw
- (void) laugh
{
	NSLog(@"BWAAAAH! Haa Haa Haa Haaaaa!!!!");
}
@end

int main() {
	printf("sizeof (char): %lu\n",sizeof(char));
	printf("sizeof ('a'): %lu\n",sizeof('a'));
// Multi-character character constant
//  printf("sizeof ('ab'): %lu\n",sizeof('ab'));

	// Apparently, enums are "int" (not uint or ulong)
	printf("enum kLaughTypeGiggle: %d\n",kLaughTypeGiggle);
	printf("enum kLaughTypeGuffaw: %d\n",kLaughTypeGuffaw);
	printf("enum youCanSetTheValue: %d\n",youCanSetTheValue);
	printf("enum whatTheFrogIsThis: %d\n",whatTheFrogIsThis);

	Laugh * l1 = [[Laugh alloc] initWithLaugh:kLaughTypeGiggle];
	[l1 laugh];

	Laugh * l2 = [[Laugh alloc] initWithLaugh:kLaughTypeGuffaw];
	[l2 laugh];
}

