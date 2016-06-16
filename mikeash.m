// gcc -o kvoexplorer -framework Foundation kvoexplorer.m

#import <Foundation/Foundation.h>
#import <objc/runtime.h>


@interface TestClass : NSObject
{
    int x;
    int y;
    int z;
}
@property int x;
@property int y;
@property int z;
@end
@implementation TestClass
@synthesize x, y, z;
@end

static NSArray *ClassMethodNames(Class c)
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int methodCount = 0;
    Method *methodList = class_copyMethodList(c, &methodCount);
    unsigned int i;
    for(i = 0; i < methodCount; i++)
        [array addObject: NSStringFromSelector(method_getName(methodList[i]))];
    free(methodList);
    
    return array;
}

static void PrintDescription(NSString *name, id obj)
{
    NSString *str = [NSString stringWithFormat:
        @"%@: %@\n\tNSObject class %s\n\tlibobjc class %s\n\timplements methods <%@>",
        name,
        obj,
        class_getName([obj class]),
//        class_getName(obj->isa),
//        [ClassMethodNames(obj->isa) componentsJoinedByString:@", "]];
        class_getName(object_getClass(obj)),
        [ClassMethodNames(object_getClass(obj)) componentsJoinedByString:@", "]];
    printf("%s\n", [str UTF8String]);
}

int main(int argc, char **argv)
{
    [NSAutoreleasePool new];
    
    TestClass *x = [[TestClass alloc] init];
    TestClass *y = [[TestClass alloc] init];
    TestClass *xy = [[TestClass alloc] init];
    TestClass *control = [[TestClass alloc] init];
    
    [x addObserver:x forKeyPath:@"x" options:0 context:NULL];
    [xy addObserver:xy forKeyPath:@"x" options:0 context:NULL];
    [y addObserver:y forKeyPath:@"y" options:0 context:NULL];
    [xy addObserver:xy forKeyPath:@"y" options:0 context:NULL];
    
    PrintDescription(@"control", control);
    PrintDescription(@"x", x);
    PrintDescription(@"y", y);
    PrintDescription(@"xy", xy);
    
    printf("Using NSObject methods, normal setX: is %p, overridden setX: is %p\n",
          [control methodForSelector:@selector(setX:)],
          [x methodForSelector:@selector(setX:)]);
    printf("Using libobjc functions, normal setX: is %p, overridden setX: is %p\n",
          method_getImplementation(class_getInstanceMethod(object_getClass(control),
                                   @selector(setX:))),
          method_getImplementation(class_getInstanceMethod(object_getClass(x),
                                   @selector(setX:))));
    
    return 0;
}

