//
//  DetailView.m
//  Apple2
//
//  Created by Pei-fen Tu on 11/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DetailView.h"
@interface DetailView()
@property NSInteger selected;
@property(nonatomic,strong) NSIndexPath* selectedPath;
@property(nonatomic,strong) NSString* originalText;
//- (void) setSelected:(NSInteger)selected;
@end

@implementation DetailView
@synthesize selected = _selected, selectedPath = _selectedPath;
@synthesize choice = _choice;
@synthesize choicesList = _choicesList;
@synthesize tableView = _tableView;
@synthesize delegate = _delegate;
@synthesize originalText = _originalText;

#pragma mark - View lifecycle
// Implement loadView to create a view hierarchy programmatically, without using a nib.

- (void)loadView
{
    [super loadView];
    switch (self.selected) {
        case 0:
            self.choicesList = [[NSMutableArray alloc] initWithObjects:@"Rent", @"Water", @"Electricity", @"Other", nil];    
            self.originalText = @"Others";
            break;
        case 1:
            self.choicesList = [[NSMutableArray alloc] initWithObjects:@"Week", @"Month", @"Quarter", @"Year", nil];
            break;
        case 2:
              self.choicesList = [[NSMutableArray alloc] initWithObjects:@"Divide evenly", @"Take turns", @"Pay by..", nil];
            self.originalText = @"Pay by..";
            break;
/*        case 3:
              self.choicesList = [[NSMutableArray alloc] initWithObjects:@"Water", @"electricity", @"Gas", @"Others", nil];
            break;
            */
        default:
            break;
    }
    
    
}

#define END_OF_ARRAY [self.choicesList count]-1


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    NSLog(@"test");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self setTableView:nil];
}


-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.  
          NSLog(@"test");  

/*        
 [self.propList setObject:@"" forKey:@"Type"];
 [self.propList setObject:@"" forKey:@"Repeat"];
 [self.propList setObject:@"" forKey:@"Term"];
 [self.propList setObject:@"" forKey:@"Cost"];
  */      
        NSString* selectedItem;
        
        switch (self.selected) {
            case 0:
                selectedItem = @"Type";
                break;
            case 1:
                selectedItem = @"Repeat";
                break;
            case 2:
                selectedItem = @"Term";
                break;
            case 3:
                selectedItem = @"Cost";
                break;
            default:
                break;
        }
//        [self.delegate scheduleDetail:selectedItem : [self.choicesList objectAtIndex:[self.tableView indexPathForSelectedRow].row]];
    [self.delegate scheduleDetail:selectedItem: self.choice];
        
    }
    [super viewWillDisappear:animated];
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
//
 //   return 3;
//
    return [self.choicesList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier;
    if ((self.selected == 0 && indexPath.row == [self.choicesList count]-1) || (self.selected == 2 && indexPath.row == [self.choicesList count]-1) )
    {
 //       NSLog(@"TEST2222");
        CellIdentifier = @"Cell2";
    }
    else
        CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self.choicesList objectAtIndex:indexPath.row];
    if ((self.selected == 0 && indexPath.row == [self.choicesList count]-1) || (self.selected == 2 && indexPath.row == [self.choicesList count]-1)) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;        
    }
    if ([cell.textLabel.text isEqualToString:self.choice]) {
        self.selectedPath = indexPath;
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
//    cell.detailTextLabel.text = @"$1000";
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
        // Delete th row from the data source
        [self.scheduleList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }   
         else if (editingStyle == UITableViewCellEditingStyleInsert) {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }   *_tableView/
}
*/
#pragma mark - Table view delegate

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
/*    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    NSIndexPath* newIndex = [[NSIndexPath alloc] initWithIndex:<#(NSUInteger)#>] 
    selectedRowIndex.row = [self.choicesList count] - 1;
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.selectedPath];*/
//    if (selectedRowIndex.row == 0 || selectedRowIndex.row == 2) {
 //       [segue.destinationViewController setSelectedName:self.selected];
    [[[[segue destinationViewController]viewControllers]objectAtIndex:0] setSelectedName:self.selected];
 //   NSString* temp;

//    if ([self.choicesList objectAtIndex:[self.choicesList count]-1] != self.originalText) 
 //       [segue.destinationViewController setCurType:[self.choicesList objectAtIndex:[self.choicesList count]-1]];
    [[[[segue destinationViewController]viewControllers]objectAtIndex:0] setCurType:[self.choicesList objectAtIndex:[self.choicesList count]-1]];
//        temp = [self.choicesList objectAtIndex:[self.choicesList count]-1];
 /*   }else
        temp = @"";
   */ 
 //       [segue.destinationViewController setCurType:temp];
        //[segue.destinationViewController setDelegate:self];
    
    [[[[segue destinationViewController]viewControllers]objectAtIndex:0] setDelegate:self];
//    }
   
    
   /* if([segue.identifier isEqualToString:@"Get School Restaurant"])
    {
        NSLog(@"seg");
    }
    */
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:self.selectedPath];
    cell.accessoryType = UITableViewCellAccessoryNone;

    self.selectedPath = indexPath;
    self.choice = [self.choicesList objectAtIndex:indexPath.row];
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    // Navigation logic may go here. Create and push another view controller.
    
    /*     SchoolRestViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */     
}




#pragma mark button action
- (IBAction)cancel:(UIBarButtonItem*)sender
{
    [self dismissModalViewControllerAnimated:YES];
}


#pragma mark functions
- (void) currentLabel:(NSString *)label
{
    if (![label isEqualToString:@""] && ![self.choice isEqualToString:label]) {
        self.choice = label;
        NSLog(@"%@", [label description]);
        [self.choicesList insertObject:label atIndex:([self.choicesList count]-1)];
  
    }else{
        NSLog(@"WTF?");
//        [self.choicesList replaceObjectAtIndex:([self.choicesList count]-1) withObject:self.originalText];
    }
    [self.tableView reloadData];
    /*
    NSIndexPath* rowToReload = [NSIndexPath indexPathForRow:[self.choicesList count]-1 inSection:0];
    NSArray* rowsToReload = [NSArray arrayWithObjects:rowToReload, nil];
    [self.tableView reloadRowsAtIndexPaths:rowsToReload withRowAnimation:UITableViewRowAnimationNone];
    */
    
    
}

/*- (void) setSelected:(NSInteger)selected
{
    if (_selected != selected) {
        _selected = selected;
    }
}
*/
@end
