//
//  SelectableUILable.m
//  Braille University
//
//  Created by Michael King on 2013-03-18.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "SelectableUILable.h"

@implementation SelectableUILable

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(BOOL)canBecomeFirstResponder{
    return YES;
}


- (void) setText:(NSString *)text {
 // Set the text by calling the base class method.
 [super setText:text];
 // Announce the new text with voiceover
 //UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, text);
 }

/*
 -(void)text:(NSString *)text{
 return *super.text;
 }
 -(void)setText:(NSString*)text {
 return super.setText:text;
 }
 */

@end
