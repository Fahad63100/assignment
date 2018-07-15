//
//  Article.m
//

#import "Article.h"

#import "AppDelegate.h"

#import "AFURLResponseSerialization.h"

#import "WebServiceResponseSerializer.h"
#import "WebServiceResponse.h"

#define kArchiveKey__Article @"ArticleObjKey"

@interface Article ()
{
    
}


@end

@implementation Article

@synthesize articleID;
@synthesize articleAssetID;

@synthesize url;
@synthesize adx_keywords;
@synthesize column;
@synthesize section;
@synthesize byline;

@synthesize type;
@synthesize title;
@synthesize abstract;
@synthesize published_date;

@synthesize source;
@synthesize views;
@synthesize des_facet;
@synthesize org_facet;

@synthesize per_facet;
@synthesize geo_facet;

@synthesize mediaArray;



#pragma mark - Singleton Method

+(Article *) sharedInstance
{
    static Article *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Article alloc] init];
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
            articleID= [coder decodeObjectForKey:@"articleID"];
            articleAssetID= [coder decodeObjectForKey:@"articleAssetID"];
            
            url= [coder decodeObjectForKey:@"url"];
            adx_keywords= [coder decodeObjectForKey:@"adx_keywords"];
            column= [coder decodeObjectForKey:@"column"];
            section= [coder decodeObjectForKey:@"section"];
            byline= [coder decodeObjectForKey:@"byline"];
            
            type= [coder decodeObjectForKey:@"type"];
            title= [coder decodeObjectForKey:@"title"];
            abstract= [coder decodeObjectForKey:@"abstract"];
            published_date= [coder decodeObjectForKey:@"published_date"];
            
            source= [coder decodeObjectForKey:@"source"];
            views= [coder decodeObjectForKey:@"views"];
            des_facet= [coder decodeObjectForKey:@"des_facet"];
            org_facet= [coder decodeObjectForKey:@"org_facet"];
            
            per_facet= [coder decodeObjectForKey:@"per_facet"];
            geo_facet= [coder decodeObjectForKey:@"geo_facet"];
            
            mediaArray= [coder decodeObjectForKey:@"geo_facet"];
        }
        else
        {
            articleID= [coder decodeObject];
            articleAssetID= [coder decodeObject];
            
            url= [coder decodeObject];
            adx_keywords= [coder decodeObject];
            column= [coder decodeObject];
            section= [coder decodeObject];
            byline= [coder decodeObject];
            
            type= [coder decodeObject];
            title= [coder decodeObject];
            abstract= [coder decodeObject];
            published_date= [coder decodeObject];
            
            source= [coder decodeObject];
            views= [coder decodeObject];
            des_facet= [coder decodeObject];
            org_facet= [coder decodeObject];
            
            per_facet= [coder decodeObject];
            geo_facet= [coder decodeObject];
            
            mediaArray= [coder decodeObject];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder
{
    if ([coder allowsKeyedCoding])
    {
        if(articleID) [coder encodeObject:articleID forKey:@"articleID"];
        if(articleAssetID) [coder encodeObject:articleAssetID forKey:@"articleAssetID"];
        if(url) [coder encodeObject:url forKey:@"url"];
        if(adx_keywords) [coder encodeObject:adx_keywords forKey:@"adx_keywords"];
        if(column) [coder encodeObject:column forKey:@"column"];
        if(section) [coder encodeObject:section forKey:@"section"];
        if(byline) [coder encodeObject:byline forKey:@"byline"];
        if(type) [coder encodeObject:type forKey:@"type"];
        if(title) [coder encodeObject:title forKey:@"title"];
        if(abstract) [coder encodeObject:abstract forKey:@"abstract"];
        if(published_date) [coder encodeObject:published_date forKey:@"published_date"];
        if(source) [coder encodeObject:source forKey:@"source"];
        if(views) [coder encodeObject:views forKey:@"views"];
        if(des_facet) [coder encodeObject:des_facet forKey:@"des_facet"];
        if(org_facet) [coder encodeObject:org_facet forKey:@"org_facet"];
        if(per_facet) [coder encodeObject:per_facet forKey:@"per_facet"];
        if(geo_facet) [coder encodeObject:geo_facet forKey:@"geo_facet"];
        if(mediaArray) [coder encodeObject:mediaArray forKey:@"mediaArray"];
        
        
    }
    else
    {
        if(articleID) [coder encodeObject:articleID];
        if(articleAssetID) [coder encodeObject:articleAssetID];
        if(url) [coder encodeObject:url];
        if(adx_keywords) [coder encodeObject:adx_keywords];
        if(column) [coder encodeObject:column];
        if(section) [coder encodeObject:section];
        if(byline) [coder encodeObject:byline];
        if(type) [coder encodeObject:type];
        if(title) [coder encodeObject:title];
        if(abstract) [coder encodeObject:abstract];
        if(published_date) [coder encodeObject:published_date];
        if(source) [coder encodeObject:source];
        if(views) [coder encodeObject:views];
        if(des_facet) [coder encodeObject:des_facet];
        if(org_facet) [coder encodeObject:org_facet];
        if(per_facet) [coder encodeObject:per_facet];
        if(geo_facet) [coder encodeObject:geo_facet];
        if(mediaArray) [coder encodeObject:mediaArray];
        
    }
}

#pragma mark - Serialize/De-Serialize Methods

+ (BOOL) archiveObject : (Article *) currentObj
{
    // saving NSData of current merchant object
    NSData *currentObjData = [NSKeyedArchiver archivedDataWithRootObject:currentObj];
    [[NSUserDefaults standardUserDefaults] setObject:currentObjData forKey:kArchiveKey__Article];
    //////////////////////////////////
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if (currentObjData) { return YES; } else { return NO; }
}


+ (Article *) unarchiveObject
{
    Article *currentObj;
    
    NSData *currentObjData = [[NSUserDefaults standardUserDefaults] objectForKey:kArchiveKey__Article];
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



#pragma mark - Web Services Methods

//section   (all-sections)
//period    (1, 7, 30)

+ (void) getArticlesWithParameter:(nullable id) parameters
                      withSection:(NSString *) sectionValue
                       withPeriod:(NSString *) periodValue
                          success:(nullable void (^)(id _Nullable))success
                          failure:(nullable void (^)(NSError * _Nullable))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    [manager setResponseSerializer:[WebServiceResponseSerializer serializer]];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%@/%@.json?api-key=%@", kWebService__BaseURL, sectionValue, periodValue, kApiKey__NY_Articles];
    
    // all-sections/7.json?api-key=64c4e02027a24926930cc60a1c1503e0
    
    [manager GET:urlStr
      parameters:parameters
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
            
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                
                WebServiceResponse *WebServiceResponseObj = (WebServiceResponse *) responseObject;
                NSString *status = WebServiceResponseObj.status;
                if ([status isEqualToString:kWebService__Status])
                {
                    WebServiceResponse *response = (WebServiceResponse *) responseObject;
                    
                    success(response);
                    
                }
                else
                {
                    WebServiceResponse *response = (WebServiceResponse *) responseObject;
                    
                    success(response);
                }
                
            });
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            dispatch_async(dispatch_get_main_queue(), ^(void) {
                
                failure(error);
                
            });
            
        }];
    
    
    
    
}






@end
