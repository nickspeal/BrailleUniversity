//
//  EndLessonViewControllerSubclass.m
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "EndLessonViewControllerSubclass.h"
#import "saveViewControllerSubclass.h"

@interface EndLessonViewControllerSubclass ()

@end

@implementation EndLessonViewControllerSubclass

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //In end subclass, still need to go to save
    if ([segue.identifier isEqualToString:@"saveSegue"]) { //should always be true
        saveViewControllerSubclass *destViewController = segue.destinationViewController;
        destViewController.currentLessonInSave = self.currentLessonInEnd;  //pass the array along down the pipe
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
