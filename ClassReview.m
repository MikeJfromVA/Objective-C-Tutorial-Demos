#import <Foundation/Foundation.h>

@interface Foo : NSObject {
}
@property(nonatomic) NSInteger freeProperty;
@end

@implementation Foo
@end

@implementation Foo(Category)
@end

int main() {
	Foo *foo = [[Foo alloc] init];
	foo.freeProperty = 10;
	NSLog(@"\n%ld\n",(long)foo.freeProperty);
	SEL selector = @selector(setFreeProperty:);
	IMP imp = [foo methodForSelector:selector];
	void (*func)(id, SEL) = (void *) imp;
	func(foo, selector);
	NSLog(@"\n%ld\n",(long)foo.freeProperty);

	NSLog(@"\nArray element should be 7: %@\n",@[@3,@7,@5][1]);

}

