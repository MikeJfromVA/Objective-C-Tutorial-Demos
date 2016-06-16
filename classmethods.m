#import <Foundation/foundation.h>

@interface Ship : NSObject {
	@private
// don't use these @private @public
	@public
// don't use these @private @public
	int integer;
}

- (void) instanceMethod;

+ (void) classMethod;

@end

@implementation Ship

+ (void) classMethod {
	printf("classMethod\n");
}

- (void) instanceMethod {
	printf("instanceMethod\n");
}

@end

int main() {
	Ship *s = [[Ship alloc] init];
	[s instanceMethod];
//	[s classMethod]; // compiler warning and runtime error
	[Ship classMethod];
}



