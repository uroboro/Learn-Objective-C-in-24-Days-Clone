//
//  ATViewController.h
//  AdvancedTables
//
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *names, *populations;
@property (strong, nonatomic) IBOutlet UITableView *mainTable;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editingToggle;
@property (strong, nonatomic) NSIndexPath *lastIndexPath;

- (IBAction)toggleEdit:(id)sender;
@end
