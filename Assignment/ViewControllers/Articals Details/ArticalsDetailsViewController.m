//
//  ArticalsDetailsViewController.m
//

#import "ArticalsDetailsViewController.h"

#import "ArticleDetailsCell1.h"
#import "ArticleDetailsCell2.h"
#import "ArticleDetailsCell3.h"

@interface ArticalsDetailsViewController ()
{
    
}

@property (weak, nonatomic) IBOutlet UITableView *articleDetailsTableView;




@end

@implementation ArticalsDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.title = self.selectedArticleObj.title;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableView Datasource

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section
{
    return 6;
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    if(indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            ArticleDetailsCell3 *cell = (ArticleDetailsCell3 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell3];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            

            
            NSString *mediaImageURL = @"";
            if(self.selectedArticleObj.mediaArray != nil && self.selectedArticleObj.mediaArray.count > 0)
            {
                Media *mediaObj = [self.selectedArticleObj.mediaArray objectAtIndex:0];
                if(mediaObj.mediaMetadataArray != nil && mediaObj.mediaMetadataArray.count > 0)
                {
                    MediaMetaData *mediaMetaDataObj = [mediaObj.mediaMetadataArray objectAtIndex:0];
                    mediaImageURL = mediaMetaDataObj.url;
                }
                
                if(![ValidationHelper isStringEmpty:mediaImageURL])
                {
                    UIImage *placeHolderImg = [UIImage imageNamed:@""];
                    
                    NSURL *imgURL = [NSURL URLWithString:mediaImageURL];
                    [cell.imgArticle setImageWithURL:imgURL placeholderImage:placeHolderImg];
                }
            }
            
            return cell;
        }
        else if (indexPath.row == 1)
        {
            ArticleDetailsCell1 *cell = (ArticleDetailsCell1 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell1];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblTitle.text = @"Title:";
            cell.lblDetails.text = self.selectedArticleObj.title;
            
            return cell;
        }
        else if (indexPath.row == 1)
        {
            ArticleDetailsCell1 *cell = (ArticleDetailsCell1 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell1];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblTitle.text = @"Published Date:";
            cell.lblDetails.text = self.selectedArticleObj.published_date;
            
            return cell;
        }
        else if (indexPath.row == 2)
        {
            ArticleDetailsCell1 *cell = (ArticleDetailsCell1 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell1];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblTitle.text = @"By:";
            cell.lblDetails.text = self.selectedArticleObj.byline;
            
            return cell;
        }
        else if (indexPath.row == 3)
        {
            ArticleDetailsCell1 *cell = (ArticleDetailsCell1 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell1];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblTitle.text = @"Type:";
            cell.lblDetails.text = self.selectedArticleObj.type;
            
            return cell;
        }
        else if (indexPath.row == 4)
        {
            ArticleDetailsCell1 *cell = (ArticleDetailsCell1 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell1];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblTitle.text = @"Section:";
            cell.lblDetails.text = self.selectedArticleObj.section;
            
            return cell;
        }
        else if (indexPath.row == 5)
        {
            ArticleDetailsCell2 *cell = (ArticleDetailsCell2 *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleDetailsCell2];
            
            cell.backgroundColor = [UIColor clearColor];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType  = UITableViewCellAccessoryNone;
            
            cell.lblDetails.text = self.selectedArticleObj.abstract;
            
            return cell;
        }
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat heightForRowAtIndexPath = 0.0;
    
    if(indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            heightForRowAtIndexPath = 221.0;
        }
        else if (indexPath.row == 1)
        {
            heightForRowAtIndexPath = 78.0;
        }
        else if (indexPath.row == 2)
        {
            heightForRowAtIndexPath = 78.0;
        }
        else if (indexPath.row == 3)
        {
            heightForRowAtIndexPath = 78.0;
        }
        else if (indexPath.row == 4)
        {
            heightForRowAtIndexPath = 78.0;
        }
        else if (indexPath.row == 5)
        {
            heightForRowAtIndexPath = 284.0;
        }
    }
    
    return heightForRowAtIndexPath;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *viewForHeaderInSection = [[UIImageView alloc] init];
    
    return viewForHeaderInSection;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *viewForFooterInSection = [UIView new];
    [viewForFooterInSection setBackgroundColor:[UIColor clearColor]];
    
    return viewForFooterInSection;
}



@end
