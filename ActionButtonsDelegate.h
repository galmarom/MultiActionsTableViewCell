//
//  ActionButtonsDelegate.h
//  Gal Marom
//
//  Created by galmarom on 10/11/14.
//  Copyright (c) 2014 galmarom. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MultiActionsTableViewCell;

/**
 *The ActionButtonsDelegate is a delegate which responsable for the comunication between the TableViewController and the cell itslef.
 */
@protocol ActionButtonsDelegate <NSObject>

//Enum describes the Actions the user wish to add to the button
typedef NS_ENUM(NSInteger, UIActionButton)
{
    UIActionButtonDelete,
    UIActionButtonContact,
    UIActionButtonMore
} ;

@required
/**
 * Save the active cell as the selected one
 *@param multiActionsTableViewCell - the cell that should be set as the active one. Only one cell is active at a time. i.e - only one cell shows the actions view.
 *@note the method use the cell select status in order to show/hide the actions button view.The method saves the current cell in order to deselect it upon an other cell's selection.
 */
-(void) activateCell : (MultiActionsTableViewCell *) multiActionsTableViewCell;

/**
 *Deselect the active cell.
 *@note active cell refers to the cell that currently show the actions view
 */
-(void) deactivateCell;

/**
 *Each action from the UIActionButton ENUM should have a corresponding function
 */
@optional
-(void) deleteButtonTouched;
-(void) showMoreButtonTouched;
-(void) contactButtonTouched;


@end
