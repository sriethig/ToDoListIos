//
//  TDTableViewCell.m
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import "TDTableViewCell.h"

@implementation TDTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setInternalFields:(ToDoEntity *)incoming {
    self.labelTitle.text = incoming.title;
    self.labelPrio.text = [incoming.priority stringValue];
    self.localToDoEntity = incoming;
}

@end
