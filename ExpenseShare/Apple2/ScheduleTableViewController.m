#import "ScheduleTableViewController.h"

@interface ScheduleTableViewController()
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ScheduleTableViewController
@synthesize scheduleList = _scheduleList, dataArray = _dataArray;
@synthesize tableView = _tableView;

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.scheduleList = [[NSMutableArray alloc] init];
    //self.scheduleList = [[NSMutableArray alloc] initWithObjects:@"Water", @"Electricity",nil];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"ScheduleList" ofType:@"plist"];
//    self.scheduleList = [[NSMutableArray alloc] initWithContentsOfFile:path];
/*    if (self.scheduleList ==nil ) {
        NSLog(@"No..");
    }
*/
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setTableView:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)applicationDidEnterBackground:(NSNotification *)notification
{
    NSString *path = [[NSBundle mainBundle]
                      pathForResource:@"ScheduleList" ofType:@"plist"];
    [self.scheduleList writeToFile:path atomically:YES];
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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.scheduleList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.scheduleList objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"$1000";
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.scheduleList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   /*
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   */
}

#pragma mark - Table view delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addItem"]) {
         NSLog(@"ffff");
          [[[[segue destinationViewController]viewControllers]objectAtIndex:0]setDelegate:self];
  //      [[[[[segue destinationViewController]viewControllers]objectAtIndex:0]setData:[self.dataArray objectAtIndex:[[self.tableView indexPathForSelectedRow].row]]];
    }
    
  

}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    /*     SchoolRestViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
     
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */     
}

#pragma mark - function
-(void) updateItems:(NSMutableArray*) data
{
    [self.scheduleList insertObject:[data objectAtIndex:0] atIndex:[self.scheduleList count]];
    NSLog(@"hi...?");
    [self.dataArray insertObject:data atIndex:[self.dataArray count]];
    [self.tableView reloadData];
}



@end
