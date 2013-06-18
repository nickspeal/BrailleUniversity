//
//  textbookViewController.h
//  Braille University
//
//  Created by Martin M on 13-03-26.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface textbookViewController : UIViewController

@property (weak, nonatomic) NSArray *list;
@property (weak, nonatomic) NSString *destTitle;

-(IBAction)easyButtonPressed;
-(IBAction)intermediateButtonPressed;

@end
