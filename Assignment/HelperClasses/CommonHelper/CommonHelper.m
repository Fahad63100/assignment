//
//  CommonHelper.m
//

#import "CommonHelper.h"

@interface CommonHelper ()
{
    
}

@property (nonatomic, strong) UIAlertController *alertControllerObj;
@property (nonatomic, strong) UIAlertView *UIAlertViewObj;

@end

@implementation CommonHelper

#pragma mark - Init Methods

- (id)init
{
    self = [super init];
    if (self)
    {
        [self initializeObj];
    }
    
    return self;
}

- (void) initializeObj
{
    
    DLog(@"CommonHelper initializeObj");
}

#pragma mark - Singleton Method

+(CommonHelper *) sharedInstance
{
    static CommonHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CommonHelper alloc] init];
    });
    
    return sharedInstance;
}


#pragma mark - Progress View
- (void) showProgressViewWithTitle:(NSString *) title
{
    if ([NSThread isMainThread])
    {
        [KVNProgress showWithStatus:title];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [KVNProgress showWithStatus:title];
            
        });
    }
}

- (void) updateProgressViewWithTitle:(NSString *) title
{
    if ([NSThread isMainThread])
    {
        [KVNProgress updateStatus:title];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [KVNProgress updateStatus:title];
            
        });
    }
}

- (void) showSuccessMessageViewWithTitle:(NSString *) title
{
    if ([NSThread isMainThread])
    {
        [KVNProgress showSuccessWithStatus:title];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [KVNProgress showSuccessWithStatus:title];
            
        });
    }
}

- (void) showErrorMessageViewWithTitle:(NSString *) title
{
    if ([NSThread isMainThread])
    {
        [KVNProgress showErrorWithStatus:title];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [KVNProgress showErrorWithStatus:title];
            
        });
    }
}

- (void) hideProgressView
{
    if ([NSThread isMainThread])
    {
        [KVNProgress dismiss];
    }
    else
    {
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            
            [KVNProgress dismiss];
            
        });
    }
}



#pragma mark - Alert Message

- (void)displayAlertWithTitle:(NSString *)aTitle Message:(NSString *)aMessage
{
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:aTitle
                                                                       message:aMessage
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"close", nil)
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
                                                                  
                                                                  
                                                                  [[CommonHelper getTopMostViewController] dismissViewControllerAnimated:NO completion:nil];
                                                                  
                                                              }];
        [alert addAction:defaultAction];
        
        [[CommonHelper getTopMostViewController] presentViewController:alert animated:NO completion:nil];
    });
}

#pragma mark - View Controllers
+ (UIViewController *) getTopMostViewController
{
    @try
    {
        UIViewController *topViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
        if ([topViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *navVC = (UINavigationController *) topViewController;
            topViewController = [navVC.viewControllers lastObject];
        }
        
        return topViewController;
    }
    @catch (NSException *exception)
    {
        DLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
    
    
}

@end
