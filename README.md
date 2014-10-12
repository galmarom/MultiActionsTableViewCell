MultiActionsTableViewCell
=========================

This is a simple implementation for a UITableViewCell containing multiple actions (More, Archive, Edit) etc. 

Follow the instructions and you'll have this functionallity in a second:

1- Add the following files to your project: 
    
      * MultiActionsTableViewCell
      * ActionButtonsDelegate
      * MultiActionsCellsTableViewController
      
2- Each UITableViewController that implements this functionallity should inherit from "MultiActionsCellsTableViewController"
    
```objective-c
@interface MyTableViewController : MultiActionsCellsTableViewController
```
3- Change the functions and the enum at ActionButtonsDelegate to serve your own needs (each enum has to have a method)
```objective-c

    typedef NS_ENUM(NSInteger, UIActionButton)
    {
        UIActionButtonEdit,
    } ;
    @optional
    -(void) editButtonTouched;
```

4- At your UITableViewController make sure you add the necessary actions to the cell:
 at the function:
```objective-c
    -(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
```

    you should add "actionsArray" this way: (according to your needs):
    
```objective-c
    MultiActionsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSArray *actionArray = @[@(UIActionButtonEdit)];
    [cell addButtonsToFrame:actionArray withDelegate:self];
```

5- AT MultiActionsTableViewCell change the switch to support you new actions:
```objective-c
    switch (title)
    {
        case UIActionButtonEdit:
        {
          [button setTitle:@"Edit" forState:UIControlStateNormal];
          [button setBackgroundColor:[UIColor redColor]];
          tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:actionButtonsDelegate action:@selector(editButtonTouched)];
          break;
        }
                
      }

```
6- Make sure in your storyboard that you cell inherit either directly from MultiActionsTableViewCell (this way you can use the      basic views that supply with UITableView) or from a class that inherit from MultiActionsTableViewCell. 
  Also make sure your cell identifier is correct and that the TableViewController inherits from your custom class.


