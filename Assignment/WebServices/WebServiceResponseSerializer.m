//
//  WebServiceResponseSerializer.m
//

#import "WebServiceResponseSerializer.h"
#import "WebServiceResponse.h"

@implementation WebServiceResponseSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing  _Nullable *)error
{
    id responseObject =[super responseObjectForResponse:response data:data error:error];
    WebServiceResponse *respObj = [[WebServiceResponse alloc] initWithDictionary:responseObject];
    
    
    ///////////////////////////////////////////////////////////////
    NSString *json_str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"[WEB_SERVICE] JSON_STR = %@", json_str);
    
    NSDictionary *jsonDict = nil;
    NSArray *jsonArray = nil;
    
    id responseDict = nil;
    if (![ValidationHelper isStringEmpty:json_str])
    {
        NSError *jsonError;
        NSData *objectData = [json_str dataUsingEncoding:NSUTF8StringEncoding];
        responseDict = [NSJSONSerialization JSONObjectWithData:objectData
                                                       options:NSJSONReadingMutableContainers
                                                         error:&jsonError];
    }
    
    if (responseDict != nil)
    {
        if ([responseDict isKindOfClass:[NSDictionary class]])
        {
            jsonDict = (NSDictionary *) responseDict;
        }
        else if ([responseDict isKindOfClass:[NSArray class]])
        {
            jsonArray = (NSArray *) responseDict;
        }
    }
    
    respObj.jsonDict = jsonDict;
    respObj.jsonArray = jsonArray;
    ///////////////////////////////////////////////////////////////
    
    
    return respObj;
}

@end
