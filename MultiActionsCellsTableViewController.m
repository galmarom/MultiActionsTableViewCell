//
//  multiActionsCellsTableViewController.m
//  Venue10
//
//  Created by galmarom on 10/12/14.
//  Copyright (c) 2014 galmarom. All rights reserved.
//

#import "MultiActionsCellsTableViewController.h"

@implementation MultiActionsCellsTableViewController

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //Return the activeMultiActionsCell to it's original position (hide the action view)
    [self deactivateCell];
}


#pragma mark protocol methods

-(void) activateCell : (MultiActionsTableViewCell *) multiActionsTableViewCell
{
    //Set the activeMultiActionsCell to chosen one and invoke its selection - reveal the action view
    self.activeMultiActionsCell = multiActionsTableViewCell;
    [self.activeMultiActionsCell setActive:TRUE];
}

-(void) deactivateCell
{
    if(self.activeMultiActionsCell)
    {
        //Set the activeMultiActionsCell to false - hide the action view
        [self.activeMultiActionsCell setActive:FALSE];
    }
    
}

/**
 *example for a method implementation
 *@code -(void) deleteButtonTouched
 {
 NSIndexPath *indexPath = [self.tableView indexPathForCell:self.activeMultiActionsCell];
 [array removeObjectAtIndex:indexPath.row];
 [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 */
-(void) deleteButtonTouched
{
    NSLog(@"deleteButtonTouched should be overriden");
}

-(void) contactButtonTouched
{
    NSLog(@"contactButtonTouched should be overriden");
}

-(void) showMoreButtonTouched
{
    NSLog(@"showMoreButtonTouched should be overriden");
}





@end
