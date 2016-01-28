//
//  ToDoEntity+CoreDataProperties.h
//  ToDoList
//
//  Created by Sonja Riethig on 28/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ToDoEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface ToDoEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *priority;
@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *where;

@end

NS_ASSUME_NONNULL_END
