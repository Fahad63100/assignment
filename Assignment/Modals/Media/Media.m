//
//  Media.m
//

#import "Media.h"

#import "AppDelegate.h"

#import "AFURLResponseSerialization.h"

#import "WebServiceResponseSerializer.h"
#import "WebServiceResponse.h"

#define kArchiveKey__Media @"MediaObjKey"

@interface Media ()
{
    
}


@end

@implementation Media

@synthesize type;
@synthesize subtype;

@synthesize caption;
@synthesize copyright;

@synthesize approved_for_syndication;

@synthesize mediaMetadataArray;


#pragma mark - Singleton Method

+(Media *) sharedInstance
{
    static Media *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Media alloc] init];
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
            type             = [coder decodeObjectForKey:@"type"];
            subtype           = [coder decodeObjectForKey:@"subtype"];
            caption          = [coder decodeObjectForKey:@"caption"];
            copyright       = [coder decodeObjectForKey:@"copyright"];
            approved_for_syndication       = [coder decodeObjectForKey:@"approved_for_syndication"];
            mediaMetadataArray       = [coder decodeObjectForKey:@"mediaMetadataArray"];
            
        }
        else
        {
            type             = [coder decodeObject];
            subtype           = [coder decodeObject];
            caption = [coder decodeObject];
            copyright = [coder decodeObject];
            approved_for_syndication = [coder decodeObject];
            mediaMetadataArray = [coder decodeObject];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    if ([coder allowsKeyedCoding])
    {
        if(type) [coder encodeObject:type forKey:@"type"];
        if(subtype) [coder encodeObject:subtype forKey:@"subtype"];
        if(caption) [coder encodeObject:caption forKey:@"caption"];
        if(copyright) [coder encodeObject:copyright forKey:@"copyright"];
        if(approved_for_syndication) [coder encodeObject:approved_for_syndication forKey:@"approved_for_syndication"];
        if(mediaMetadataArray) [coder encodeObject:mediaMetadataArray forKey:@"mediaMetadataArray"];
    }
    else
    {
        if(type) [coder encodeObject:type];
        if(subtype) [coder encodeObject:subtype];
        if(caption) [coder encodeObject:caption];
        if(copyright) [coder encodeObject:copyright];
        if(approved_for_syndication) [coder encodeObject:approved_for_syndication];
        if(mediaMetadataArray) [coder encodeObject:mediaMetadataArray];
    }
}

#pragma mark - Serialize/De-Serialize Methods

+ (BOOL) archiveObject : (Media *) currentObj
{
    // saving NSData of current merchant object
    NSData *currentObjData = [NSKeyedArchiver archivedDataWithRootObject:currentObj];
    [[NSUserDefaults standardUserDefaults] setObject:currentObjData forKey:kArchiveKey__Media];
    //////////////////////////////////
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (currentObjData) { return YES; } else { return NO; }
}


+ (Media *) unarchiveObject
{
    Media *currentObj;
    
    NSData *currentObjData = [[NSUserDefaults standardUserDefaults] objectForKey:kArchiveKey__Media];
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
