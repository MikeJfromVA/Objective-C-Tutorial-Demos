#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Foo:NSObject

// AHA! Not allowed! 
/*
 * You see, Java allows any number of method overloads, even when the types
 * overlap:
 * foo(Object o)
 * foo(Person p)
 * On resolution, the most specific applicable method is called. 
 * Resolution uses Late Binding, so if x in foo(x) is really a Person, it
 * will call foo(Person p).
 *
 * Objective-C: Method overloading in OBJ-C is NOT ALLOWED!
 * Instead, one uses named parameters and method name mutations:
 * fooWithPerson: (Person *) p;
 * fooWithArray: (NSArray *) a;
 *
 */

- (void) fooBar: (id) object;

/*
- (void) fooBar: (NSArray *) array;
*/

@end

@implementation Foo

- (void) fooBar: (id) object {

}

/*
- (void) fooBar: (NSArray *) array {

}
*/

@end

int main (int argc, char**argv) {
}

