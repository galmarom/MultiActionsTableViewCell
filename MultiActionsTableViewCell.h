//
//  UITableViewCell+TableViewCellWithRightButtons.h
//  Venue10
//
//  Created by galmarom on 10/11/14.
//  Copyright (c) 2014 galmarom. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActionButtonsDelegate.h"

@interface MultiActionsTableViewCell :UITableViewCell

/** Adding action button to the cell
 *@param actionButtonsArray- an NSArray containing the UIActionButton that the user wants to add on the cell.
 *@param delegate - a ActionButtonsDelegate to send the UIActionButton functions to upon click.
 *@note The ActionButtonsDelegate will save the active cell and set its selection state to TRUE/FALSE. according to its selection mode the animation will be invoked and the action view will be shown/hidden.
 */
-(void) addButtonsToFrame:(NSArray *) actionButtonsArray delegate: (id<ActionButtonsDelegate>) delegate;

/**
 *Set the cell as active - showing the action view
 *@param active - indicates weather the cell is active or not
 */
-(void) setActive:(BOOL)active;
@end
