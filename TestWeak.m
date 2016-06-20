#import <Foundation/Foundation.h>

int main (int argc, char **argv) {
	id newObject = [NSObject new]; // Really? NEW works?
	__weak id weakReference = newObject;
	NSLog(@"newObject: %@",newObject);
	NSLog(@"weakReference: %@",weakReference);
	newObject = nil;
	NSLog(@"newObject: %@",newObject);
	NSLog(@"weakReference: %@",weakReference);
	assert(weakReference == nil);
}

