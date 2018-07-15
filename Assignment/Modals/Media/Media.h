//
//  Media.h
//

@interface Media : NSObject <NSCoding>

@property (nonatomic,retain) NSString * _Nullable type;
@property (nonatomic,retain) NSString * _Nullable subtype;

@property (nonatomic,retain) NSString * _Nullable caption;
@property (nonatomic,retain) NSString * _Nullable copyright;

@property (nonatomic,retain) NSNumber * _Nullable approved_for_syndication;

@property (nonatomic,retain) NSArray * _Nullable mediaMetadataArray;

#pragma mark - Singleton Shared Object
+ (Media * _Nullable) sharedInstance;


#pragma mark - Serialize/De-Serialize Methods
+ (BOOL) archiveObject : (Media * _Nullable) currentObj;
+ (Media * _Nullable) unarchiveObject;












@end
