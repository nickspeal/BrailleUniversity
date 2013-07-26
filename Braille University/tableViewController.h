//
//  tableViewController.h
//  test
//
//  Created by Michael King on 2013-03-25.
//  Copyright (c) 2013 Martin M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *nameList;
@property (nonatomic) int selectedIndex;

@end
