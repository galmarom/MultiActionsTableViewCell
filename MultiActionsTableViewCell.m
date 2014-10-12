//
//  UITableViewCell+TableViewCellWithRightButtons.m
//  Venue10
//
//  Created by galmarom on 10/11/14.
//  Copyright (c) 2014 galmarom. All rights reserved.
//

#import "MultiActionsTableViewCell.h"
#define BUTTON_WIDTH 100
#define SHOW_OR_HIDE_BUTTONS_ANIMATION_LENGTH 0.5f


@interface MultiActionsTableViewCell()
{
    NSUInteger numberOfActionButtons;
    id<ActionButtonsDelegate> actionButtonsDelegate;
}

-(void) respondToPanGesture: (UIPanGestureRecognizer *) panGestureRecognizer;
@end

@implementation MultiActionsTableViewCell


-(void) addButtonsToFrame:(NSArray *) actionButtonsArray delegate: (id<ActionButtonsDelegate>) delegate;
{
    actionButtonsDelegate = delegate;
    numberOfActionButtons = actionButtonsArray.count;
    
    //Creating a view with the action buttons to render behind the content view
    CGRect contentViewRect = self.contentView.frame;
    //creating the new view frame - the (-1) in the frame is because the content view has it's border
    UIView *buttonsView = [[UIView alloc] initWithFrame:CGRectMake(contentViewRect.origin.x, contentViewRect.origin.y, contentViewRect.size.width, contentViewRect.size.height-1)];
    buttonsView.clipsToBounds = TRUE;
    UITapGestureRecognizer *tapGestureRecognizer;
    for(int i=0;i < actionButtonsArray.count;i++)
    {
        UIActionButton title = (UIActionButton)[actionButtonsArray[i] intValue];
        UIButton *button = [[UIButton alloc] initWithFrame:
        CGRectMake(contentViewRect.size.width - BUTTON_WIDTH * (i+1),0,BUTTON_WIDTH,contentViewRect.size.height)];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //Adding the properties to the button - change here to your own action buttons
        switch (title) {
            case UIActionButtonDelete:
            {
                [button setTitle:@"Delete" forState:UIControlStateNormal];
                [button setBackgroundColor:[UIColor redColor]];
                tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:actionButtonsDelegate action:@selector(deleteButtonTouched)];
                break;
            }
            case UIActionButtonContact:
            {
                [button setTitle: @"Contact" forState: UIControlStateNormal];
                tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:actionButtonsDelegate action:@selector(contactButtonTouched)];
                [button setBackgroundColor:[UIColor lightGrayColor]];
                break;
            }
            default: //UIActionButtonMore
            {
                [button setTitle: @"Show\nMore" forState: UIControlStateNormal];
                tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:actionButtonsDelegate action:@selector(showMoreButtonTouched)];
                [button setBackgroundColor:[UIColor lightGrayColor]];
                break;
            }
        }
        //Adding the tapGestureRecognizer to the button - upon click a message will be sent to the actionButtonsDelegate
        [button addGestureRecognizer:tapGestureRecognizer];
        [buttonsView addSubview:button];
    }
    
    //Arrange the subviews that the buttons view will be rendered at the back and the contentView at the front
    [self addSubview:buttonsView];
    [self sendSubviewToBack:buttonsView];
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self bringSubviewToFront:self.contentView];
    
    //Adding
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(respondToPanGesture:)];
    [self.contentView addGestureRecognizer:panGesture];
}

-(void) respondToPanGesture: (UIPanGestureRecognizer *) panGestureRecognizer
{
    CGPoint velocity = [panGestureRecognizer velocityInView:self];
    //The user scroll vertically
    if(fabs(velocity.y) > fabs(velocity.x))
    {
        return;
    }
    
    if(velocity.x  > 0 && self.contentView.frame.origin.x < 0)
    {
        //The user hide the cell - hide the cell if its the active one.
        [actionButtonsDelegate deactivateCell];
    }
    //show action buttons
    else if(velocity.x  < 0 && self.contentView.frame.origin.x == 0)
    {
        //Replace the active cell with the new
        [actionButtonsDelegate deactivateCell];
        [actionButtonsDelegate activateCell:self];
    }
}

/**
 *This method overrides setSelected 
 */
-(void) setActive:(BOOL)active
{
    CGSize contentViewSize = self.contentView.frame.size;
    if(active)
    {
        //show action buttons
        int newPosX = (int)-numberOfActionButtons * BUTTON_WIDTH;
        [UIView animateWithDuration:SHOW_OR_HIDE_BUTTONS_ANIMATION_LENGTH animations:^{
            self.contentView.frame = CGRectMake(newPosX, 0, contentViewSize.width, contentViewSize.height);
        }];
    }
    else
    {
        //hide action buttons
        [UIView animateWithDuration:SHOW_OR_HIDE_BUTTONS_ANIMATION_LENGTH animations:^{
            self.contentView.frame = CGRectMake(0, 0, contentViewSize.width, contentViewSize.height);
        }];
    }
}





@end
