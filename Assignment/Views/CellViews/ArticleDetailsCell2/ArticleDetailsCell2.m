//
//  ArticleDetailsCell2.m
//

#import "ArticleDetailsCell2.h"

@implementation ArticleDetailsCell2


- (void) awakeFromNib
{
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        [self->_lblDetails setTextAlignmentVerticalPosition:VerticalAlignmentTop];
        
    });
    
    
}

@end
