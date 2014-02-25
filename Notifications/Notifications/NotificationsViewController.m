//
//  NotificationsViewController.m
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "NotificationsViewController.h"
#import "NotificationCell.h"
#import "Notification.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *notifications;
@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.notifications = [Notification fakeNotifications];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Notifications";
    
    //left button
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_search"] style:UIBarButtonItemStylePlain target:self action:nil];
    searchItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -4;
    [self.navigationItem setLeftBarButtonItems:@[negativeSpacer, searchItem]];
    
    //right navbar button
    UIBarButtonItem *diveBarItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_divebar"] style:UIBarButtonItemStylePlain target:self action:nil];
    diveBarItem.tintColor = [UIColor whiteColor];

    [self.navigationItem setRightBarButtonItems:@[diveBarItem, negativeSpacer]];
    
    //table view setup
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 81;
    
    UINib *notificationCellNib = [UINib nibWithNibName:@"NotificationCell" bundle:nil];
    [self.tableView registerNib:notificationCellNib forCellReuseIdentifier:@"NotificationCell" ];
    // Do any additional setup after loading the view from its nib.
}

# pragma mark - TableView methods

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NotificationCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    Notification *notification = self.notifications[indexPath.row];
    [cell setUpWithNotification:notification];
    
    return cell;
}

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notifications.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
