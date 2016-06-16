#import <Foundation/foundation.h>

@protocol Protocols <NSObject>
- (void) thisIsRequired;
@optional
- (void) thisIsOptional;
@required
- (void) thisIsAlsoRequired;
@end
