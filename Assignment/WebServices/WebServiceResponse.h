//
//  WebServiceResponse.h
//

#import <Foundation/Foundation.h>

@interface WebServiceResponse : NSObject

@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) id data;

@property (nonatomic, strong) id errors;


@property (nonatomic, strong) NSDictionary *jsonDict;
@property (nonatomic, strong) NSArray *jsonArray;


-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
