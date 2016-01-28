//
//  TDHandlesToDoEntity.h
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity.h"

@protocol TDHandlesToDoEntity <NSObject>

- (void)receiveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end
