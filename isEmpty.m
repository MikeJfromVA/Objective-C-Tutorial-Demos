#import <Foundation/Foundation.h>

BOOL isEmpty (id container) {
	return
	container == nil 
	||
	([container respondsToSelector:@selector(count)] && 
	([container count] == 0))

	;
}

int main() {
	printf("%d\n",isEmpty(nil));
	id thing = [[NSObject alloc] init];
	printf("%d\n",isEmpty(thing));
	NSArray *array = [[NSArray alloc] init];
	printf("%d\n",isEmpty(array));
	array = @[@1, @2, @3];
	printf("%d\n",isEmpty(array));
	NSDictionary *dict = [[NSDictionary alloc] init];
	printf("%d\n",isEmpty(dict));
	dict = @{@"one" : @1, @"two" : @2};
	printf("%d\n",isEmpty(dict));
}
	

