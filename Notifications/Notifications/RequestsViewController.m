//
//  RequestsViewController.m
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "RequestsViewController.h"

@interface RequestsViewController ()

@end

@implementation RequestsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Requests";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end