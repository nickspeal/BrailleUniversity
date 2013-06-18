//
//  teachALessonViewControllerSubclass.m
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "teachALessonViewControllerSubclass.h"
#import "EndLessonViewControllerSubclass.h"

@interface teachALessonViewControllerSubclass ()

@end

@implementation teachALessonViewControllerSubclass

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
    //[self.lessonFeedbackLabel setText:@"."];  
    //[self.lessonFeedbackLabel becomeFirstResponder];
    //UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel);
    //[self.lessonEntryField resignFirstResponder];
    //[self.lessonEntryField becomeFirstResponder];   //lets the user immediately start typing when the view loads (easier for pros) Unfortunately the voiceOver skips the intro label, but we ditched the label in favour of a hint so its cool
    //[self.lessonFeedbackLabel becomeFirstResponder];
    //UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel);
    //UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, self.lessonFeedbackLabel);
    
    
    // Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.lessonEntryField becomeFirstResponder];   //lets the user immediately start typing when the view loads (easier for pros) Unfortunately the voiceOver skips the intro label, but we ditched the label in favour of a hint so its cool
    //UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.lessonFeedbackLabel);
    //[self.lessonFeedbackLabel becomeFirstResponder];
    //[self.lessonEntryField becomeFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //In teach subclass, still need to go to end then save
    if ([segue.identifier isEqualToString:@"endSegue"]) { //should always be true
        EndLessonViewControllerSubclass *destViewController = segue.destinationViewController;
        destViewController.currentLessonInEnd = self.currentLessonInTeach;  //pass the array along down the pipe
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)localLessonEntryField {    //takes a text field object as an argument(in this case self.lessonEntryField) and saves it as the local variable localLessonEntryField, which is to be used in this function
    //called when user hits enter in only this text field, i think
    
    if ([localLessonEntryField.text isEqual: @""]){
        NSLog(@"Empty String Entered");
        [self.lessonEntryField resignFirstResponder];
        return YES;
    }
    
    


    //this section is for saving the phrase

    [self.currentLessonInTeach addObject:localLessonEntryField.text];  //append string to array
    NSLog(@"Array contents2: %@", self.currentLessonInTeach);
    
    //Playback was here

    
    //the following debug code is commented out:
    
    //        NSLog(@"About to resign first responder from textField");
    //      [localLessonEntryField resignFirstResponder];     //This kills the keyboard, but doesnt announce the label
    //        NSLog(@"about to become first responder");
    //      [self.lessonFeedbackLabel becomeFirstResponder];          //This kills the keyboard, but doesnt announce the label
    //        NSLog(@"after becomeFirstResponder");
  
    
    //This section is for immediate playback of the text on the screen
    [self.lessonFeedbackLabel setText:localLessonEntryField.text];   //display the contents of the textbox in the label
    
    [localLessonEntryField setText:@""];                    //wipe the contents of the textbox
    //UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel); //this reads out loud the label, without changeing the firstResponder, so the textbox is always listening for the keyboard.

    
    
    //[self.lessonFeedbackLabel becomeFirstResponder]; //shift focus forward and back again for braille display then typing
    //[self.lessonEntryField becomeFirstResponder];
    
    
    
    //[self.lessonEntryField resignFirstResponder];
    
    //UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.lessonFeedbackLabel);
    
    //[self.lessonEntryField becomeFirstResponder];
    
    NSLog(@"textFieldShouldReturn method end");
    return YES;
}



@end
