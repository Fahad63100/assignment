//
//  MediaMetaData.m
//

#import "MediaMetaData.h"

#import "AppDelegate.h"

#import "AFURLResponseSerialization.h"

#import "WebServiceResponseSerializer.h"
#import "WebServiceResponse.h"

#define kArchiveKey__MediaMetaData @"MediaMetaDataObjKey"

@interface MediaMetaData ()
{
    
}


@end

@implementation MediaMetaData

@synthesize url;
@synthesize format;

@synthesize width;
@synthesize height;



#pragma mark - Singleton Method

+(MediaMetaData *) sharedInstance
{
    static MediaMetaData *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MediaMetaData alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - init Methods

- (id) init
{
    if ( self = [super init] )
    {
        
        
    }
    
    return self;
}


#pragma mark - Methods for NSCoding Protocol
- (id)initWithCoder:(NSCoder *)coder
{
    if ((self = [super init]))
    {
        if ([coder allowsKeyedCoding])
        {
            url             = [coder decodeObjectForKey:@"url"];
            format           = [coder decodeObjectForKey:@"format"];
            width          = [coder decodeObjectForKey:@"width"];
            height       = [coder decodeObjectForKey:@"height"];
            

            
        }
        else
        {
            url             = [coder decodeObject];
            format           = [coder decodeObject];
            width = [coder decodeObject];
            height = [coder decodeObject];
            
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    if ([coder allowsKeyedCoding])
    {
        if(url) [coder encodeObject:url forKey:@"url"];
        if(format) [coder encodeObject:format forKey:@"format"];
        if(width) [coder encodeObject:width forKey:@"width"];
        if(height) [coder encodeObject:height forKey:@"height"];
        
        
    }
    else
    {
        if(url) [coder encodeObject:url];
        if(format) [coder encodeObject:format];
        if(width) [coder encodeObject:width];
        if(height) [coder encodeObject:height];
        
    }
}

#pragma mark - Serialize/De-Serialize Methods

+ (BOOL) archiveObject : (MediaMetaData *) currentObj
{
    // saving NSData of current merchant object
    NSData *currentObjData = [NSKeyedArchiver archivedDataWithRootObject:currentObj];
    [[NSUserDefaults standardUserDefaults] setObject:currentObjData forKey:kArchiveKey__MediaMetaData];
    //////////////////////////////////
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (currentObjData) { return YES; } else { return NO; }
}


+ (MediaMetaData *) unarchiveObject
{
    MediaMetaData *currentObj;
    
    NSData *currentObjData = [[NSUserDefaults standardUserDefaults] objectForKey:kArchiveKey__MediaMetaData];
    if (currentObjData != nil)
    {
        currentObj = [NSKeyedUnarchiver unarchiveObjectWithData:currentObjData];
        
        return currentObj;
    }
    else
    {
        return nil;
    }
}







@end
