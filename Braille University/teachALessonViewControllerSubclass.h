//
//  teachALessonViewControllerSubclass.h
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectableUILable.h"

@interface teachALessonViewControllerSubclass : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *lessonEntryField;
@property (weak, nonatomic) IBOutlet UILabel *lessonFeedbackLabel;
@property (weak, nonatomic) IBOutlet UILabel *teachIntroLabel;
@property (nonatomic, retain) NSMutableArray *currentLessonInTeach; //nonatomic means not for multithreading; retain means dont delete the variable after it is copied to this array
@end
