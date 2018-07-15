//
//  ArticalsDetailsViewController.h
//

#import <UIKit/UIKit.h>

#import "Article.h"
#import "Media.h"
#import "MediaMetaData.h"

@interface ArticalsDetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong) Article *selectedArticleObj;

@end

