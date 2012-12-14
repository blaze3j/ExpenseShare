//
//  EditViewController.m
//  Apple2
//
//  Created by Pei-fen Tu on 11/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EditViewController.h"
@interface EditViewController()
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property(retain, nonatomic) IBOutlet UIDatePicker* datePicker;
@end

@implementation EditViewController
@synthesize tableView = _tableView, datePicker = _datePicker;
@synthesize propList = _propList;
@synthesize propKey = _propKey, data = _data;


bool isEditing;

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    //    NSArray* wordList = [[NSArray alloc] initWithObjects:@"type", @"Repeat", @"Term", @"Cost", nil];
    isEditing = false;
    
    if (nil == mEvent)
    {
        NSLog(@"Error in %s:%s event is nil", __FILE__, __FUNCTION__);
        assert(false);
    }
    
    self.propList = [[NSMutableDictionary alloc] initWithCapacity:4];
    [self.propList setObject:[mEvent getType] forKey:@"Type"];
    [self.propList setObject:[mEvent getFrequency] forKey:@"Repeat"];
    [self.propList setObject:[mEvent getTerm] forKey:@"Term"];
    [self.propList setObject:[NSString stringWithFormat:@"%.02f", [[mEvent getCost] floatValue]] forKey:@"Cost"];
    [self.datePicker setDate:[mEvent getDate]];
    
    self.propKey = [[NSArray alloc] initWithObjects:@"Type", @"Repeat", @"Term", @"Cost", nil];

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

- (void)setEvent:(Event*) event
{
    mEvent = event;
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
    if (isEditing == true) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else
        cell.accessoryType = UITableViewCellAccessoryNone;
    
    
    cell.textLabel.text = [self.propKey objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [self.propList objectForKey:[self.propKey objectAtIndex:indexPath.row]];
    return cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // rows in section 0 should not be selectable
    if (isEditing == false ) return nil;
    
    // By default, allow row to be selected
    return indexPath;
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
    } else
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
- (IBAction)edit:(UIBarButtonItem*)sender {
          
        if (isEditing == true) {           
            [(UIBarButtonItem *)sender setTitle:@"Edit"];
            isEditing = false;
            NSLog(@"%@", self.propList);
            
            [mEvent setType:[self.propList objectForKey:@"Type"]];
            [mEvent setFrequency:[self.propList objectForKey:@"Repeat"]];
            [mEvent setTerm:[self.propList objectForKey:@"Term"]];
            [mEvent setCost:[NSNumber numberWithFloat:[[self.propList objectForKey:@"Cost"] floatValue]]];
            [mEvent setDate:[self.datePicker date]];
//            NSLog(@"Date: %@", [self.datePicker date]);
        }
        else {
            [(UIBarButtonItem *)sender setTitle:@"Done"];
            isEditing = true;
            // Turn on edit mode
            
        }
    [self.tableView reloadData];
    
}

- (IBAction)cancel:(UIBarButtonItem*)sender {
    [self dismissModalViewControllerAnimated:YES];
}

@end