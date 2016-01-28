//
//  TDNavigationController.h
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TDHandlesMOC.h"

@interface TDNavigationController : UINavigationController <TDHandlesMOC>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
