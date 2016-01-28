//
//  TDNavigationController.m
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import "TDNavigationController.h"

@interface TDNavigationController ()

@property (strong, nonatomic) NSManagedObjectContext *context;

@end

@implementation TDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TDHandlesMOC

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.context = incomingMOC;
    id <TDHandlesMOC> child = (id <TDHandlesMOC>) self.viewControllers[0];
    [child receiveMOC:self.context];
}

@end
