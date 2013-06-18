//
//  tableViewController.m
//  test
//
//  Created by Michael King on 2013-03-25.
//  Copyright (c) 2013 Martin M. All rights reserved.
//

#import "tableViewController.h"
#import "lessonController.h"

@interface tableViewController ()

@end

@implementation tableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //NSLog(self.nameList );
    //NSLog(@"Printing from the new view");
    for (int i = 0; i < [self.nameList count]; i++) {
        //NSLog(self.nameList[i]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
    //    return [self.nameList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    //return 0;
    //Kills the last (empty) line
    return [self.nameList count] - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier]; //forIndexPath:indexPath];
    
    // Configure the cell...
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *name;
    //NSLog([NSString stringWithFormat:@"%@", self.title]);
    if ([self.title isEqualToString:@"Lecture Notes"]) {
        
        name = [(NSString *)[self.nameList objectAtIndex:([self.nameList count] - 2 - indexPath.row )] componentsSeparatedByString:@":::"][0];
        
    } else {
        name = [(NSString *)[self.nameList objectAtIndex:indexPath.row] componentsSeparatedByString:@":::"][0];
    }
    
    cell.textLabel.text = name;//[self.nameList objectAtIndex:indexPath.row];
    return cell;
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.title isEqualToString:@"Lecture Notes"]) {
        self.selectedIndex = [self.nameList count] - 2 - indexPath.row;
    } else {
        self.selectedIndex = indexPath.row;
    }
    
    
    [self performSegueWithIdentifier:@"chooseSpecificLesson" sender:self];
    
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    lessonController *dest = (lessonController *)[segue destinationViewController];
    
    //int index = [segue.identifier intValue];

    NSArray *lessonLists = [self.nameList[self.selectedIndex] componentsSeparatedByString:@":::"];
    
    dest.lessons = [lessonLists copy];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

//#pragma mark - Table view delegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
    // Navigation logic may go here. Create and push another view controller.
    /*
  //   <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
//}

@end
