//
// VerticallyAlignedLabel.m
//

#import "VerticallyAlignedLabel.h"


@implementation VerticallyAlignedLabel

@synthesize textAlignmentVerticalPosition = textAlignmentVerticalPosition_;

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.textAlignmentVerticalPosition = VerticalAlignmentMiddle;
    }
    
    return self;
}

- (void)setTextAlignmentVerticalPosition:(VerticalAlignment)verticalAlignment
{
    textAlignmentVerticalPosition_ = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.textAlignmentVerticalPosition)
    {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect
{
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end
