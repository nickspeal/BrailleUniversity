//
//  SelectableUILable.h
//  Braille University
//
//  Created by Michael King on 2013-03-18.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface SelectableUILable : UILabel

//-(void)text:(NSString *)text; //these 2 were copied from net, not sure what they do
//-(void)setText:(NSString*)text; //these 2 were copied from net, not sure what they do
-(BOOL)canBecomeFirstResponder;
-(BOOL)isUserInteractionEnabled;

@end
