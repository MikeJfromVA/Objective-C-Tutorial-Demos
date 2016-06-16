#import <Foundation/Foundation.h>

// using NS_ENUM and NS_OPTIONS macros
typedef NS_ENUM(NSInteger, MyEnum) {
	Aye,
	Bee,
	Cee=7,
	Dee
};

typedef NS_OPTIONS(NSInteger, MyMask) {
	NO_OPTIONS = 0,
	DO_THIS  = 1 << 0,
	DO_THAT  = 1 << 1,
	DO_OTHER = 1 << 2
};

/* 
 * Weaker methods: (not typed)
 * enum {};
 * typedef enum{} name;
 */


// CONSTANTS
// Less effective
#define LiteralReplacement = @"MM/DD/YYYY"
// Better: (One memory segment containing constant)
NSString const * const DateFormat = @"MM/DD/YYYY";

// Forward declaration
@class Foo;
// File scope global storage
static Foo * myfoo;

@interface Foo : NSObject {
	// protected
	int i;
	@public
	double d;
	@private
	char c;
	@protected
	BOOL b;
}

// public object method
- (void) publicDisplayOfInt : (int) x withDouble : (double) y;
// public class method
+ (void) publicDisplay;
 
@end 

@implementation Foo

- (void) publicDisplayOfInt : (int) x withDouble : (double) y {
	NSLog(@"\npublic object method\n");
}

+ (void) publicDisplay {
	NSLog(@"\npublic class method\n");
}

- (void) privateMethod {
}

@end

@protocol Eater
- (void) nomNomNom;
@end

@interface Mikey : NSObject<Eater> {
}
@end

@implementation Mikey
- (void) nomNomNom {
}
@end

int main() {
	// Assigning to the static (was declared using forward declaration)
	myfoo = [[Foo alloc] init];
	[myfoo publicDisplayOfInt:99 withDouble:1.2];
	[Foo publicDisplay];
	printf("Hello, World!\n");
	MyEnum foo = Dee;
	// MyEnum gets treated as a type. Have to cast to avoid warning
	NSLog(@"\nThis is enum MyEnum value Dee: %d\n",(int)foo);
	NSLog(@"\nThis is a date format: %@\n",DateFormat);
}

