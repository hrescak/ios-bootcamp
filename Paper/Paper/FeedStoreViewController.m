//
//  FeedStoreViewController.m
//  Paper
//
//  Created by Matej Hrescak on 3/8/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "FeedStoreViewController.h"

@interface FeedStoreViewController ()

@end

@implementation FeedStoreViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
