//
//  libraryViewControllerSubclass.m
//  Braille University
//
//  Created by Nick on 2013-03-25.
//  Copyright (c) 2013 HCI. All rights reserved.
//

#import "libraryViewControllerSubclass.h"

@interface libraryViewControllerSubclass ()

@end

@implementation libraryViewControllerSubclass

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
    self.list = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) loadLectureNotes {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"lectureNotes.txt"];
    
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    
    NSLog(fileContents);
        
    //NSString *toSplit = @"name:::part1:::part2";
    [self.list removeAllObjects];
    [self.list addObjectsFromArray:[fileContents componentsSeparatedByString:@"\n"]];
    
    NSLog(@"Printing fileContents:");
    NSLog(fileContents);
    
    /* Removes the last empty line if necessary */
    if ([self.list objectAtIndex:([self.list count] - 1)]) {
        /*NSRange validRange;
        validRange.location = 0;
        validRange.length = [self.list count] - 1;
        [self.list removeAllObjects];
        [self.list addObjectsFromArray:[self.list subarrayWithRange:validRange]];*/
        
        [self.list removeObjectAtIndex:([self.list count] - 1)];
    }
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"lectureNotesSegue"]) {
        
        tableViewController *dest = (tableViewController *)[segue destinationViewController];

        /* Revert array so that the last lessons are displayed first */
        dest.nameList = [NSMutableArray array];
        [dest.nameList addObjectsFromArray:[[self.list reverseObjectEnumerator] allObjects]];
        [dest setTitle:@"Lecture Notes"];
        
        NSLog(@"Here");
        NSLog([self.list objectAtIndex:0]);
    }
}



@end
