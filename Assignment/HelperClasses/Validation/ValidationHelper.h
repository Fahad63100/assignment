//
//  ValidationHelper.h
//


#import <sys/socket.h>
#import <netinet/in.h>
#import <SystemConfiguration/SystemConfiguration.h>

@interface ValidationHelper : NSObject
{
    
}

+ (BOOL) isStringEmpty:(NSString *) inputString;

+ (BOOL) isNumeric:(NSString *) inputString;
+ (BOOL) isFloat:(NSString *) inputString;

+ (BOOL) isAlphaNumeric:(NSString *) inputString;
+ (BOOL) isAlphabetOnly:(NSString *) inputString;
+ (BOOL) isAlphabetWithSpaceOnly:(NSString *) inputString;
+ (BOOL) isAlphabetWithDotAndUnderscoreOnly:(NSString *) inputString;
+ (BOOL) isAlphaNumericWithDotAndUnderscoreOnly:(NSString *) inputString;

+ (BOOL) validateEmail:(NSString *) emailString;
+ (BOOL) validateEmail2:(NSString *) emailString;

@end
