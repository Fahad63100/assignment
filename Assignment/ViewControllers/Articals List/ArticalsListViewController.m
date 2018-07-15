//
//  ArticalsListViewController.m
//

#import "ArticalsListViewController.h"

#import "ArticleCell.h"

#import "Article.h"
#import "Media.h"
#import "MediaMetaData.h"

#import "ArticalsDetailsViewController.h"

@interface ArticalsListViewController () <UITableViewDataSource, UITableViewDelegate>
{
    
}

@property (nonatomic, strong) NSMutableArray *articleArrays;

@property (weak, nonatomic) IBOutlet UITableView *articlesTableView;

@property (weak, nonatomic) IBOutlet UILabel *lblError;



@end

@implementation ArticalsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"NY Times Most Popular";
    
    [self->_lblError setHidden:YES];
    
    
    [self callWebServiceForFetchAllArticles];
    
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *) tableView numberOfRowsInSection:(NSInteger) section
{
    return [_articleArrays count];
}

- (UITableViewCell *) tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *) indexPath
{
    ArticleCell *cell = (ArticleCell *)[tableView dequeueReusableCellWithIdentifier:kTableViewCellID_ArticleCell];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator;
    
    
    
    Article *articleObj = [_articleArrays objectAtIndex:indexPath.row];
    
    cell.lblArticleTitle.text = articleObj.title;
    cell.lblArticleByLine.text = articleObj.byline;
    cell.lblArticleSection.text = articleObj.section;
    cell.lblArticlePublishedDate.text = articleObj.published_date;
    
    
    
    /////////////////////////////////////////////////////////////////////
    cell.imgArticleMediaPhoto.layer.borderColor = [UIColor clearColor].CGColor;
    cell.imgArticleMediaPhoto.layer.borderWidth = 1.0;
    cell.imgArticleMediaPhoto.layer.cornerRadius = cell.imgArticleMediaPhoto.frame.size.width / 2.0;
    cell.imgArticleMediaPhoto.clipsToBounds = YES;
    cell.imgArticleMediaPhoto.layer.masksToBounds = YES;
    cell.imgArticleMediaPhoto.alpha = 1.0;
    cell.imgArticleMediaPhoto.backgroundColor = [UIColor clearColor];
    /////////////////////////////////////////////////////////////////////
    
    [cell.imgArticleMediaPhoto setNeedsUpdateConstraints];
    [cell.imgArticleMediaPhoto updateConstraintsIfNeeded];
    [cell.imgArticleMediaPhoto layoutIfNeeded];
    [cell.imgArticleMediaPhoto setNeedsLayout];
    
    NSString *mediaImageURL = @"";
    if(articleObj.mediaArray != nil && articleObj.mediaArray.count > 0)
    {
        Media *mediaObj = [articleObj.mediaArray objectAtIndex:0];
        if(mediaObj.mediaMetadataArray != nil && mediaObj.mediaMetadataArray.count > 0)
        {
            MediaMetaData *mediaMetaDataObj = [mediaObj.mediaMetadataArray objectAtIndex:0];
            mediaImageURL = mediaMetaDataObj.url;
        }
        
        if(![ValidationHelper isStringEmpty:mediaImageURL])
        {
            UIImage *placeHolderImg = [UIImage imageNamed:@"placeHolderImage"];
            
            NSURL *imgURL = [NSURL URLWithString:mediaImageURL];
            [cell.imgArticleMediaPhoto setImageWithURL:imgURL placeholderImage:placeHolderImg];
        }
    }
    
//    cell.imgArticleDate = articleObj.title;

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    

    
    Article *selectedArticleObj = [_articleArrays objectAtIndex:indexPath.row];
    
    
    UIStoryboard *MainStoryboardObj = [UIStoryboard storyboardWithName:kStoryBoardName_MainStoryboard bundle:[NSBundle mainBundle]];

    ArticalsDetailsViewController *ArticalsDetailsVC = [MainStoryboardObj instantiateViewControllerWithIdentifier:kStoryBoardIdentifiersForVC_ArticalsDetailsVC];
    ArticalsDetailsVC.selectedArticleObj = selectedArticleObj;

    [self.navigationController showViewController:ArticalsDetailsVC sender:self];

}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1.0f;
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


#pragma mark - Web Services

