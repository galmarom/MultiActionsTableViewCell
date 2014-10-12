//
//  multiActionsCellsTableViewController.h
//  Gal Marom
//
//  Created by galmarom on 10/12/14.
//  Copyright (c) 2014 galmarom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MultiActionsTableViewCell.h"
#import "ActionButtonsDelegate.h"

@interface MultiActionsCellsTableViewController : UITableViewController<ActionButtonsDelegate>
/**
 *The activeMultiActionsCell saves the cell the current cell that shows the actions. 
 *@note only one cell at a time shows the actions. Before a new cell will show the acitons the crrent one will hide them.
 */
@property (nonatomic,strong) MultiActionsTableViewCell *activeMultiActionsCell;


@end
