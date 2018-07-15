//
//  MediaMetaData.h
//

@interface MediaMetaData : NSObject <NSCoding>

@property (nonatomic,retain) NSString * _Nullable url;
@property (nonatomic,retain) NSString * _Nullable format;

@property (nonatomic,retain) NSNumber * _Nullable width;
@property (nonatomic,retain) NSNumber * _Nullable height;



#pragma mark - Singleton Shared Object
+ (MediaMetaData * _Nullable) sharedInstance;


#pragma mark - Serialize/De-Serialize Methods
+ (BOOL) archiveObject : (MediaMetaData * _Nullable) currentObj;
+ (MediaMetaData * _Nullable) unarchiveObject;












@end
