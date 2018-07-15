//
//  ArticleDetailsCell1.m
//

#import "ArticleDetailsCell1.h"

@implementation ArticleDetailsCell1


- (void) awakeFromNib
{
    [super awakeFromNib];
    
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        
        [self->_lblTitle setTextAlignmentVerticalPosition:VerticalAlignmentMiddle];
        [self->_lblDetails setTextAlignmentVerticalPosition:VerticalAlignmentMiddle];
        
    });
    
    
}

@end
