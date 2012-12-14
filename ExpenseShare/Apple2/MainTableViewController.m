//
//  MainTableViewController.m
//  Apple2
//
//  Created by jhsiao on 11/24/12.
//
//

#import "MainTableViewController.h"
#import "Event.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController
@synthesize profileCell;
@synthesize upcomingEventCell;
@synthesize feedCell;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        // Fetch user data
        NSLog(@"initWithStyle");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    mProfile = [[Profile alloc] init];
    mEventList = [NSArray arrayWithObjects:[[Event alloc] initWithSubject:@"Electrical" WithDateInterval:1334041160.459764],[[Event alloc] initWithSubject:@"Water" WithDateInterval:1354041160.459764], nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows = 0;

    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 1;
            break;
        case 2:
            rows = 1;
            break;
        default:
            break;
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        // Configure the cell...
        switch ([indexPath indexAtPosition:0])
        {
            case 0:
                [profileCell setProfile:mProfile];
                cell = profileCell;
                break;
            case 1:
                [upcomingEventCell setEvent:[mEventList objectAtIndex:0]];
                cell = upcomingEventCell;
                break;
            case 2:
                [feedCell setFeed:@"- Derrick paid rent on 2012/06/03\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"
                 "- Shelly added new bill on 2012/06/23\n"
                 "- Barry paid rent on 2012/07/02\n"];
                cell = feedCell;
                break;
            default:
                //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                break;
        }
    }
    
    return cell;
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString* sectionName = nil;
    switch (section)
    {
        case 0:
            sectionName = NSLocalizedString([mProfile getName], [mProfile getName]);
            break;
        case 1:
            sectionName = NSLocalizedString(@"Upcoming Event", @"Upcoming Event");
            break;
        case 2:
            sectionName = NSLocalizedString([mProfile getGroup], [mProfile getGroup]);
            break;
        default:
            sectionName = @"";
            break;
    }
    return sectionName;
}

- (void)viewDidUnload {
    [self setProfileCell:nil];
    [self setUpcomingEventCell:nil];
    [self setFeedCell:nil];
    [super viewDidUnload];
}
@end
