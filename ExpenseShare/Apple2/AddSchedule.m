//
//  AddSchedule.m
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AddSchedule.h"
@interface AddSchedule()
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property(retain, nonatomic) IBOutlet UIDatePicker* datePicker;
@property (nonatomic, weak) id<AddScheduleProtocol> delegate;
@end

@implementation AddSchedule
@synthesize tableView = _tableView, datePicker = _datePicker;
@synthesize propList = _propList;
@synthesize propKey = _propKey;
@synthesize delegate = _delegate;

#pragma mark - View lifecycle



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
//    NSArray* wordList = [[NSArray alloc] initWithObjects:@"type", @"Repeat", @"Term", @"Cost", nil];
    self.propList = [[NSMutableDictionary alloc] initWithCapacity:4];
    [self.propList setObject:@"" forKey:@"Type"];
    [self.propList setObject:@"" forKey:@"Repeat"];
    [self.propList setObject:@"" forKey:@"Term"];
    [self.propList setObject:@"" forKey:@"Cost"];
    
    self.propKey = [[NSArray alloc] initWithObjects:@"Type", @"Repeat", @"Term", @"Cost", nil];
    
    if (self.delegate == nil) {
        NSLog(@"www....");
    }else{
        NSLog(@"okok");
    }
    
    /*
    self.datePicker.date = 
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 2 ];
    self.datePicker.minimumDate = 
    [[ NSDate alloc ] initWithTimeIntervalSinceNow: (NSTimeInterval) 0 ];
    */
    
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setTableView:nil];
    [self setDatePicker:nil];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return [self.propList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    if (indexPath.row == 3) {
        CellIdentifier = @"Cell2";
    }
    else
        CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    // Configure the cell...
    
    cell.textLabel.text = [self.propKey objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.propList objectForKey:[self.propKey objectAtIndex:indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.scheduleList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        
    }   
         else if (editingStyle == UITableViewCellEditingStyleInsert) {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }   */
//}

#pragma mark - Table view delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    if (selectedRowIndex.row <3) 
    {
        [segue.destinationViewController setChoice:[self.propList objectForKey:[self.propKey objectAtIndex:selectedRowIndex.row]]];
        [segue.destinationViewController setSelected:selectedRowIndex.row];
        [segue.destinationViewController setDelegate:self];
    }else
    {
        [segue.destinationViewController setAmount:[self.propList objectForKey:@"Cost"]];
        [segue.destinationViewController setDelegate:self];
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


#pragma mark protocol
- (void) scheduleDetail:(NSString*) selectedItem: (NSString*) choices
{
    [self.propList setObject:choices forKey:selectedItem];
    [self.tableView reloadData];
}

- (void) costAmount:(NSString *)selectedItem :(NSString *)amount
{
    [self.propList setObject:amount forKey:selectedItem];
    [self.tableView reloadData];
}

#pragma mark button action
#define ATTR_COUNT 4
- (IBAction)done:(UIBarButtonItem*)sender {
    NSMutableArray* result = [[NSMutableArray alloc] initWithCapacity:ATTR_COUNT];
    NSIndexPath* tempPath;
    for (int i = 0; i < ATTR_COUNT; i++) {
        tempPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:tempPath];
        [result insertObject:cell.detailTextLabel.text atIndex:i];
    }
    if(self.delegate)
        NSLog(@"hahaha"); 
    else
        NSLog(@"why");
    [self.delegate updateItems:result];
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancel:(UIBarButtonItem*)sender {
    [self dismissModalViewControllerAnimated:YES];
}


@end
