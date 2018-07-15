//
//  CommonHelper.h
//

typedef void (^alertViewCompletionBlock)(BOOL status, NSError *error);

typedef void (^permissionViewControllerNeedToShowBlock)(BOOL status);

@interface CommonHelper : NSObject

+ (CommonHelper *) sharedInstance;


#pragma mark - Progress View
- (void) showProgressViewWithTitle:(NSString *) title;
- (void) updateProgressViewWithTitle:(NSString *) title;
- (void) showSuccessMessageViewWithTitle:(NSString *) title;
- (void) showErrorMessageViewWithTitle:(NSString *) title;
- (void) hideProgressView;


- (void)displayAlertWithTitle:(NSString *)aTitle Message:(NSString *)aMessage;

@end
