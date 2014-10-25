//
//  libraryViewControllerSubclass.h
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tableViewController.h"

@interface libraryViewControllerSubclass : UIViewController
@property NSMutableArray *list;
- (IBAction) loadLectureNotes;

@end
