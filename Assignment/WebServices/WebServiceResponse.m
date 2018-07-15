//
//  WebServiceResponse.m
//

#import "WebServiceResponse.h"

@implementation WebServiceResponse


- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self)
    {
        [self setValuesForKeysWithDictionary:dictionary];
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"status"])
    {
        if ([value isKindOfClass:[NSNumber class]])
        {
            [self setStatus:[value stringValue]];
        }
        else
        {
            [self setStatus:value];
        }
    }
    else
    {
        if (key != nil)
        {
            [super setValue:value forKey:key];
        }
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
