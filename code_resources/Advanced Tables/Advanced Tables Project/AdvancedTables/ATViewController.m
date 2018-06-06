//
//  ATViewController.m
//  AdvancedTables
//
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ATViewController.h"

@implementation ATViewController
@synthesize names, populations;
@synthesize mainTable;
@synthesize editingToggle;
@synthesize lastIndexPath;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Cities" ofType:@"plist"];
	NSData *data = [NSData dataWithContentsOfFile:filePath];
	NSPropertyListFormat format;
	NSString *error;
	id fileContents = [NSPropertyListSerialization propertyListFromData:data mutabilityOption:NSPropertyListImmutable format:&format errorDescription:&error];
	self.populations = [[fileContents objectForKey:@"City Population"] mutableCopy];
	self.names = [[fileContents objectForKey:@"City Names"] mutableCopy];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View Data Source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [self.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellID = @"CellID";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
	if (!cell) {		// Create new cell
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
		cell.showsReorderControl = YES;
	}
	NSUInteger row = indexPath.row;
	NSUInteger oldRow = lastIndexPath.row;
	if (row == oldRow && lastIndexPath != nil)
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	else
		cell.accessoryType = UITableViewCellAccessoryNone;
	cell.textLabel.text = [self.names objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"Population: %@", [self.populations objectAtIndex:indexPath.row]];
	cell.imageView.image = [UIImage imageNamed:@"CaliforniaIcon.png"];
	cell.imageView.highlightedImage = [UIImage imageNamed:@"CaliforniaIconPressed.png"];
	return cell;
}

#pragma mark - Editing
- (IBAction)toggleEdit:(id)sender {
	[self.mainTable setEditing:!self.mainTable.isEditing animated:YES];
	if (self.mainTable.isEditing) {
		[self.editingToggle setStyle:UIBarButtonItemStyleDone];
		[self.editingToggle setTitle:@"Done"];
	}
	else {
		[self.editingToggle setStyle:UIBarButtonItemStyleBordered];
		[self.editingToggle setTitle:@"Edit"];
	}
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
	NSUInteger fromRow = [fromIndexPath row];
	NSUInteger toRow = [toIndexPath row];
	id name = [self.names objectAtIndex:fromRow];
	id pop = [self.populations objectAtIndex:fromRow];
	[self.names removeObjectAtIndex:fromRow];
	[self.populations removeObjectAtIndex:fromRow];
	[self.names insertObject:name atIndex:toRow];
	[self.populations insertObject:pop atIndex:toRow];
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = [indexPath row];
	[self.names removeObjectAtIndex:row];
	[self.populations removeObjectAtIndex:row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSUInteger row = indexPath.row;
	NSUInteger oldRow = lastIndexPath.row;
	if (oldRow != row) {
		UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath]; 
		newCell.accessoryType = UITableViewCellAccessoryCheckmark;
		UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:lastIndexPath];
		oldCell.accessoryType = UITableViewCellAccessoryNone;
		lastIndexPath = indexPath;
	}
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 88;
} */

/*
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
	return indexPath.row;
} */

@end
