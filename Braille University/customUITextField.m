//
//  customUITextField.m
//  Braille University
//
//  Created by Nick on 2013-07-09.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "customUITextField.h"

@implementation customUITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
/*
-(BOOL)isAccessibilityElement
{
    return YES;
}

- (NSString *)accessibilityHint
{
    return NSLocalizedString(@"Hint goes here", nil);
}
*/
- (UIAccessibilityTraits)accessibilityTraits
{
    return UIAccessibilityTraitStaticText;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
