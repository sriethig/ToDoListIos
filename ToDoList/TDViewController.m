//
//  TDViewController.m
//  ToDoList
//
//  Created by Sonja Riethig on 27/01/16.
//  Copyright © 2016 Sonja Riethig. All rights reserved.
//

#import "TDViewController.h"
#import "ToDoEntity.h"

@interface TDViewController ()

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;

@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlace;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPriority;

@property (nonatomic, assign) BOOL wasDeleted;

@end

@implementation TDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.wasDeleted = NO;
    
    self.textFieldTitle.text  = self.localToDoEntity.title;
    self.textFieldPlace.text = self.localToDoEntity.where;
    self.textFieldPriority.text = [self.localToDoEntity.priority stringValue];
}

- (void)viewWillDisappear:(BOOL)animated {
    /*if (self.wasDeleted == NO) {
        NSString *titleString = self.textFieldTitle.text;
        if (titleString.length > 16) {
            titleString = [titleString substringToIndex:15];
        }
        self.localToDoEntity.title = titleString;
        
        self.localToDoEntity.where = self.textFieldPlace.text;
        
        NSString *prioString = self.textFieldPriority.text;
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        NSNumber *number = [numberFormatter numberFromString:prioString];
        if ([number intValue] < 0) {
            number = [numberFormatter numberFromString:@"0"];
        }
        if ([number intValue] > 3) {
            number = [numberFormatter numberFromString:@"3"];
        }
        self.localToDoEntity.priority = number;
        
        [self saveData];
    }*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidEndEditing:) name:UITextViewTextDidEndEditingNotification object:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)textFieldTitleEditingDidEnd:(id)sender {
    
    NSString *titleString = self.textFieldTitle.text;
    
    if (titleString.length > 16) {
        titleString = [titleString substringToIndex:15];
    }
    
    self.localToDoEntity.title = titleString;
    [self saveData];
    
}

- (IBAction)textFieldPlaceEditingDidEnd:(id)sender {
    self.localToDoEntity.where = self.textFieldPlace.text;
    [self saveData];
}

- (IBAction)textFieldPriorityEditingDidEnd:(id)sender {

    NSString *prioString = self.textFieldPriority.text;
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber *number = [numberFormatter numberFromString:prioString];
    
    if ([number intValue] < 0) {
        number = [numberFormatter numberFromString:@"0"];
    }
    if ([number intValue] > 3) {
        number = [numberFormatter numberFromString:@"3"];
    }
    
    self.localToDoEntity.priority = number;
    
    [self saveData];
}

- (void)saveData {
    NSError *error;
    BOOL saveSuccess = [self.context save:&error];
    if(!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"couldn't save data" userInfo:@{NSUnderlyingErrorKey:error}];
    } else {
        //error
    }
}

- (IBAction)buttonTrashPressed:(id)sender {
    self.wasDeleted = YES;
    
    [self.context deleteObject:self.localToDoEntity];
    [self saveData];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark TDHandlesMOC

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.context = incomingMOC;
}

#pragma mark TDHandlesEntity

- (void)receiveToDoEntity:(ToDoEntity *)incomingEntity {
    self.localToDoEntity = incomingEntity;
}

@end
