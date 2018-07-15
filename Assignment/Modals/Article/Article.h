//
//  Article.h
//

@interface Article : NSObject <NSCoding>

@property (nonatomic,retain) NSNumber * _Nullable articleID;
@property (nonatomic,retain) NSNumber * _Nullable articleAssetID;

@property (nonatomic,retain) NSString * _Nullable url;
@property (nonatomic,retain) NSString * _Nullable adx_keywords;
@property (nonatomic,retain) NSString * _Nullable column;
@property (nonatomic,retain) NSString * _Nullable section;
@property (nonatomic,retain) NSString * _Nullable byline;

@property (nonatomic,retain) NSString * _Nullable type;
@property (nonatomic,retain) NSString * _Nullable title;
@property (nonatomic,retain) NSString * _Nullable abstract;
@property (nonatomic,retain) NSString * _Nullable published_date;

@property (nonatomic,retain) NSString * _Nullable source;
@property (nonatomic,retain) NSString * _Nullable views;
@property (nonatomic,retain) NSArray * _Nullable des_facet;
@property (nonatomic,retain) NSArray * _Nullable org_facet;

@property (nonatomic,retain) NSString * _Nullable per_facet;
@property (nonatomic,retain) NSArray * _Nullable geo_facet;

@property (nonatomic,retain) NSArray * _Nullable mediaArray;


#pragma mark - Singleton Shared Object
+ (Article * _Nullable) sharedInstance;


#pragma mark - Serialize/De-Serialize Methods
+ (BOOL) archiveObject : (Article * _Nullable) currentObj;
+ (Article * _Nullable) unarchiveObject;


#pragma mark - Web Services
+ (void) getArticlesWithParameter:(nullable id) parameters
                      withSection:(NSString *) sectionValue
                       withPeriod:(NSString *) periodValue
                          success:(nullable void (^)(id _Nullable))success
                          failure:(nullable void (^)(NSError * _Nullable))failure;







@end
