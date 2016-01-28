//
//  TDTableViewController.h
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDHandlesMOC.h"
#import "TDHandlesToDoEntity.h"
#import "ToDoEntity.h"

@interface TDTableViewController : UITableViewController <TDHandlesMOC, TDHandlesToDoEntity>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;
- (void)receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end
