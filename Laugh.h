#import <Foundation/Foundation.h>
#import <objc/runtime.h>

enum {
 kLaughTypeGiggle,
 kLaughTypeGuffaw,
 youCanSetTheValue = 11,
 whatTheFrogIsThis = 'uhok'
// This does not work:
// , thisDoesNotWork = "Hello, World!"
};
/*
 * Firstly, how can an enum be set to a string? Second, why is that string
 * single-quoted?
 * Answer: It is called a multi-character character constant. It simply maps
 * characters into an integer. It is implementation-dependent. One could
 * implement it by coping characters byte-by-byte and casting...
 *
 */

@interface Laugh:NSObject {
}

-(Laugh *) initWithLaugh:(int) type;
-(void) laugh;

@end
