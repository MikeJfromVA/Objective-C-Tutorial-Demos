#import <Foundation/Foundation.h>

int main (int argc, char **argv) {
	id newObject = [NSObject new]; // Really? NEW works?
	__weak id weakReference = newObject;
	newObject = nil;
	NSLog(@"newObject: %@",newObject);
	NSLog(@"weakReference: %@",weakReference);
	assert(weakReference == nil);
}

