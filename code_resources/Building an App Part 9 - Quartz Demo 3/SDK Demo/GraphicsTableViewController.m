//
//  RootTableViewController.m
//  SDK Demo
//

#import "GraphicsTableViewController.h"
#import "CustomDrawingViewController.h"

@implementation GraphicsTableViewController
@synthesize tableViewData;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.title = @"Graphics Demo";
	NSArray *section1 = [NSArray arrayWithObjects:@"Straight Lines", @"Curves", @"Shapes", nil];
	NSArray *section2 = [NSArray arrayWithObjects:@"Solid Fills", @"Gradient Fills", @"Image & Pattern Fills", nil];
	NSArray *section3 = [NSArray arrayWithObjects:@"Simple Animations", @"Bounce", @"Other Options", nil];
	self.tableViewData = [NSDictionary dictionaryWithObjectsAndKeys:section1, @"Section1", section2, @"Section2", section3, @"Section3", nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [self.tableViewData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id sectionInfo = [self.tableViewData objectForKey:[NSString stringWithFormat:@"Section%d", section + 1]];
	return [(NSArray *)sectionInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		// Common to all cells
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure individual cells
	id section = [self.tableViewData objectForKey:[NSString stringWithFormat:@"Section%d", indexPath.section + 1]];
	NSString *rowLabel = [section objectAtIndex:indexPath.row];
	cell.textLabel.text = rowLabel;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"Lines & Shapes";
			break;
		case 1:
			return @"Images & Fills";
			break;
		case 2:
			return @"Animations";
			break;
		default:
			return nil;
			break;
	}
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomDrawingViewController *drawingVC = [[CustomDrawingViewController alloc] initWithContentMode:(QuartzContentMode)indexPath.section * 3 + indexPath.row];
	drawingVC.viewTitle = [[tableView cellForRowAtIndexPath:indexPath] textLabel].text;
	[self.navigationController pushViewController:drawingVC animated:YES];
}

#pragma mark - Rotation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
