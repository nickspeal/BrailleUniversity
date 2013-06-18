//
//  EndLessonViewControllerSubclass.h
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndLessonViewControllerSubclass : UIViewController
@property (nonatomic, retain) NSMutableArray *currentLessonInEnd; //nonatomic means not for multithreading; retain means dont delete the variable after it is copied to this array
@end
