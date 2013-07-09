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
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    //UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.lessonFeedbackLabel);
    //[self.lessonFeedbackLabel becomeFirstResponder];
    [self.lessonEntryField becomeFirstResponder];
    
    //add observer
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(callback:)
                                                 name:@"UIKeyboardEmptyDelegateNotification"
                                               object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)callback:(NSNotification *)localNotification
{
    
    NSLog([localNotification name]);
    //[self.lessonEntryField becomeFirstResponder];
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
    
    NSLog(@"textFieldShouldReturn Entered");
       
    if ([localLessonEntryField.text isEqual: @""]) {
        //make keyboard go away if empty string entered
        NSLog(@"Empty String Entered");
        [self.lessonEntryField resignFirstResponder];
        return YES;
    }
    
    

    //  ----  this section is for saving the phrase   -----

    [self.currentLessonInTeach addObject:localLessonEntryField.text];  //append string to array
    NSLog(@"Array contents2: %@", self.currentLessonInTeach);
    

    
  
    
    //  ----  immediate playback of the text on the screen  ----
    
    //[self.lessonFeedbackLabel becomeFirstResponder];
    //UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel);
    
    //UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel); //this reads out loud the label, without changeing the firstResponder, so the textbox is always listening for the keyboard.
    
    
    [self.lessonFeedbackLabel setText:localLessonEntryField.text];   //display the contents of the textbox in the label
    [self.labelButton setTitle:localLessonEntryField.text forState:UIControlStateNormal];
    
    
    [localLessonEntryField setText:@""];                    //wipe the contents of the textbox

    //[self.lessonEntryField resignFirstResponder];
    //[self.dummyTextField becomeFirstResponder];
    //localLessonEntryField.userInteractionEnabled = NO;
    
    [self.labelButton becomeFirstResponder];
    
    
    //UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, self.lessonFeedbackLabel.text);
    
    
    
    
    
    // Select The whole text field:
    
    //[localLessonEntryField selectAll:self];
    //[UIMenuController sharedMenuController].menuVisible = NO;
    
    // UIAccessibilityZoomFocusChanged(UIAccessibilityZoomTypeInsertionPoint,self.lessonFeedbackLabel.frame,self.lessonFeedbackLabel); //this reads out loud the label, without changeing the firstResponder, so the textbox is always listening for the keyboard.
    //the above accessibility thing doesnt seem to do anything -Nick, July 4 2013
    
    //[self.lessonEntryField resignFirstResponder];
    //[self.lessonFeedbackLabel becomeFirstResponder]; //shift focus forward and back again for braille display then typing
    
    
    
    
    
    
    //UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.lessonFeedbackLabel);
    
    NSLog(@"textFieldShouldReturn method end");
    return YES;
}

-(void)viewDidUnload

{
    [self setLabelButton:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UIKeyboardEmptyDelegateNotification" object:nil];
    NSLog(@"viewDidUnload method called");
}

@end
