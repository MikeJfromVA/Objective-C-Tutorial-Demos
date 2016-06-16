// YourViewController.h:
#import <Foundation/Foundation.h>

@protocol YourProtocolName;

// Would really inherit from UIViewController
@interface YourViewController: NSObject

@property (nonatomic, weak) id<YourProtocolName> delegate;

@end

@protocol YourProtocolName <NSObject>
@required
-(void)requiredDelegateMethod;

@optional
-(void)optionalDelegateMethodOne;
-(void)optionalDelegateMethodTwo:(NSString *)withArgument;

@end // end of delegate protocol
