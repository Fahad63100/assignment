//
//  ArticleCell.m
//

#import "ArticleCell.h"

@implementation ArticleCell


- (void) awakeFromNib
{
    [super awakeFromNib];
    
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        [self->_lblArticleTitle setTextAlignmentVerticalPosition:VerticalAlignmentTop];
        [self->_lblArticleByLine setTextAlignmentVerticalPosition:VerticalAlignmentTop];
        [self->_lblArticleSection setTextAlignmentVerticalPosition:VerticalAlignmentTop];
        [self->_lblArticlePublishedDate setTextAlignmentVerticalPosition:VerticalAlignmentTop];
        
    });
    
    
}

@end
