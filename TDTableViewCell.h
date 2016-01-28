//
//  TDTableViewCell.h
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDoEntity.h"

@interface TDTableViewCell : UITableViewCell

@property (strong, nonatomic) ToDoEntity *localToDoEntity;

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelPrio;

- (void)setInternalFields:(ToDoEntity *)incoming;

@end