#pragma mark - Web Service
- (void) callWebServiceForFetchAllArticles
{
    [self->_lblError setHidden:YES];
    
    [self.view endEditing:YES];
    [[CommonHelper sharedInstance] hideProgressView];
    [[CommonHelper sharedInstance] showProgressViewWithTitle:@"Please wait, Loading Articles..."];
    
    
    NSString *section_str  = @"all-sections";
    
    // Possible Values = (1, 7, 30)
    NSString *period_str  = @"7";
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"api-key", kApiKey__NY_Articles,
                                nil];
    
    [Article getArticlesWithParameter:parameters
                          withSection:section_str
                           withPeriod:period_str
                              success:^(id _Nullable success) {
                                  
                                  DLog(@"Success");
                                  
                                  [self->_lblError setHidden:YES];
                                  
                                  [[CommonHelper sharedInstance] hideProgressView];
                                  
                                  self->_articleArrays = [[NSMutableArray alloc] init];
                                  
                                  WebServiceResponse *response = (WebServiceResponse *) success;
                                  
                                  NSArray *resultsArray = [response.jsonDict objectForKey:kWebService__Results];
                                  
                                  for (NSDictionary *resultDict in resultsArray)
                                  {
                                      Article *articleObj = [[Article alloc] init];
                                      
                                      
                                      
                                      articleObj.articleID = [resultDict objectForKey:@"id"];
                                      articleObj.articleAssetID= [resultDict objectForKey:@"asset_id"];
                                      
                                      articleObj.url= [resultDict objectForKey:@"url"];
                                      articleObj.adx_keywords= [resultDict objectForKey:@"adx_keywords"];
                                      articleObj.column= [resultDict objectForKey:@"column"];
                                      articleObj.section= [resultDict objectForKey:@"section"];
                                      articleObj.byline= [resultDict objectForKey:@"byline"];
                                      
                                      articleObj.type= [resultDict objectForKey:@"type"];
                                      articleObj.title= [resultDict objectForKey:@"title"];
                                      articleObj.abstract= [resultDict objectForKey:@"abstract"];
                                      articleObj.published_date= [resultDict objectForKey:@"published_date"];
                                      
                                      articleObj.source= [resultDict objectForKey:@"source"];
                                      articleObj.views= [resultDict objectForKey:@"views"];
                                      articleObj.des_facet= [resultDict objectForKey:@"des_facet"];
                                      articleObj.org_facet= [resultDict objectForKey:@"org_facet"];
                                      
                                      articleObj.per_facet= [resultDict objectForKey:@"per_facet"];
                                      articleObj.geo_facet= [resultDict objectForKey:@"geo_facet"];
                                      
                                      
                                      NSArray *mediaObjArray = [resultDict objectForKey:@"media"];
                                      
                                      
                                      NSMutableArray *mediaArray = [[NSMutableArray alloc] init];
                                      for (NSDictionary *mediaDict in mediaObjArray)
                                      {
                                          Media *mediaObj = [[Media alloc] init];
                                          
                                          mediaObj.type= [mediaDict objectForKey:@"type"];
                                          mediaObj.subtype= [mediaDict objectForKey:@"subtype"];
                                          mediaObj.caption= [mediaDict objectForKey:@"caption"];
                                          mediaObj.copyright= [mediaDict objectForKey:@"copyright"];
                                          mediaObj.approved_for_syndication= [mediaDict objectForKey:@"approved_for_syndication"];
                                          
                                          NSArray *mediaMetadataObjArray= [mediaDict objectForKey:@"media-metadata"];
                                          

                                          ////////////////////////////////////////////////////////
                                          NSMutableArray *mediaMetaDataArray = [[NSMutableArray alloc] init];
                                          for (NSDictionary *mediaDict in mediaMetadataObjArray)
                                          {
                                              MediaMetaData *mediaMetaDataObj = [[MediaMetaData alloc] init];
                                              
                                              mediaMetaDataObj.url = [mediaDict objectForKey:@"url"];
                                              mediaMetaDataObj.format = [mediaDict objectForKey:@"format"];
                                              mediaMetaDataObj.width = [mediaDict objectForKey:@"width"];
                                              mediaMetaDataObj.height = [mediaDict objectForKey:@"height"];
                                              
                                              [mediaMetaDataArray addObject:mediaMetaDataObj];
                                          }
                                          
                                          mediaObj.mediaMetadataArray = mediaMetaDataArray;
                                          ////////////////////////////////////////////////////////
                                          
                                          [mediaArray addObject:mediaObj];
                                      }
                                      
                                      articleObj.mediaArray = mediaArray;
                                      
                                      
                                      [self->_articleArrays addObject:articleObj];
                                  }
                                  
                                  
                                  [self->_articlesTableView reloadData];
                                  
                                  
        
    } failure:^(NSError * _Nullable error) {
        
        [self->_lblError setHidden:NO];
        
        [[CommonHelper sharedInstance] hideProgressView];

        NSString *errorMsg = [error localizedDescription];
        [[CommonHelper sharedInstance] displayAlertWithTitle:nil Message:errorMsg];
        
        
    }];
    
}

@end
