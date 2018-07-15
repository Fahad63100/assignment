//
//  ValidationHelper.m
//

#import "ValidationHelper.h"

@implementation ValidationHelper

+ (BOOL) isStringEmpty:(NSString *) inputString
{
    @try
    {
        if (inputString == nil ||
            [inputString isKindOfClass:[NSNull class]] ||
            inputString.length == 0 ||
            [inputString isEqualToString:@""] ||
            [inputString isEqualToString:@"(null)"])
        {
            return YES;
        }
        
        //string is all whitespace
        if(![[inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length])
        {
            return YES;
        }
        
        return NO;
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isNumeric:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isFloat:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@".0123456789"] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}



+ (BOOL) isAlphaNumeric:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *blockedCharacters = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
        
        return ([inputString rangeOfCharacterFromSet:blockedCharacters].location == NSNotFound);
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isAlphabetOnly:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isAlphabetWithSpaceOnly:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isAlphabetWithDotAndUnderscoreOnly:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._"] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}

+ (BOOL) isAlphaNumericWithDotAndUnderscoreOnly:(NSString *) inputString
{
    @try
    {
        NSCharacterSet *cs=[[NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._0123456789"] invertedSet];
        NSString *filtered;
        filtered = [[inputString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [inputString isEqualToString:filtered];
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}


+ (BOOL) validateEmail:(NSString *) emailString
{
    @try
    {
        // __TEST__
        //    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        //    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        //
        //    BOOL isValidated = [emailTest evaluateWithObject:emailString];
        //
        //    return isValidated;
        
        NSString *emailRegex = @"[A-Z0-9a-z][A-Z0-9a-z._%+-]*@[A-Za-z0-9][A-Za-z0-9.-]*\\.[A-Za-z]{2,6}";
        NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
        NSRange aRange;
        
        if([emailTest evaluateWithObject:emailString])
        {
            aRange = [emailString rangeOfString:@"." options:NSBackwardsSearch range:NSMakeRange(0, [emailString length])];
            NSUInteger indexOfDot = aRange.location;
            
            if(aRange.location != NSNotFound)
            {
                NSString *topLevelDomain = [emailString substringFromIndex:indexOfDot];
                topLevelDomain = [topLevelDomain lowercaseString];
                
                NSSet *TLD;
                TLD = [NSSet setWithObjects:@".aero", @".asia", @".biz", @".cat", @".com", @".coop", @".edu", @".gov", @".info", @".int", @".jobs", @".mil", @".mobi", @".museum", @".name", @".net", @".org", @".pro", @".tel", @".travel", @".ac", @".ad", @".ae", @".af", @".ag", @".ai", @".al", @".am", @".an", @".ao", @".aq", @".ar", @".as", @".at", @".au", @".aw", @".ax", @".az", @".ba", @".bb", @".bd", @".be", @".bf", @".bg", @".bh", @".bi", @".bj", @".bm", @".bn", @".bo", @".br", @".bs", @".bt", @".bv", @".bw", @".by", @".bz", @".ca", @".cc", @".cd", @".cf", @".cg", @".ch", @".ci", @".ck", @".cl", @".cm", @".cn", @".co", @".cr", @".cu", @".cv", @".cx", @".cy", @".cz", @".de", @".dj", @".dk", @".dm", @".do", @".dz", @".ec", @".ee", @".eg", @".er", @".es", @".et", @".eu", @".fi", @".fj", @".fk", @".fm", @".fo", @".fr", @".ga", @".gb", @".gd", @".ge", @".gf", @".gg", @".gh", @".gi", @".gl", @".gm", @".gn", @".gp", @".gq", @".gr", @".gs", @".gt", @".gu", @".gw", @".gy", @".hk", @".hm", @".hn", @".hr", @".ht", @".hu", @".id", @".ie", @" No", @".il", @".im", @".in", @".io", @".iq", @".ir", @".is", @".it", @".je", @".jm", @".jo", @".jp", @".ke", @".kg", @".kh", @".ki", @".km", @".kn", @".kp", @".kr", @".kw", @".ky", @".kz", @".la", @".lb", @".lc", @".li", @".lk", @".lr", @".ls", @".lt", @".lu", @".lv", @".ly", @".ma", @".mc", @".md", @".me", @".mg", @".mh", @".mk", @".ml", @".mm", @".mn", @".mo", @".mp", @".mq", @".mr", @".ms", @".mt", @".mu", @".mv", @".mw", @".mx", @".my", @".mz", @".na", @".nc", @".ne", @".nf", @".ng", @".ni", @".nl", @".no", @".np", @".nr", @".nu", @".nz", @".om", @".pa", @".pe", @".pf", @".pg", @".ph", @".pk", @".pl", @".pm", @".pn", @".pr", @".ps", @".pt", @".pw", @".py", @".qa", @".re", @".ro", @".rs", @".ru", @".rw", @".sa", @".sb", @".sc", @".sd", @".se", @".sg", @".sh", @".si", @".sj", @".sk", @".sl", @".sm", @".sn", @".so", @".sr", @".st", @".su", @".sv", @".sy", @".sz", @".tc", @".td", @".tf", @".tg", @".th", @".tj", @".tk", @".tl", @".tm", @".tn", @".to", @".tp", @".tr", @".tt", @".tv", @".tw", @".tz", @".ua", @".ug", @".uk", @".us", @".uy", @".uz", @".va", @".vc", @".ve", @".vg", @".vi", @".vn", @".vu", @".wf", @".ws", @".ye", @".yt", @".za", @".zm", @".zw", nil];
                
                if(![self isStringEmpty:topLevelDomain])
                {
                    return YES;
                }
                
                if(topLevelDomain != nil && ([TLD containsObject:topLevelDomain]))
                {
                    return YES;
                }
            }
        }
        
        return NO;
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}


+ (BOOL) validateEmail2:(NSString *) emailString
{
    @try
    {
        // lowercase the email for proper validation
        emailString = [emailString lowercaseString];
        
        // regex for email validation
        NSString *emailRegEx =
        @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
        @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
        @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
        @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
        @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
        @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
        @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
        
        NSPredicate *regExPredicate =
        [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
        BOOL myStringMatchesRegEx = [regExPredicate evaluateWithObject:emailString];
        
        return myStringMatchesRegEx;
    }
    @catch (NSException *exception)
    {
        NSLog(@"[EXCEPTION] %@", [exception description]);
        
        ///////////////////////////////////////////////////////////
    }
    @finally
    {
        
    }
}


@end
