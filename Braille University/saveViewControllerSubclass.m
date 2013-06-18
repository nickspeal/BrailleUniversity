//
//  saveViewControllerSubclass.m
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "saveViewControllerSubclass.h"


@interface saveViewControllerSubclass ()

@end

@implementation saveViewControllerSubclass

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
    //[self.textFieldSaveLesson becomeFirstResponder];   //lets the user immediately start typing when the view loads (easier for pros) Unfortunately the voiceOver skips the intro label, but we ditched the label in favour of a hint so its cool
	// Do any additional setup after loading the view.
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.textFieldSaveLesson becomeFirstResponder];
    //UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, self.lessonFeedbackLabel);
    //[self.lessonFeedbackLabel becomeFirstResponder];
    //[self.lessonEntryField becomeFirstResponder];
    
}

- (IBAction)typingDone:(id)sender {
    NSLog(@"typing done entered");
    // hides keyboard from text field
    [self.textFieldSaveLesson resignFirstResponder];
    [self saveThisLesson];
    [self performSegueWithIdentifier:@"restartAfterSaving" sender:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction) saveThisLesson {
    //Called on "Enter" by method aboove "typingDone"
    //Just saves
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"lectureNotes.txt"];
    
    //NSString *str = @"this is a test\nwithmultiple lines";
    
    //[str writeToFile:filePath atomically:TRUE encoding:NSUTF8StringEncoding error:NULL];
    
    bool fileExists = [[NSFileManager defaultManager] fileExistsAtPath:filePath];
    
    if (!fileExists) {
    //create empty file if none already exists
        [@"" writeToFile:filePath atomically:TRUE encoding:NSUTF8StringEncoding error:NULL];
    }
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL]; //read file to fileContents
    
    //append to file:
    
    /*
     1. title
     2.:::
     3.loop through array (separate with :::)
     4.\n
     
     */
    //add title
    NSString *newFileContents = [fileContents stringByAppendingString:self.textFieldSaveLesson.text]; //append to newFileContents string
    for (int i = 0; i < [self.currentLessonInSave count]; i++) {
        newFileContents = [newFileContents stringByAppendingString:@":::"]; //append to newFileContents string
        newFileContents = [newFileContents stringByAppendingString:self.currentLessonInSave[i]]; //append to newFileContents string        
    }
    newFileContents = [newFileContents stringByAppendingString:@"\n"]; //append to newFileContents string

    
    [newFileContents writeToFile:filePath atomically:TRUE encoding:NSUTF8StringEncoding error:NULL]; //write newFileContents string to file
    
    
    
    
    
    /*
    MARTINS DEVELOPMENT COMMENTS
    
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"Current text is: ");
    NSLog([NSString stringWithFormat:@"%@", str]);
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePath];
    [fileHandle seekToEndOfFile];
    
    //NSString *toSplit = @"name:::part1:::part2";
    self.list = [str componentsSeparatedByString:@"\n"];
    //NSString *new = @"";
    for (int i = 0; i < [self.list count]; i++) {
        //new = [new stringByAppendingString:list[i]];
        NSLog([NSString stringWithFormat:@"Entry %d: %@", i, self.list[i]]);
    }
    //[fileHandle writeData: [new dataUsingEncoding:NSUTF8StringEncoding]];
     */
 
}


@end
