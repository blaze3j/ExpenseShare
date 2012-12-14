//
//  CreateGroupTableViewController.m
//  CreateGroup
//
//  Created by Xiaofan Sun on 11/15/12.
//  Copyright (c) 2012 Xiaofan Sun. All rights reserved.
//

#import "CreateGroupTableViewController.h"
#import "MainTableViewController.h"
#import "DataAccess.h"
#import "ActiveProfile.h"

@interface CreateGroupTableViewController ()

@end

@implementation CreateGroupTableViewController
@synthesize groupNameField;
@synthesize memberList = _memberList, emailList = _emailList, statusList = _statusList;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)setGroup:(id)sender
{
    Profile* profile = [ActiveProfile sharedInstance];
    if (nil != profile)
    {
        [profile setGroup:groupNameField.text];
        
        DataAccess* db = [[DataAccess alloc] init];
        [db setProfileByGroupWithProfile:profile];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField == groupNameField)
    {
        [textField resignFirstResponder];
        [self setGroup:textField];
    }
    return NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Profile* profile = [ActiveProfile sharedInstance];
    NSString* group = [profile getGroup];
    if (nil != group)
    {
        groupNameField.text = group;
    }
    
    self.memberList = [[NSMutableArray alloc] init];
    [[self memberList] insertObject:(profile.getName) atIndex:(0)];
    self.emailList = [[NSMutableArray alloc] init];
    [[self emailList] insertObject:(profile.getEmail) atIndex:(0)];
    self.statusList = [[NSMutableArray alloc] init];
    [[self statusList] insertObject:(@"Accept") atIndex:(0)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    // Initial number of rows should be got from the database.
    // Here 2 means 1 row for the user him/herself + 1 row for adding new member
    return [self.memberList count] + 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;

    if ([indexPath row] >= [[self memberList] count] ) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"addCell"];
    } else {
        NSLog(@"in else, cellForRowAtIndexPath");
        if ([[self statusList] objectAtIndex:[indexPath row]] == @"Accept") {
            cell = [tableView dequeueReusableCellWithIdentifier:@"acceptCell"];
        } else {
            cell = [tableView dequeueReusableCellWithIdentifier:@"pendingCell"];
        }
        cell.textLabel.text = [[self memberList] objectAtIndex:[indexPath row]];
        cell.detailTextLabel.text = [[self emailList] objectAtIndex: [indexPath row]];
    }
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addCell"];
    }
    
    // Configure the cell...
    
    return cell;
}




// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    if (indexPath.row == 0 || indexPath.row == self.memberList.count)
        return NO;
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete && indexPath.row != 0) {
        // Delete the row from the data source
        [self.emailList removeObjectAtIndex:indexPath.row];
        [self.memberList removeObjectAtIndex:indexPath.row];
        [self.statusList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    /*
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    } 
    */
}



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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     DetailViewController *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}





//RootViewController.m
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Members";
}


- (void)viewDidUnload {
/*    [self setTblcelCreateGroupJoanne:nil];
    [self setTblcelCreateGroupIan:nil];
    [self setTblcelCreateGroupPeifen:nil];
    [self setTblcelCreateGroupJerry:nil];
 [self setBtnCreateGroup:nil];
 [self setBtnCreateGroupDone:nil];
 [self setGroupName:nil];
 [self setGroupNameField:nil];
*/
    [super viewDidUnload];
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addMember"]) {
        NSLog(@"ffff");
        [[[[segue destinationViewController]viewControllers]objectAtIndex:0]setDelegate:self];
    }
}

-(void) updateMembers:(NSString*) data {
    NSLog(@"hi...?");
    [self.memberList insertObject:data atIndex:[self.memberList count]];
    [self.emailList insertObject:data atIndex:[self.emailList count]];
    [self.statusList insertObject:@"Pending" atIndex:[self.statusList count]];

    [self.tableView reloadData];
    NSLog(@"hi...? over");
}

- (IBAction)btnCreateGroupDone:(id)sender {
/*    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"DoneCreate"
                                                      message:@"LoveLoveHouse"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
*/
    
}
@end
