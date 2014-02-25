//
//  AppDelegate.m
//  Notifications
//
//  Created by Matej Hrescak on 2/21/14.
//  Copyright (c) 2014 hrescak. All rights reserved.
//

#import "AppDelegate.h"
#import "NewsFeedViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"
#import "MoreViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    
    NewsFeedViewController *newsFeedViewController = [[NewsFeedViewController alloc] init];
    UINavigationController *newsfeedNavigationController = [[UINavigationController alloc] initWithRootViewController:newsFeedViewController];
    newsfeedNavigationController.tabBarItem.title = @"News Feed";
    newsfeedNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_feedicon_normal"];
    
    RequestsViewController *requestsViewController = [[RequestsViewController alloc] init];
    UINavigationController *requestsNavigationController = [[UINavigationController alloc] initWithRootViewController:requestsViewController];
    requestsNavigationController.tabBarItem.title = @"Requests";
    requestsNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_requestsicon_normal"];
    
    MessagesViewController *messagesViewController = [[MessagesViewController alloc] init];
    UINavigationController *messagesNavigationController = [[UINavigationController alloc] initWithRootViewController:messagesViewController];
    messagesNavigationController.tabBarItem.title = @"Messages";
    messagesNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_messagesicon_normal"];
    
    NotificationsViewController *notificationsViewController = [[NotificationsViewController alloc] init];
    UINavigationController *notificationsNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationsViewController];
    notificationsNavigationController.tabBarItem.title = @"Notifications";
    notificationsNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_notificationsicon_normal"];
    
    MoreViewController *moreViewController = [[MoreViewController alloc] init];
    UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:moreViewController];
    moreNavigationController.tabBarItem.title = @"More";
    moreNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_moreicon_normal"];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.29 green:0.50 blue:0.89 alpha:1.0];
    tabBarController.viewControllers = @[newsfeedNavigationController, requestsNavigationController, messagesNavigationController, notificationsNavigationController, moreNavigationController];
    
    self.window.rootViewController = tabBarController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
