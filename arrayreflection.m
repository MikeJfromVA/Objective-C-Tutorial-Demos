#import <Foundation/foundation.h>

@protocol MyProtocol
@end

@interface MyObject1 : NSObject <MyProtocol>
@end
@implementation MyObject1
@end

@interface MyObject2 : NSObject
@end
@implementation MyObject2
@end

@interface MyObject3 : MyObject2
@end
@implementation MyObject3
@end

// Can I use Object definitions without implementation?
// Answer: Fails to compile once I instantiate object

int main() {
	MyObject1 *o1 = [[MyObject1 alloc] init];
	MyObject2 *o2 = [[MyObject2 alloc] init];
	MyObject3 *o3 = [[MyObject3 alloc] init];

//	[MyProtocol class];
//	MyProtocol is not a class!

	if ([o3 isKindOfClass:[MyObject2 class]]) {
		printf("YES: if ([o3 isKindOfClass:[MyObject2 class]]) {\n");
	} else {
		printf("NO: if ([o3 isKindOfClass:[MyObject2 class]]) {\n");
	}
	if ([o3 isMemberOfClass:[MyObject2 class]]) {
		printf("YES: if ([o3 isMemberOfClass:[MyObject2 class]]) {\n");
	} else {
		printf("NO: if ([o3 isMemberOfClass:[MyObject2 class]]) {\n");
	}
	if ([o3 respondsToSelector:@selector(yoNoSoyMarinera:SoyCapitan:)]) {
		printf("YES: if ([o3 respondsToSelector:@selector(yoNoSoyMarinera:SoyCapitan:)]) {\n");
	} else {
		printf("NO: if ([o3 respondsToSelector:@selector(yoNoSoyMarinera:SoyCapitan:)]) {\n");
	}

	// finally, arrays
	if ([[[NSMutableArray alloc] init] isKindOfClass: [NSArray class]]) {
		printf ("NSMutableArray is subclass of NSArray\n");
	}
	if ([NSMutableArray isKindOfClass: [NSArray class]]) {
		printf ("It works with class methods too!\n");
		// It does NOT WORK with class method isKindOfClass!!!
	}
}


