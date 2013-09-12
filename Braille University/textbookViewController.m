//
//  textbookViewController.m
//  Braille University
//
//  Created by Martin M on 13-03-26.
//  Copyright (c) 2013 HCI. All rights reserved.
//


#import "textbookViewController.h"
#import "tableViewController.h"

@interface textbookViewController ()

@end

@implementation textbookViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)easyButtonPressed {
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"easy" ofType:@"txt" inDirectory:@""];
    
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    //NSString *toSplit = @"name:::part1:::part2";
    self.list = [fileContents componentsSeparatedByString:@"\n"];
    self.destTitle = NSLocalizedString(@"EASY_STR", @"Title for easy lessons view"); //@"Easy Lessons";

}

-(IBAction)intermediateButtonPressed {
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  //  NSString *documentsDirectory = [paths objectAtIndex:0];
 //  NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"intermediate.txt"];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"intermediate" ofType:@"txt" inDirectory:@""];
    
    NSString *fileContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    
    //NSString *toSplit = @"name:::part1:::part2";
    self.list = [fileContents componentsSeparatedByString:@"\n"];
    //self.destTitle = @"Intermediate Lessons";
    self.destTitle = NSLocalizedString(@"INT_STR", @"Title for intermediate lessons view");

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    tableViewController *dest = (tableViewController *)[segue destinationViewController];
    // NSLog(@"PRINTING SEGUE ID");
    //NSLog(segue.identifier);
    
    dest.nameList = [self.list copy];
    [dest setTitle:self.destTitle];
}

@end
