//
//  ViewController.h
//  Braille University
//
//  Created by Michael King on 2013-02-23.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
//@property (weak, nonatomic) IBOutlet UITextField *textField; 
//- (IBAction)enterText:(id)sender;
//@property (copy,nonatomic) NSString *words;
@property (nonatomic, retain) NSMutableArray *currentLesson; //nonatomic means not for multithreading; retain means dont delete the variable after it is copied to this array

@end