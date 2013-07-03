//
//  ViewController.m
//  Braille University
//
//  Created by Michael King on 2013-02-23.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "ViewController.h"
#import "SelectableUILable.h"
#import "teachALessonViewControllerSubclass.h"


@interface ViewController ()
//@property (weak, nonatomic) IBOutlet SelectableUILable *label;


//- (IBAction)enterText:(id)sender;
- (IBAction)newLessonStarted:(id)sender;


@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Detects tap outside of first responder: send "dismissKeyboard"
    
    // These lines are commented out June 2 by Nick becuase the program wouldn't run on the ios 5.1 simulator otherwise
    
    
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
    //                               initWithTarget:self
    //                               action:@selector(dismissKeyboard)];
    
    //[self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)newLessonStarted:(id)sender {
    //NSMutableArray *currentLesson; //create new array
    self.currentLesson = [[NSMutableArray alloc] init]; //saves memory for the Array and initializes it.

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"newLessonSegue"]) {
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        teachALessonViewControllerSubclass *destViewController = segue.destinationViewController;
        destViewController.currentLessonInTeach = self.currentLesson;
    }
}



/*- (IBAction)enterText:(id)sender; {
    //this method is called when the text field resigns first responder
    //seems to be redundant as it is already implemented in  textFieldShouldReturn
    NSString *words = self.textField.text;
    self.label.text = words;
    NSLog(@"enterText method called");
}
*/ 
/*[textField setTarget:.label];
[textField setAction: @selector(enterText)];
*/


@end