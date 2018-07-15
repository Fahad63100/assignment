//
//  ArticleCell.h
//



#import <UIKit/UIKit.h>

@interface ArticleCell : UITableViewCell

@property (nonatomic, strong) IBOutlet VerticallyAlignedLabel *lblArticleTitle;
@property (nonatomic, strong) IBOutlet VerticallyAlignedLabel *lblArticleByLine;
@property (nonatomic, strong) IBOutlet VerticallyAlignedLabel *lblArticleSection;
@property (nonatomic, strong) IBOutlet VerticallyAlignedLabel *lblArticlePublishedDate;

@property (weak, nonatomic) IBOutlet UIImageView *imgArticleMediaPhoto;
@property (weak, nonatomic) IBOutlet UIImageView *imgArticleDate;


@end
