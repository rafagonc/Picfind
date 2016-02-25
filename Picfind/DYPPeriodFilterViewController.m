//
//  DYPPeriodFilterViewController.m
//  Picfind
//
//  Created by Rafael Gonzalves on 2/23/16.
//  Copyright © 2016 Rafael Gonzalves. All rights reserved.
//

#import "DYPPeriodFilterViewController.h"
#import "UIStaticTableView.h"
#import "DYPDateCell.h"
#import "DYPValidation.h"
#import "DYPPeriodFilter.h"
#import "UIViewController+NotificationShow.h"
#import "DYPFilterFactory.h"

@interface DYPPeriodFilterViewController ()

#pragma mark - ui
@property (weak, nonatomic) IBOutlet UIStaticTableView *tableView;
@property (weak, nonatomic)          DYPDateCell * firstDateCell;
@property (weak, nonatomic)          DYPDateCell * lastDateCell;

#pragma mark - injected
@property (setter=injected_period:,readonly) id<DYPValidation> periodValidator;
@property (setter=injected:,readonly) id<DYPFilterFactory> filterFactory;

@end

@implementation DYPPeriodFilterViewController

#pragma mark - constructor
-(instancetype)init {
    if (self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil]) {
        
    } return self;
}

#pragma mark - lifecycle
-(void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Period Filter"];
    [self createTableView];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIBarButtonItem * applyItem = [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStylePlain target:self action:@selector(applyAction:)];
    [self.navigationItem setRightBarButtonItem:applyItem];
}
-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.firstDateCell becomeFirstResponder];
}

#pragma mark - table view
-(void)createTableView {
    UIStaticTableViewSection *section = [[UIStaticTableViewSection alloc] init];
    [section setHeaderName:@"Search photos in a specific period"];
    
    DYPDateCell *firstDateCell = [[DYPDateCell alloc] initWithPlaceholder:@"From"];
    [self.tableView addCell:firstDateCell onSection:section];
    [self setFirstDateCell:firstDateCell];
    
    DYPDateCell *lastDateCell = [[DYPDateCell alloc] initWithPlaceholder:@"To"];
    [self.tableView addCell:lastDateCell onSection:section];
    [self setLastDateCell:lastDateCell];
    
    [self.tableView addSection:section];
}

#pragma mark - create
-(id<DYPFilter>)createPeriodFilterWithError:(NSError **)error {
    id<DYPFilter> periodFilter = [self.filterFactory periodFilterFrom:[self.firstDateCell date] to:[self.lastDateCell date]];
    if ([self.periodValidator validate:periodFilter error:error] == NO) {
        return nil;
    }
    return periodFilter;
}

#pragma mark - actions
-(void)applyAction:(UIBarButtonItem *)item {
    NSError *error;
    id<DYPFilter> periodFilter = [self createPeriodFilterWithError:&error];
    if (error) {
        [self showNotificationWithType:SHNotificationViewTypeError withMessage:error.localizedDescription];
    } else {
        [self.delegate source:self didCreateFilter:periodFilter];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - dealloc
-(void)dealloc {
    
}

@end
