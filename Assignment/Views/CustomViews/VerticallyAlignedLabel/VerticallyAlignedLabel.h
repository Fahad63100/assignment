//
// VerticallyAlignedLabel.h
//

#import <Foundation/Foundation.h>


typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface VerticallyAlignedLabel : UILabel
{
    @private
    VerticalAlignment textAlignmentVerticalPosition_;
}

@property (nonatomic, assign) VerticalAlignment textAlignmentVerticalPosition;

@end
